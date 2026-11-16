#!/usr/bin/env bash
# Point all three plugins at another MCP endpoint, e.g. scripts/set-endpoint.sh https://qboc.hdcola.org/mcp
set -euo pipefail
cd "$(dirname "$0")/.."
url="${1:?usage: set-endpoint.sh <mcp-url>}"
sed -i.bak -E "s#(\"url\": \")[^\"]+#\1$url#" claude/.mcp.json codex/mcp.json
sed -i.bak -E "s#(\"serverUrl\": \")[^\"]+#\1$url#" antigravity/mcp_config.json
rm -f claude/.mcp.json.bak codex/mcp.json.bak antigravity/mcp_config.json.bak
