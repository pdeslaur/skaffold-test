FROM golang:1.10 as builder
COPY main.go .
RUN go build -o /app main.go

FROM gcr.io/distroless/base
COPY --from=builder /app .
CMD ["./app"]
