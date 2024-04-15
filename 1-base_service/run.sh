#!/usr/bin/env bash
base_port=5000

for i in {1..2}; do
    port=$base_port+$i
    docker run —-name "server-${i}" -d -e REPLICA_NAME="replica-${i}" -e PORT=port -p port:5000 server:new
    sleep 3    
done
