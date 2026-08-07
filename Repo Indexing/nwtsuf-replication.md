# nwtsuf-replication

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A live replication of the indirect prompt injection attack scenarios from "Not What You've Signed Up For: Compromising Real-World LLM-Integrated Applications with Indirect Prompt Injection" (Greshake et al., 2023, arXiv:2302.12173). Uses a local Ollama-backed agent with an MCP server to demonstrate real injection attacks.
**Language(s):** Python
**Active period:** 2026-06-14 – 2026-06-14
**Fork of:** Original

## Design Decisions
- **Live attack demo, not a synthetic benchmark** — builds a real MCP server with real tool calls (web search, email reading, code execution) and injects adversarial payloads into the tool-returned data
- Uses **Ollama** with `llama3.2:3b` running locally — open-source, offline, avoids API cost concerns
- MCP server (`mcp-server/server.py`, 7138 bytes) written manually with direct inspiration from the paper
- Agent runner (`agent/run.py`, 17128 bytes) orchestrates tool-calling across up to 12 turns
- Injection scenarios correspond directly to paper figures: Prompt 19 (multistage search), Figure 21/Prompt 12 (disinformation), code needle, email worm, fraud redirect
- Data files provide fictional but realistic email/web content with embedded injections; AI used to generate the fictional narrative frames around Ryan's hand-crafted injection payloads
- Observations noted in README: code injections near-100% success rate; fraud/email worm inconsistent with llama3.2:3b

## Ryan's Contributions
**Sole developer.** Single commit.

- `13a9dd3` 2026-06-14 — "feat: initialize nwtsuf-replication project" — complete project in one shot: MCP server, agent runner, 5 injection scenarios (code needle, disinformation, email worm, fraud, multistage), corresponding data files, and a log of a successful email worm run (`logs/email_worm_success.txt`)

### Key source files
- `mcp-server/server.py` — MCP server exposing web search, email read, code exec, summarize tools with injectable data sources
- `agent/run.py` — Ollama-based ReAct agent (tool-calling loop, up to 12 turns)
- `prompts/multistage.md` — Prompt 19: multistage search injection
- `prompts/disinformation.md` — Figure 21 / Prompt 12
- `prompts/code_needle.md` — code injection via MCP file read
- `prompts/email_worm.md` — self-propagating injection via email content
- `prompts/fraud.md` — google.com redirect via poisoned summarize page
- `data/search/poisoned_wikipedia.txt` — injected search result payload
- `data/emails/party_invitation.json` — email worm payload
- `logs/email_worm_success.txt` — recorded successful worm propagation (3665 bytes)
