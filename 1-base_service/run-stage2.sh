#!/usr/bin/env bash

docker run --name "server-1" -d --env REPLICA_NAME="replica-1" --env PORT=5001 -p 5001:5000 server:new
docker run --name "server-2" -d --env REPLICA_NAME="replica-2" --env PORT=5002 -p 5002:5000 server:new
docker run --name "server-3" -d --env REPLICA_NAME="replica-3" --env PORT=5003 -p 5003:5000 server:new
