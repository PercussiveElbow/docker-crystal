FROM crystallang/crystal:nightly-alpine-build AS builder
RUN crystal -v
RUN apk --no-cache add ca-certificates
RUN apk update && apk upgrade
COPY ./ /app
WORKDIR /app
RUN shards install --ignore-crystal-version
RUN crystal build --static --error-trace /app/src/docker.cr
FROM ubuntu:latest
WORKDIR  /app
COPY --from=builder  /app/docker /app/docker
COPY --from=builder /etc/ssl/certs /etc/ssl/certs
RUN useradd -ms /bin/bash notroot
RUN ln -s /etc/ssl/certs/ca-certificates.crt /etc/ssl/cert.pem
# RUN chown -R notroot:notroot /app
# USER notroot
ENTRYPOINT ./docker
