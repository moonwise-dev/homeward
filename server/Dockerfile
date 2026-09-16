FROM gcr.io/distroless/cc-debian12:nonroot

WORKDIR /app
COPY server/build/server /app/server

ENV HOMEWARD_LOG_FORMAT=json
EXPOSE 8080

ENTRYPOINT ["/app/server"]
