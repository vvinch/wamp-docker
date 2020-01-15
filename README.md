# wamp-docker

## Settings

The parameters are defined in the _**settings**_ file:

| Parameter           | Description                      | Default value |
| --------------------|----------------------------------|---------------|
| SITE\_PORT          | Web Server listening port        | 80            |
| SITE\_PATH          | Path to Web Site root folder     |               |
| LOG\_PATH           | Path to Web Site log files       |               |
| SQL\_PATH           | Path where to store databases    | mariadb-volume (Docker volume)|
| SQL\_ROOT\_PASSWORD | Password of database root user   |               |
| SQL\_USER           | Name of database custom user     |               |
| SQL\_PASS           | Password of database custom user |               |
| ADMINER\_PORT       | Adminer listening port           | 81            |
| ADMINER\_THEME      | Name of Adminer visual theme     | nette         |

## Start the services

Execute the following command:
`./run.sh`

## Stop the services

Execute the following command:
`./stop.sh`

