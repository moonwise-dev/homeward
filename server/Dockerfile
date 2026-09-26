FROM gcr.io/distroless/cc-debian12:nonroot

WORKDIR /app
COPY server/build/server /app/server
COPY server/prompts /app/prompts

ENV HOMEWARD_LOG_FORMAT=json
ENV HOMEWARD_PROMPTS_DIR=/app/prompts
EXPOSE 8080

ENTRYPOINT ["/app/server"]
