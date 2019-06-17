FROM alpine:3.9

RUN apk update && \
    apk add go && \
    apk add musl-dev && \
    apk add make && \
    cd
## Add the following line "export GOPATH=$HOME/go" and save
RUN printf "export GOPATH=$HOME/go"  >> /etc/profile
 