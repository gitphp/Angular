#!/bin/bash

docker restart mjngs
pipework-eth1 br0 mjngs 192.168.99.26/24@192.168.99.1
pipework-eth2 br1 mjngs 10.0.2.26/24@10.0.2.1
docker exec -it mjngs /bin/bash
