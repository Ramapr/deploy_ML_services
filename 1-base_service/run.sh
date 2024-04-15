#!/usr/bin/env bash

base_port = 5000

for i in {1..2}
    port = $base_port+$1
    echo port
    do docker run —-name "server-r${i}" -d -e REPLICA_NAME="replica-${i}" -e PORT=port -p port:5000 server:new
    sleep 3
done
