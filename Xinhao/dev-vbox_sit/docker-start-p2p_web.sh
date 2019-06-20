#!/bin/bash

docker restart p2p_web
pipework-eth1 br0 p2p_web 192.168.99.25/24@192.168.99.1
pipework-eth2 br1 p2p_web 10.0.2.25/24@10.0.2.1
docker exec -it p2p_web /bin/bash
