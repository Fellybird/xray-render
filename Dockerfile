FROM alpine:latest
RUN apk add --no-cache curl unzip ca-certificates && curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v25.9.11/Xray-linux-64.zip && mkdir -p /usr/local/bin && unzip -o /tmp/xray.zip -d /usr/local/bin/ && chmod +x /usr/local/bin/xray && rm /tmp/xray.zip
COPY config.json.template /config.json.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
