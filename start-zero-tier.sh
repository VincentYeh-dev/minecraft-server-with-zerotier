#!/bin/bash
/usr/sbin/zerotier-one -d
/usr/sbin/zerotier-cli join $NETWORK_ID
/usr/sbin/zerotier-cli listnetworks >> /start_zero_tier_logs.txt
