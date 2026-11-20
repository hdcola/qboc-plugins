# qlink-plugins

Plugins that connect AI agents to QuickBooks Online through the
[Qlink](https://qlink.hdcola.org).

Each plugin declares one remote MCP server and ships the same five skills.
There is no backend in this repository.

## Status

Tested in the Claude desktop app and the ChatGPT desktop app (Codex). Gemini needs no plugin: add the MCP address as a custom app. The endpoint is
`https://qlink.hdcola.org/mcp` (closed beta). To test against the Intuit sandbox instead, run
`scripts/set-endpoint.sh https://sandbox.qlink.hdcola.org/mcp`. Design and
findings from the official docs live in the
[website repository](https://github.com/hdcola/QuickBooksConnectSite) (`docs/plugin-design.md`, `docs/plugin-p0.md`).

## Layout

```
skills/          shared skills (the single source)
claude/          Claude plugin        (.claude-plugin/plugin.json, .mcp.json)
codex/           Codex plugin         (.codex-plugin/plugin.json, .mcp.json)
.claude-plugin/marketplace.json     Claude marketplace
.agents/plugins/marketplace.json    Codex marketplace
scripts/sync-skills.sh              copy skills/ into each plugin (--check for CI)
scripts/set-endpoint.sh <mcp-url>   point all three plugins at another endpoint
```

Edit skills only in `skills/`, then run `scripts/sync-skills.sh`.

## Install

### Claude desktop app (tested)

1. Cowork tab → Customize → Browse plugins → Personal → **+** → Add marketplace from GitHub → `hdcola/qlink-plugins`.
2. Install `qlink`. You get five skills and one connector.
3. The connector is not added automatically: click **Add**, then **Connect**, and sign in with Intuit.

### ChatGPT desktop app, including Codex (tested)

1. Plugin settings → add the marketplace `hdcola/qlink-plugins`.
2. Open the plugin and click **Install plugin**. You get five skills and one MCP server.
3. Open the MCP server settings and authorize with Intuit.

Codex uses the compatibility layout (`.codex-plugin/plugin.json` with `"mcpServers": "./.mcp.json"`), as OpenAI's own plugins do. The portable root `mcp.json` was not picked up.

Antigravity: not supported. Its desktop app installs plugins through the
command line tool and only from its official marketplace, which we are not in.

## Skills

`record-expense`, `create-invoice`, `categorize-transactions`, `run-reports`,
`safe-delete-and-void`. Tool names are those of the Qlink MCP server
(`worker/mcp/` in the website repository); update the skills when tools change.

## Validate

```
claude plugin validate .
claude plugin validate ./claude
```

Codex has no validate command; it validates on upload.

Codex uses the compatibility layout (`.codex-plugin/plugin.json` with `"mcpServers": "./.mcp.json"`), the same as OpenAI's own plugins: the desktop app did not pick up the portable root `mcp.json`.

## Closed beta

Only invited users can connect their QuickBooks company. Sign up at
https://qlink.hdcola.org.

## Disclaimer

QuickBooks is a registered trademark of Intuit Inc. This project is not
affiliated with or endorsed by Intuit.
