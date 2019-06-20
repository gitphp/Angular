#!/bin/bash

docker restart p2p_escrow
pipework-eth1 br0 p2p_escrow 192.168.99.21/24@192.168.99.1
pipework-eth2 br1 p2p_escrow 10.0.2.21/24@10.0.2.1
docker exec -it p2p_escrow /bin/bash
