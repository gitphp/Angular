#!/bin/bash

docker restart p2p_activity
pipework-eth1 br0 p2p_activity 192.168.99.27/24@192.168.99.1
pipework-eth2 br1 p2p_activity 10.0.2.27/24@10.0.2.1
docker exec -it p2p_activity /bin/bash
