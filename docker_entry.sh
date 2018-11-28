#!/bin/sh

if [ -z $PGMASTER_HOST ]; then
	echo "MASTER_HOST EMPTY" && exit 1
fi

if [ -z $PGREADER_HOST ]; then
	echo "READER_HOST EMPTY" && exit 1
fi

if [ -z $PGMASTER_PORT ]; then
	echo "MASTER_PORT EMPTY" && exit 1
fi

if [ -z $PGREADER_PORT ]; then
	echo "READER_PORT EMPTY" && exit 1
fi

if [ -z $PGALLOWED_SUBNET ]; then
	echo "SUBNET EMPTY" && exit 1
fi

if [ ! -f /etc/pgpool.conf ]; then
	echo "/etc/pgpool.conf not found" && exit 1
fi

sed -i "s/%%MASTER_ENDPOINT%%/${PGMASTER_HOST}/g" /etc/pgpool.conf && \
sed -i "s/%%READER_ENDPOINT%%/${PGREADER_HOST}/g" /etc/pgpool.conf && \
sed -i "s/%%MASTER_PORT%%/${PGMASTER_PORT}/g" /etc/pgpool.conf && \
sed -i "s/%%READER_PORT%%/${PGREADER_PORT}/g" /etc/pgpool.conf && \
echo "host all all ${PGALLOWED_SUBNET} md5" >/etc/pool_hba.conf &&

if [ $? -gt 0 ]; then
	echo "Could not set config variables" && exit 1
fi

FILE=$(env|grep PGUSER|sed -e 's#^.*=##g' -e 's#/# #g')
while read line; do
  pg_md5 -m -u $line
done <<EOF
$FILE
EOF


/usr/bin/pgpool -n -f /etc/pgpool.conf -a /etc/pool_hba.conf 2>&1
