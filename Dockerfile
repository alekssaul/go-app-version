FROM golang:latest as builder
WORKDIR /go/src/github.com/alekssaul/go-app-version/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o server .
RUN mkdir /app && \
	mv server /app

FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app .
CMD /app/server
EXPOSE 8080