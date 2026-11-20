# Qlink for AI agents

Qlink connects your AI agent (Claude, ChatGPT, Gemini) to your QuickBooks Online
company, so you can do everyday bookkeeping in plain language: record expenses
and income, create and look up invoices, manage customers and vendors, categorize
bank transactions and run reports.

This repository holds the Qlink plugins. Each plugin declares one remote MCP
server (`https://qlink.hdcola.org/mcp`) and ships the same five skills. There is
no backend in this repository.

- **Closed beta.** Only invited users can connect a QuickBooks company. Sign up at
  https://qlink.hdcola.org.
- **You stay in control.** You sign in with Intuit and choose one company. Qlink does not store your
  QuickBooks data. Deleting and voiding can be turned off per company.
- Step-by-step setup: https://qlink.hdcola.org/en/agents/
- In Claude Code: `/plugin install qlink --marketplace hdcola/qlink-plugins`
- Privacy policy: https://qlink.hdcola.org/en/privacy/ , terms: https://qlink.hdcola.org/en/terms/
- Support: open an [issue](https://github.com/hdcola/qlink-plugins/issues) or write to privacy@hdcola.org.

QuickBooks is a registered trademark of Intuit Inc. Qlink is not affiliated with
or endorsed by Intuit.

## For developers

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

### Claude, website or desktop app (tested)

1. Open https://claude.ai/customize/plugins/yours (in the desktop app: Customize in the left menu), then **Plugins**.
2. **Add** → **Add marketplace**, enter `hdcola/qlink-plugins` and click **Sync**.
3. In **Discover**, find Qlink and click **Add**.
4. Open the plugin's **Connectors** tab, click **Add** (keep the detected sign-in settings), then **Connect**, sign in with Intuit and choose the company.

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
