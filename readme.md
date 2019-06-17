Docker base image with golang for skywire installation

### Run Docker

```
docker run -it --net host skywirex/alpine-golang:arm64  /bin/sh
```

### Install skywire

```
cd
mkdir -p go/src/github.com/skycoin
go get -u github.com/skycoin/skywire/cmd/...
```

### Start the Skywire Manager

```
sh -l
cd $GOPATH/bin
nohup ./skywire-manager -web-dir ${GOPATH}/src/github.com/skycoin/skywire/static/skywire-manager > /dev/null 2>&1 & echo $! > manager.pid
```

### Start first Skywire node and connect to the Manager

```
# Open a new terminal to the same container:

docker exec -it <container_id> /bin/sh

# Start the Skywire node and connect it to the manager

sh -l
cd $GOPATH/bin
nohup ./skywire-node -connect-manager -manager-address :5998 -manager-web :8000 -discovery-address discovery.skycoin.net:5999-034b1cd4ebad163e457fb805b3ba43779958bba49f2c5e1e8b062482904bacdb68 -address :5000 -web-port :6001 > /dev/null 2>&1 & echo $! > node.pid
```

### Build command

If you build on aarch64 machine, run

```bash
docker build --no-cache -t="skywirex/alpine-golang:arm64" .
```