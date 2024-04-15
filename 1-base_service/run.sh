#!/usr/bin/env bash

base_port=5000

for i in {1..3}; do
    port=`expr $base_port + $i`
    echo $port
    docker run --name "server-${i}" -d --env REPLICA_NAME="replica-${i}" --env PORT=$port -p $port:5000 server:new
    sleep 3
done
