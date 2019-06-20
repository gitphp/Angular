#!/bin/bash

#docker restart tengine
pipework-eth1 br0 tengine 192.168.99.197/24@192.168.99.1
pipework-eth2 br1 tengine 10.0.2.197/24@10.0.2.1
docker exec -it tengine /bin/bash
