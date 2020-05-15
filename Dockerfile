FROM golang:alpine
WORKDIR /app
COPY example1 ./
EXPOSE 9090
CMD ["./example1"]
