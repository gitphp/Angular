#!/bin/bash

docker restart p2p_stats
pipework-eth1 br0 p2p_stats 192.168.99.23/24@192.168.99.1
pipework-eth2 br1 p2p_stats 10.0.2.23/24@10.0.2.1
docker exec -it p2p_stats /bin/bash
