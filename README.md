# wamp-docker

## Settings

Modify the **settings** file:

| Parameter           | Description                      |
| --------------------|----------------------------------|
| SITE\_PORT          | Web Server listening port        |
| ADMIN\_PORT         | Adminer listening port           |
| SITE\_PATH          | Path to Web Site root folder     |
| LOG\_PATH           | Path to Web Site log files       |
| SQL\_PATH           | Path where to store databases    |
| SQL\_ROOT\_PASSWORD | Password of database root user   |
| SQL\_USER           | Name of database custom user     |
| SQL\_PASS           | Password of database custom user |
| ADMINER\_THEME      | Name of Adminer visual theme     |

## Start the services

Execute the following command:
`./run.sh`

## Stop the services

Execute the following command:
`./stop.sh`

