# ScottyLabs Applications and Tools

---

## Snipe-Elo-Bots

**Owner:** ScottyLabs
**Platform:** GitHub
**Nature:** Slack and Discord bots that implement an ELO rating system for "snipe" events (implicit photo mentions). Features include leaderboard, head-to-head stats, bounties, duels, polls, cooldowns, graph visualization, and a CSV export endpoint.
**Language(s):** TypeScript
**Active period:** 2026-03-27 to 2026-06-07
**Fork of:** Original

### Design Decisions

- Bolt framework for both Slack and Discord bots; Slack slash commands defined explicitly in the Slack app manifest.
- Socket Mode as optional Slack transport (controlled by SLACK_APP_TOKEN env var).
- Text command fallback mode (SLACK_TEXT_COMMANDS_FALLBACK) so commands work from thread composers where Slack does not trigger slash commands.
- ELO stored in a database; leaderboard rendered on a Slack Canvas.
- Graph visualization endpoint for ELO network relationships, served via a web endpoint.
- Cooldown system with per-party exemptions for involved parties (commit 239529a).
- Bounty system with non-erasing semantics (commit fe517ea) and recalculation support (commit e90b2a62).

### Ryan's Contributions

Ryan is a primary developer of this bot system, contributing 30+ commits covering the full feature set.

**Core snipe mechanics (March 2026):**
- `0dd7237 2026-03-27` feat: snipes and headtohead -- initial snipe tracking and head-to-head comparison.
- `5cb3f2b 2026-03-27` fix: image headtohead.
- `742548b 2026-03-27` feat: cancelduel -- duel cancellation command.
- `f667932 2026-03-27` feat: help and duel commands.
- `b517c4f 2026-03-28` feat: pagination for leaderboard.
- `eec1775 2026-03-28` fix: leaderboard.

**Bounty system (March-April 2026):**
- `166cc95 2026-03-29` feat: bounties -- initial bounty system.
- `a3ce4e3 2026-03-29` feat: bounty command.
- `fe517ea 2026-03-30` feat: non-erase bounty -- bounty points persist instead of being consumed.
- `e90b2a62 2026-04-02` feat: gifs and bounty -- GIF responses and bounty updates.
- `e132a3b 2026-04-03` feat: recalc bounty -- bounty recalculation command.
- `239529a 2026-04-13` feat: remove snipe cooldowns for others except involved party.

**Graph visualization (March-April 2026):**
- `233ba39 2026-03-30` feat: vis -- ELO graph visualization.
- `ece2f27 2026-03-30` feat: website for graph -- served visualization endpoint.

**April Fools and voicelines (April 2026):**
- `555aa3b 2026-04-01` fools -- April Fools mode.
- `7c3b14e 2026-04-01` fools2.
- `29a21f8 2026-04-02` revert fools.
- `2fdb68d 2026-04-02` feat: random snipe voicelines.
- `9402f9b 2026-04-01` feat: exia.

**Leaderboard and poll (April-May 2026):**
- `439dd9d 2026-04-03` feat: leaderboard and discord fix.
- `c176b45 2026-04-04` feat: poll -- poll command.
- `26e7b76 2026-05-06` feat: new endpoint for csv -- CSV data export for stats.
- `45b75dc 2026-06-07` feat: no bounty if last message was the same.

---

## Rust-Scanner

**Owner:** ScottyLabs
**Platform:** GitHub
**Nature:** CLI and GitHub Actions tool that scans all ScottyLabs repositories to measure Rust adoption: counts Rust files, SLOC proportion, unique crates, and usage purpose per repo. Data saved to CSV/JSON for reporting.
**Language(s):** Rust
**Active period:** 2025-10-04 to 2025-12-26
**Fork of:** Original

### Design Decisions

- tokei for SLOC counting; JSON output parsed in Python for aggregation.
- Instant commit monitoring with live output for CI visibility.
- Exclusion list of repos to skip during actions scans (commit 8cff7d2).
- Data saved as both JSON (per crawl) and CSV (accumulated history).
- Verbose crawl mode for debugging.

