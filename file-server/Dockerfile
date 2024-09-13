# Go build stage
FROM golang:1.14.0-alpine3.11 as build

RUN apk add --no-cache build-base

WORKDIR /simple-file-server

ADD go.mod .
RUN go mod download

COPY ./src /simple-file-server
WORKDIR /simple-file-server
# RUN go test
RUN go build -o /usr/bin/simple-file-server

# Run stage
FROM alpine:3.11

ENV LOG_LEVEL 'info'
ENV WRITE_SHARED_KEY ''
ENV READ_SHARED_KEY ''
ENV LOCATION_BASE_URL ''
ENV DATA_DIR '/data'

COPY --from=build /usr/bin/simple-file-server /usr/bin/simple-file-server
COPY startup.sh /

RUN chmod +x /startup.sh
CMD [ "/startup.sh" ]

