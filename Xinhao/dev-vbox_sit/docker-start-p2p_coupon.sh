#!/bin/bash

docker restart p2p_coupon
pipework-eth1 br0 p2p_coupon 192.168.99.24/24@192.168.99.1
pipework-eth2 br1 p2p_coupon 10.0.2.24/24@10.0.2.1
docker exec -it p2p_coupon /bin/bash
