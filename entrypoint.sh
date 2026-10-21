#!/bin/sh
UUID="${UUID:?UUID env required}"
PORT="${PORT:-10000}"
WS_PATH="${WS_PATH:-/vless}"
sed -e "s|__UUID__|${UUID}|g" -e "s|__PORT__|${PORT}|g" -e "s|__WSPATH__|${WS_PATH}|g" /config.json.template > /config.json
exec /usr/local/bin/xray run -config /config.json
