#!/usr/bin/env bash
# Point both plugins at another MCP endpoint, e.g. scripts/set-endpoint.sh https://qlink.hdcola.org/mcp
set -euo pipefail
cd "$(dirname "$0")/.."
url="${1:?usage: set-endpoint.sh <mcp-url>}"
sed -i.bak -E "s#(\"url\": \")[^\"]+#\1$url#" claude/.mcp.json codex/.mcp.json
rm -f claude/.mcp.json.bak codex/.mcp.json.bak