### Ryan's Contributions

Ryan is the primary maintainer and built the entire scanning infrastructure.

**Initial implementation (October 2025):**
- `92f7002 2025-10-04` Initial commit.
- `3c6632a 2025-10-04` feat: initial base code -- core scanner.
- `b6f03d5 2025-10-04` feat: json file initial uploads -- JSON output.
- `b292e48 2025-10-04` fix: rename for file clarity.
- `478b116 2025-10-04` feat: CSV data saving.
- `e42dff2 2025-10-04` fix: rename columns.
- `6c05ee4 2025-10-04` feat: verbose crawl.
- `fd994b6 2025-10-04` fix: recrawled more accurate SLOC.
- Merged PRs #4-#10 from contributors adding unique crates tracking and SLOC measurement.

**Rust-specific tracking (November 2025):**
- `2326eb8 2025-11-01` Add Rust line counter.
- `0faa868 2025-11-01` Add Rust-specific line tracking.
- `33e9ac9 2025-11-01` Add instant commit monitoring with live output.
- `e53af15 2025-11-01` Fix tokei JSON parsing.
- `cec74ae 2025-11-01` Update to latest GitHub Actions versions.
- `8cff7d2 2025-11-15` feat: exclusion list of repos to not scan in actions.

---

## tartan-vote

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** Voting application commissioned by CMU Undergraduate Senate, built with SvelteKit frontend, Rust backend, and PostgreSQL. Handles attendance, elections, and motions for student organizations.
**Language(s):** Rust, TypeScript (SvelteKit/Deno), PostgreSQL
**Active period:** 2026-03-20 to 2026-08-03
**Fork of:** Original

### Design Decisions

- Rust backend with serde for serialization; Nix flake built using crate2nix (Cargo.nix).
- SvelteKit frontend migrated to Deno for reproducible Nix builds.
- devenv for local development; no flake regeneration per commit to reduce churn (commit 231c165).
- OIDC SSO via Keycloak; auth service shares cookies across tartan-vote subdomains.
- secretspec for secrets in both devenv and Kennel profiles; OpenBao (vault) backend.
- npmDepsHash pinned for reproducible npm builds in Nix sandbox.
- Auth service version field added to package.json for Nix npm build compatibility.

### Ryan's Contributions

**Contributors:** maybe-yiyi (133, primary application developer), thesuperRL (27), Riztofu (16), TenType (10), stationedK-06 (9), Gostmeaper (7), XboxBedrock (7), ap-1 (5). Ryan's 27 commits are focused on the Nix/devenv/Kennel build and deployment pipeline — not the application logic, which was built by maybe-yiyi and others.

**Initial Nix flake (March 2026):**
- `7292bf9 2026-03-20` feat: nix flake -- initial Nix flake.
- `938d36a 2026-03-20` feat: fixes.
- `e12581f 2026-03-20` fix: deleting nix compile files.
- `c04ba28 2026-03-21` feat: devenv and biome -- devenv environment and Biome linter.
- `23a1ac6 2026-03-21` feat: bun2nix postinstall.
- `1d3806c 2026-03-21` fix: satisfies tests.
- `61ed2da 2026-03-27` chore: regenerate Cargo.nix.
- `231c165 2026-03-28` feat: no flake renewal per commit.

**Auth and SSO integration (June 2026):**
- `1bb9651 2026-06-11` build: migrate auth and frontend to Deno for Nix builds.
- `7ff4a0c 2026-06-07` Disable devenv secretspec so kennel builds skip vault check.
- `74ff05d 2026-06-07` Align devenv and kennel config for api, auth, and frontend deployment.
- `6670b5f 2026-06-07` Add OIDC_ISSUER to deploy secretspec profiles for auth service.
- `56a2a27 2026-06-07` Fix SSO sign-in: CORS for kennel URLs, migrate script, error surfacing.
- `6018a67 2026-06-07` Share auth cookies across tartan-vote subdomains for API calls.
- `3a4ec6a 2026-06-11` ci: retry kennel build.

