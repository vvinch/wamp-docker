#!/bin/bash

set -a
source settings
set +a

docker-compose -f ./compose/wamp.yml -p wamp build

