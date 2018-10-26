Aurora-pgpool is a dockerized version of pgpool II that I made for use with AWS Aurora. It uses the following environment variables:

$PGMASTER_HOST = hostname or address for Master (Write)
$PGREADER_HOST = hostname or address for Read replica or AWS Aurora read endpoint
$PGMASTER_PORT = 5432
$PGREADER_PORT = 5432
$PGPASSWORD = yourpassword
$PGUSER = youruser
$PGALLOWED_SUBNET = Subnet you want to allow access from. Use 0.0.0.0/0 for any

The Docker file copies in the included config. If you want to make any other changes in config dynamically you can easily use sed the same way I did to make changes based on environment variables.