---

## golden-retriever

**Owner:** ScottyLabs
**Platform:** GitHub
**Nature:** Terraform-based governance prototype that manages contributor and team access across GitHub, Forgejo, Keycloak, Vault, Slack, and Discord from JSON data files. Served as the governance system design exploration before the TOML-based governance repo.
**Language(s):** HTML (Terraform HCL, Python synchronizer)
**Active period:** 2026-03-21 to 2026-03-24
**Fork of:** Original

### Design Decisions

- JSON contributor/team/repo files as source of truth; Terraform applies GitHub and Forgejo state.
- Python synchronizer (from governance-v1) handles Keycloak, Vault, Slack, Discord.
- Two platform teams per group: `<slug>` (push/write) and `<slug>-maintainers` (maintain/admin).
- Figma API validation for Figma project references in CI.
- Google file links as reference-only (no sync).
- Force-directed graph visualization of org relationships (Vis.js).
- `sync_github` / `sync_forgejo` flags to opt teams out of specific platforms.

### Ryan's Contributions

Ryan built this governance prototype from scratch, including the full org graph, multi-platform sync, and visualization tools.

- `4be946f 2026-03-21` Initial commit.
- `9ebe162 2026-03-21` feat: initial governance related features.
- `4f44611 2026-03-21` fix: whitespace.
- `3dec8d4 2026-03-21` feat: formatter.
- `4742779 2026-03-21` feat: figma api support.
- `17fab4d 2026-03-21` feat: slack-discord-matrix support.
- `5ae29b5 2026-03-22` feat: copied over from old governance.
- `593e54e 2026-03-21` feat: visualization -- Vis.js force-directed graph.
- `bfa86f6 2026-03-22` feat: way better visualization.
- `88709e7 2026-03-22` fix: vis modes.
- `ab703c4 2026-03-22` feat: google file support.
- `ab703c4 2026-03-22` fix: google files color.
- `8b88fce 2026-03-24` feat: sync permissions on github/codeberg.
- `073f08d 2026-03-24` feat: full slack sync.
- `f39764a 2026-03-24` feat: test with cmucourses slack.
- `ad31521 2026-03-24` feat: moved over all slack ids.
- `64de2fc 2026-03-24` feat: discord sync.
- `275baa9 2026-03-24` feat: better discord logs.
- `082cf16 2026-03-24` fix: style.

---

## cmugpt-surface

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** Full-stack typesafe web application (ScottyStack template) serving as the CMU GPT frontend surface. Integrates with pgvector for semantic search/RAG capabilities. Built with TypeScript and deployed via Kennel.
**Language(s):** TypeScript
**Active period:** 2026-06-24 to 2026-08-07
**Fork of:** Original

### Design Decisions

- ScottyStack template (full-stack typesafe) as the starting point.
- pgvector PostgreSQL extension for vector embeddings and semantic search.
- Nix packaging aligned with dalmatian's pattern: scottylabs inputs, no legacy bunStore derivation.
- Nix store references scrubbed from the bun cache during build.

### Ryan's Contributions

**Contributors:** krishsaxena (39, primary), JiYa2301 (21), Jc-965 (20), kath45823 (15), thesuperRL (12), tsurbs (6), ap-1 (5), XboxBedrock (3). Ryan's 12 commits are scoped to Kennel deployment packaging and pgvector integration.

- `baebcba 2026-06-24` fix: resolve change requests.
- `9dbef7e 2026-06-27` hosting: export items like dalmatian -- aligned Nix package exports with dalmatian pattern.
- `a1af516 2026-06-27` hosting: correct naming and pass in packages.
- `96afcc0 2026-06-27` hosting: fix public keys.
- `14be983 2026-06-27` hosting: ignore scripts during bun install.
- `2fb894b 2026-06-27` hosting: scrub nix store references from bun cache.
- `9f4b309 2026-06-27` hosting: remove bunStore derivation.
- `a534528 2026-06-27` hosting: update nix packages to use scottylabs inputs and remove legacy bunStore derivation.
- `a202227 2026-07-16` feat: integrate with pgvector -- pgvector query integration.
- `347c40c 2026-07-16` fix: remove unnecessary import.
- `7e2dfff 2026-07-16` fix: formatting using with syntax.
- `d9d7eb8 2026-07-18` fix: remove with.

