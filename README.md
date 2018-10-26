<h1>Aurora-pgpool</h1>
<h3>A dockerized version of pgpool II that I made for use with AWS Aurora.</h3>

<h5>ENVIRONMENT VARIABLES:</h5>
<table>
  <tr><td><b>$PGMASTER_HOST</b></td><td>hostname or address for Master (Write)</td></tr>
  <tr><td><b>$PGREADER_HOST</b></td><td>hostname or address for Read replica or AWS Aurora read endpoint</td></tr>
  <tr><td><b>$PGMASTER_PORT</b></td><td>DB Master Port number</td></tr>
  <tr><td><b>$PGREADER_PORT</b></td><td>DB Reader endpoint port number</td></tr>
  <tr><td><b>$PGPASSWORD</b></td><td>Database Password</td></tr>
  <tr><td><b>$PGUSER</b></td><td>Database User</td></tr>
  <tr><td><b>$PGALLOWED_SUBNET</b></td><td>Subnet you want to allow access from. Use 0.0.0.0/0 for any</td></tr>
</table>  

The Docker file copies in the included config. If you want to make any other changes in config dynamically you can easily use sed the same way I did to make changes based on environment variables.

