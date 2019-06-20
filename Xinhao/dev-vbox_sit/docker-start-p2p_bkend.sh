#!/bin/bash

docker restart p2p_bkend
pipework-eth1 br0 p2p_bkend 192.168.99.22/24@192.168.99.1
pipework-eth2 br1 p2p_bkend 10.0.2.22/24@10.0.2.1
docker exec -it p2p_bkend /bin/bash
