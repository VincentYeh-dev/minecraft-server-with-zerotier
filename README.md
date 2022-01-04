# minecraft-server-with-zerotier

## Build Image
```shell=
sudo docker build -t minecraft-server-with-zerotier . --no-cache
```

## Run Container
### docker-compose.yml
```
version: '3.3'
services:
    minecraft-server:
        environment:
            - EULA=TRUE
            - MODE=creative
            - MAX_MEMORY=4G
            - VERSION=1.18.1
            - NETWORK_ID=[ZeroTier Network ID]
        network_mode: [NET]
        devices:
            - /dev/net/tun
        ports:
            - '25565:25565'
        container_name: [NAME]
        image: minecraft-server-with-zerotier
        cap_add:
            - NET_ADMIN
            - SYS_ADMIN
```

```
sudo docker-compose up -d
sudo docker exec mc /start-zero-tier.sh
```

## Network Isolation

```shell=
$ sudo iptables -I DOCKER-USER -i eno1 -s 192.168.0.0/24 -d 172.20.0.0/24 -j DROP
$ sudo iptables -I DOCKER-USER -i eno1 -s 192.168.0.1 -d 172.20.0.0/24 -j ACCEPT
$ sudo iptables -I DOCKER-USER -i eno1 -s 192.168.0.0/24 -d 172.20.0.0/24 -p tcp -m tcp --dport 25565 -j ACCEPT
$ sudo iptables -L DOCKER-USER -v
Chain DOCKER-USER (1 references)
 pkts bytes target     prot opt in     out     source               destination         
 352K   19M ACCEPT     tcp  --  eno1   any     192.168.0.0/24       172.20.0.0/24        tcp dpt:25565
   90  5778 ACCEPT     all  --  eno1   any     _gateway             172.20.0.0/24       
   30  2496 DROP       all  --  eno1   any     192.168.0.0/24       172.20.0.0/24       
3898K  969M RETURN     all  --  any    any     anywhere             anywhere            
```
