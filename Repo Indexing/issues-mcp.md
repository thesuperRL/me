# issues-mcp (PR Reviews MCP Server)

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A Python MCP (Model Context Protocol) server for Cursor that exposes tools to inspect GitHub and Codeberg pull requests: fetching review comments, change requests, and conversations, plus a built-in diff viewer that renders PR or local git diffs as GitHub-style HTML in the browser.
**Language(s):** Python
**Active period:** 2026-06-24 - 2026-06-25
**Fork of:** Original

## Design Decisions

- MCP server pattern: a single `server.py` in the `pr_reviews_mcp` package exposes four tools over the MCP protocol: `check_pr_reviews`, `get_pr_status`, `view_diff`, and `view_local_diff`.
- `view_diff` and `view_local_diff` render diffs as HTML opened in the system browser, not just text. A separate `show_local_changes.py` and `show_staged.py` handle local git state.
- Supports both GitHub (via `GITHUB_TOKEN`) and Codeberg (via `CODEBERG_TOKEN`); either token is sufficient for single-platform use.
- Configured for Cursor via `cursor-mcp-config.json`; can be run with `python -m pr_reviews_mcp.server` or via `uvx` for zero-install use.
- Server startup was refactored from a custom pattern to `asyncio.run()` in a later commit for cleaner lifecycle management.
- Ships with helper scripts (`show_commit.py`, `test_diff_viewer.py`, `test_local_diff.py`, `test_mcp.sh`, `test_platforms.py`) for local testing without a full MCP client.

## Ryan's Contributions

Ryan is the sole developer. Built in two days:

- `adc5aad 2026-06-24` - Initial PR Reviews MCP server with `check_pr_reviews` and `get_pr_status` tools for GitHub and Codeberg.
- `5753ee9 2026-06-25` - Add `view_diff` and `view_local_diff` tools: renders diffs as GitHub-style HTML in the browser.
- `d7e17d0 2026-06-25` - Update server startup to `asyncio.run()`, add local diff helper scripts (`show_local_changes.py`, `show_staged.py`).
- `6e40979 2026-06-25` - Refactor server startup pattern further.
- `d72b3c2 2026-06-25` - Improve diff link handling and commit viewer.

**Relationship to mcp-server:** Separate from the ScottyLabs `mcp-server` repo. This one is a personal tool for Ryan's own development workflow (reviewing PRs in Cursor); the other is a CMU services MCP deployed as a shared resource.
