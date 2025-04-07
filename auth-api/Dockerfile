#FIX DOCKERFILE OR RESOLVE PROPER VERSION
FROM golang:1.18 AS builder

WORKDIR /app

RUN go install github.com/golang/dep/cmd/dep@latest

COPY Gopkg.toml Gopkg.lock ./

RUN dep ensure --vendor-only

COPY . .

RUN go build -o auth-api

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/auth-api .

EXPOSE 8000

CMD ["./auth-api"]
