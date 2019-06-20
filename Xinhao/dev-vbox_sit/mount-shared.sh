#!/bin/bash

mount -t vboxsf docker-images /mnt/shared/docker-images
#mount -t vboxsf p2p_coupon /mnt/shared/p2p_coupon
#mount -t vboxsf p2p_escrow /mnt/shared/p2p_escrow
#mount -t vboxsf p2p_stats /mnt/shared/p2p_stats
#mount -t vboxsf p2p_web /mnt/shared/p2p_web
#mount -t vboxsf p2p_bkend /mnt/shared/p2p_bkend
#mount -t vboxsf apigateway /mnt/shared/apigateway
#mount -t vboxsf p2p_activity /mnt/shared/p2p_activity
#mount -t vboxsf my_p2p /mnt/shared/my_p2p

mount -t vboxsf mjngs /mnt/shared/mjngs
mount -t vboxsf sc_vip /mnt/shared/sc_vip

