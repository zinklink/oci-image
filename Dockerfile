FROM docker.io/library/golang:trixie AS builder

WORKDIR /src

RUN git clone https://github.com/prometheus/client_golang.git
WORKDIR /src/client_golang/examples/random

RUN CGO_ENABLED=0 go build -o /app/random .

## stage 2 ##

FROM docker.io/library/alpine:latest

WORKDIR /app

COPY --from=builder /app/random .

EXPOSE 8082
ENTRYPOINT ["./random"]
CMD ["-listen-address=:8082"]