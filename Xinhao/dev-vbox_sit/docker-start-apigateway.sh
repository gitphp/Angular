#!/bin/bash

docker restart apigateway
pipework-eth1 br0 apigateway 192.168.99.26/24@192.168.99.1
pipework-eth2 br1 apigateway 10.0.2.26/24@10.0.2.1
docker exec -it apigateway /bin/bash
