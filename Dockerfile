FROM golang:1.14

ENV ADDRESS "192.168.1.1"
ENV USER admin
ENV PASS admin
ENV PORT 9300

COPY . src/tplink_exporter/

RUN cd src/tplink_exporter && go get ./... && go build

CMD bin/tplink_exporter -a ${ADDRESS} -u ${USER} -w ${PASS} -v -p ${PORT}
