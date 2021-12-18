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
