#Aurora-pgpool
###A dockerized version of pgpool II that I made for use with AWS Aurora.

####ENVIRONMENT VARIABLES:
|  VARIABLE          | VALUE                                                            |
|-----------|--------|------------------------------------------------------------------|
| **$PGMASTER_HOST** | hostname or address for Master (Write)                           |
| **$PGREADER_HOST** | hostname or address for Read replica or AWS Aurora read endpoint |
| **$PGMASTER_PORT** | DB Master Port number                                            |
| **$PGREADER_PORT** | DB Reader endpoint port number                                   |
| **$PGPASSWORD**    | Database Password                                                |
| **$PGUSER**        | Database User                                                    |
| **$PGALLOWED_SUBNET** | Subnet you want to allow access from. Use 0.0.0.0/0 for any |

The Docker file copies in the included config. If you want to make any other changes in config dynamically you can easily use sed the same way I did to make changes based on environment variables. Things are left pretty much stock and created with the intention of managing a single database.
