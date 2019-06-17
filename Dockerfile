FROM alpine:3.9

RUN apk update && \
    apk add go && \
    apk add git
    
## Add the following line "export GOPATH=$HOME/go" and save
RUN cd && \
    printf "export GOPATH=$HOME/go"  >> /etc/profile

## Install compile tools
RUN apk add musl-dev && \
    apk add make
    

 