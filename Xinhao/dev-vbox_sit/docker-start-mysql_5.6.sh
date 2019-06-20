#!/bin/bash

docker restart mysql_5.6
pipework-eth1 br0 mysql_5.6 192.168.99.199/24@192.168.99.1
pipework-eth2 br1 mysql_5.6 10.0.2.199/24@10.0.2.1
docker exec -it mysql_5.6 /bin/bash