---

## cmugpt-agent

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** Python-based AI agent backend for CMU GPT, using FastAPI and uv/ruff/ty for tooling. Deployed via Kennel with secretspec for secrets management.
**Language(s):** Python
**Active period:** 2026-04-08 to 2026-08-07
**Fork of:** Original

### Design Decisions

- uv for dependency management and task execution; ruff for formatting/linting; ty for type checking.
- FastAPI as the web framework; PORT configurable via environment variable.
- Nix wheel build: src package installed into the wheel for Kennel deploy.
- secretspec and devenv integration for secrets and local development.

### Ryan's Contributions

**Contributors:** krishsaxena (26, primary), Jc-965 (15), JiYa2301 (7), thesuperRL (6), ellylai (3), tsurbs (1). Ryan's 6 commits bootstrapped the initial Nix flake and Kennel deployment configuration.

- `bc7fc2c 2026-04-08` feat: flake -- initial Nix flake.
- `be0ba2a 2026-04-09` fix: port change.
- `e2c7fa5 2026-04-09` fix: format.
- `e05b343 2026-04-09` fix: formatting and toml.
- `881917e 2026-06-16` backend: hosting: adjust secretspec and devenv to allow kennel hosting.
- `72c679c 2026-06-16` fix: install src package in Nix wheel for Kennel deploy.

---

## kennel

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** ScottyLabs deployment platform. On every push, builds the project with Nix, runs services as systemd units and static sites via Caddy, provisions PostgreSQL/Valkey/Garage resources, resolves secrets from OpenBao, manages Cloudflare DNS, and serves over HTTPS. Every branch and PR gets its own deployment at `{project}-{branch}.scottylabs.net`.
**Language(s):** Rust
**Active period:** 2026-05-16 to 2026-08-03
**Fork of:** Original

### Design Decisions

- Single daemon taking git webhooks through build, deploy, and reconciliation.
- SQLite for intent and build history; systemd/Caddy/Nix for runtime state.
- NixOS module to run the daemon itself (nix/nixos.nix); projects declare their environment via devenv.nix built on shared kennel modules (nix/modules).
- ricochet integration: kennel publishes live deployment hosts to a file; ricochet uses it as an OAuth2 callback relay allowlist for ephemeral preview deployments.
- Semgrep excluded from installCheck to work around upstream test failures.
- Auto-regeneration of flake.lock as a pre-commit hook.

### Ryan's Contributions

**Contributors:** ap-1 (332, primary, core author), thesuperRL (9), stationedK-06 (5), XboxBedrock (5), maybe-yiyi (2), kritdass (1). Ryan is a consumer-side contributor — he uses kennel to deploy other projects and fixes deployment-level issues, not the kennel daemon itself.

- `a7e1fc8 2026-05-16` feat: regenerate flake.lock as precommit automatically.
- `d816c7e 2026-06-05` fix: kennel does not grant redis permissions.
- `5d18a7b 2026-06-05` fix: add valkey to path when provisioning enabled.
- `baea8cb 2026-06-08` feat(kennel): create stub .env file for secretspec validation.
- `ec9d26c 2026-07-08` deploy: fix inadvertent garbage collection of kennel-config when pointers drop.
- `7abe6db 2026-07-12` fix: skip tests for semgrep to resolve upstream issues.
- `2d314d4 2026-07-12` fix: use overridePythonAttrs so semgrep installCheck is actually skipped.
- `ab0a783 2026-07-15` fix: make sure nixpkgs is nixos-unstable.
- `e498fca 2026-07-17` chore: flake: update scottylabs devenv to current HEAD.

---

## housing

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** CMU housing information web app (cmuhousing.com). Frontend SPA deployed via Kennel with devenv; DNS cutover managed through a documented runbook.
**Language(s):** TypeScript
**Active period:** 2026-03-28 to 2026-08-06
**Fork of:** Original

### Design Decisions

- Frontend SPA served as a static site via Kennel/Caddy.
- devenv with Deno for the frontend build (migrated from an earlier setup).
- Nix flake for reproducible builds.
- DNS cutover documented as a Kennel deployment runbook.

### Ryan's Contributions

**Contributors:** amzoeee (51), Gostmeaper (47), MaroonCoffee (29), ap-1 (21), RohanSen08 (16), EcstaticPilot (15), XboxBedrock (10), thesuperRL (7). Ryan is a minor contributor; his 7 commits cover Nix flake setup and devenv/Kennel deployment plumbing.

- `a7b9fa3 2026-03-28` feat: flake -- initial Nix flake.
- `2fc703a 2026-06-11` feat: add devenv and Kennel deployment for frontend SPA.
- `091fd3a 2026-06-11` docs: add Kennel deployment and cmuhousing.com DNS cutover guide.
- `1670a7c 2026-06-11` chore(devenv): update configuration and cleanup environment.
- `40df974 2026-06-13` chore(devenv): switch frontend to Deno and update CI.
- `6a40772 2026-06-13` chore(devenv): switch frontend to Deno and update CI (mirror commit).
- `f541d2b 2026-07-08` chore: test run actions again.

---

## bus-sign

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** Physical bus arrival display sign backend, showing real-time PRT (Port Authority Transit) data. Rust backend deployed via Kennel with secretspec for the PRT API key.
**Language(s):** Rust
**Active period:** 2026-02-21 to 2026-08-03
**Fork of:** Original

### Design Decisions

- devenv for local development environment.
- secretspec for PRT API key management.
- Kennel deployment aligned with the standard devenv pattern.

### Ryan's Contributions

Ryan added the Nix flake and later updated the Kennel deployment config.

- `e3bc255 2026-02-21` feat: you get a flake -- initial Nix flake.
- `66f710b 2026-06-15` backend: auth: secretspec integration fix and PRT api key.
- `5885c0a 2026-06-15` backend: hosting: align with devenv latest things.

---

## tartanhacks-history

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** Archive site for historical TartanHacks hackathon websites. Each year's site lives on a separate branch; a central index serves as the hub page.
**Language(s):** Dockerfile
**Active period:** 2026-05-16 to 2026-07-16
**Fork of:** Original

### Ryan's Contributions

Ryan performed the initial migration of historical hackathon sites and set up the per-year branch structure.

- `a9f6e6b 2026-05-16` feat: initial migrate -- migrated historical hackathon sites into the repo.
- `7b4827d 2026-05-16` feat: header and footer -- hub page header and footer.
- `8efd0a8 2026-05-16` chore: remove hub; year sites live on branches by year -- finalized the branch-per-year architecture.

---

## scottylol

**Owner:** ScottyLabs
**Platform:** GitHub
**Nature:** Search bookmarking tool for CMU, providing bang-style search shortcuts (similar to DuckDuckGo bangs) for CMU-specific resources.
**Language(s):** TypeScript
**Active period:** 2026-05-19
**Fork of:** Original

### Ryan's Contributions

Ryan made minor maintenance updates.

- `dd054db 2026-05-19` fix: sync bun -- updated bun lockfile.
- `006dfea 2026-05-19` chore: update node version.

---

## scottylabs.org

**Owner:** ScottyLabs
**Platform:** GitHub
**Nature:** Landing page for ScottyLabs, the student technology organization at CMU.
**Language(s):** TypeScript
**Active period:** 2026-08-07 (Ryan's contribution)
**Fork of:** Original

### Ryan's Contributions

- `95358c1 2026-08-07` fix: get correct sponsorship link -- fixed a broken sponsorship URL on the landing page.
