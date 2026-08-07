# ScottyLabs Governance and Documentation

---

## governance

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg) + thesuperRL/governance fork on GitHub
**Nature:** Single source of truth for ScottyLabs Tech Committee governance. Declares teams, repositories, and membership in TOML files; applies them via OpenTofu and Atlantis to Keycloak, Vault, GitHub, Codeberg, Slack, and Discord. Also generates Matrix bridge configurations and Forgejo webhook registrations.
**Language(s):** Rust (validator tooling), Python (synchronizer), TOML (data)
**Active period:** 2026-04-21 to 2026-07-30
**Fork of:** thesuperRL/governance is a fork of cirex-web/governance (the upstream governance-v1 system)

### Design Decisions

- TOML-based team declarations: each team file under `data/teams/` declares members, repos, channels (Slack, Discord, Matrix), and feature flags (kennel, sentry, posthog, cdn, oidc_client, ai_gateway, docs).
- OpenTofu (open-source Terraform fork) applies platform state; Atlantis runs plan/apply on PRs.
- Forgejo docs webhooks generated from governance data so docs.scottylabs.org auto-rebuilds when any flagged project changes.
- Matrix bridge configs generated automatically from governance channel declarations; Ryan's commits built this generation pipeline.
- `matrix_account_required` flag and homeserver/domain configuration in org TOML for Matrix account validation at `governance validate` time.
- Team lead Forgejo permissions implemented as a separate auto-generated `lead` team with admin rights (commit ceb99ce).
- Bot commit detection for skipping CI on automated commits (commit bc5b5d2).

### Ryan's Contributions

**Contributors:** ap-1 (133 commits, primary), thesuperRL (40), XboxBedrock (8), krishsaxena (5), others. Ryan is the second-largest contributor; ap-1 is the primary governance maintainer and system author.

Ryan's 40 commits focus on DevOps team onboarding, docs pipeline integration, Matrix bridge configuration generation, and org channel expansion:

**Onboarding and role establishment:**
- `88b6e75 2026-04-21` feat: add thesuperRL as devops tech lead -- formal appointment as DevOps lead.
- `4df92a4 2026-05-27` feat: make devops tech lead codeowner of entire repo.

**Docs integration (May 2026):**
- `500ff7d 2026-05-29` feat: integration of centralized docs repo -- linked governance to documentation hub.
- `8fbd735 2026-05-30` feat: documentation as a devops project -- declared docs as a devops-owned project.
- `86c938..b7ffed3 2026-05-30` feat: add all devops docs and include them by default.
- `6f3f4ec 2026-05-30` feat: mirror general and block sharing.

**Matrix mirroring pipeline (May-June 2026):**
- `3ae358f 2026-05-29` feat: matrix-discord-slack automated mirroring -- automated mirroring configuration generation.
- `f81eb5b 2026-05-30` chore: regenerate matrix bridges for org channels.
- `4628f5b 2026-06-02` feat: double ping -- cross-platform double-ping support.
- `ceb99ce 2026-06-09` feat(forgejo): implement team lead permissions and automatic lead team generation.
- `1cef4d7 2026-06-14` refactor(tfm): add Forgejo docs webhooks generation.
- `6a3e79f 2026-06-13` feat: add Matrix account validation to governance validate.
- `7876973 2026-06-13` refactor(org): add matrix_account_required flag and improve Matrix validation.
- `486b4bc 2026-06-13` refactor(org): replace validate_matrix_accounts flag with matrix domain and homeserver configuration.

**Channel and org expansion (June-July 2026):**
- `018f1d7 2026-06-15` docs: add Matrix and bridge login steps to team onboarding.
- `018f1d7 2026-06-20` matrix: mirror uptime alerts channels.
- `fed0c34 2026-07-10` feat: add Foundry channel to org-wide Slack/Discord mirror.
- `e27f391 2026-07-10` feat: mirror leadership channel.
- `120f761 2026-07-10` fix: mirror new leadership channel.
- `ae3c7da 2026-07-10` fix: governance slack-join should no-op if already a channel member.
- `bc5b5d2 2026-07-17` fix: implement correct actions skip behavior on bot commits.

---

## governance-v1

**Owner:** ScottyLabs
**Platform:** GitHub
**Nature:** Original Python-based governance system for ScottyLabs. Defines contributors, teams, and repo permissions in JSON files; a Python synchronizer applies them to GitHub/Codeberg and other platforms (Keycloak, Vault, Slack, Discord). Preceded by golden-retriever; superseded by the Rust/TOML governance system.
**Language(s):** Python (synchronizer), Rust (validators), JSON (data)
**Active period:** 2026-02-24 to 2026-04-13
**Fork of:** Original

### Design Decisions

- JSON contributor/team/repo files as the source of truth; Python synchronizer reads them and calls platform APIs.
- GitHub team permissions expressed as `push` (all members) and `maintain` (maintainers only).
- Forgejo (Codeberg) team permissions mirrored via a separate provider.
- Keycloak OIDC client registration, Vault secret layout, Slack channel membership, and Discord roles all declared in team JSON.

### Ryan's Contributions

**Contributors:** Yuxiang-Huang (310, primary), scottylabs-bot (38), thesuperRL (9), ap-1 (6), TenType (6), others. Ryan made 9 targeted commits bootstrapping the DevOps team and SLAI membership definitions.

- `411dfc5 2026-02-24` feat(leadership): add Ryan Li -- initial addition to leadership.
- `9498d01 2026-03-10` feat: add devops team -- created the DevOps team definition.
- `17f99de 2026-03-12` feat: add repo info and visuals.
- `0ff9be9 2026-03-12` feat: add thesuperRL (Ryan Li) to governance maintainers.
- `6ede836 2026-03-22` fix: slai repo desync.
- `38b5665 2026-03-24` feat: sync github for devops.
- `a8a16ee 2026-03-24` feat: john is more external projects than devops now.
- `3cc86af 2026-04-09` feat: add thesuperRL to slai for devops work -- joined the SLAI (AI research) team as DevOps support.

---

## discord-verify

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** Rust/Leptos web service for verifying Discord server membership against CMU identity via OIDC. Integrates with Kennel for deployment and OpenBao for secrets.
**Language(s):** Rust
**Active period:** 2026-06-05 to 2026-08-03
**Fork of:** Original

### Design Decisions

- Leptos (Rust full-stack WASM framework) for the frontend; Kennel sets the working directory for Leptos config resolution.
- devenv + secretspec for local development and Kennel deployment secrets.
- Verification count from Discord member cache (deferred fetch to avoid blocking).
- Kennel OIDC client reconciliation to provision the Keycloak client at deploy time.

### Ryan's Contributions

**Contributors:** ap-1 (77 commits, primary), thesuperRL (8), Gostmeaper (7), maybe-yiyi (2). Ryan's 8 commits are focused entirely on Kennel/devenv/secretspec deployment integration — the application code was built by others.

- `767b20a 2026-06-05` Add Kennel, devenv, and secretspec integration -- initial Kennel plumbing.
- `e6f8930 2026-06-05` feat: add Kennel, devenv, and secretspec integration (consolidated follow-up).
- `fd9e853 2026-06-05` fix: formatting.
- `c6f95a1 2026-06-05` fix: kennel sets working directory for leptos config.
- `2a97d4b 2026-06-05` feat: enable Kennel OIDC client reconciliation.
- `d873da4 2026-06-05` fix: verification count.
- `3499553 2026-06-05` fix: defer /config and count verified members from cache.
- `81f8cca 2026-07-23` fix: bump serde_with to 3.21.0.

---

## documentation

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** Centralized documentation hub for all ScottyLabs projects. Aggregates docs from every governance-flagged repo using mdBook; serves them at docs.scottylabs.org with full-text search (Pagefind), Excalidraw diagram support, and Accept: text/markdown content negotiation for AI/LLM access.
**Language(s):** Python (aggregation scripts), TypeScript (Starlight/Astro frontend, superseded by mdBook)
**Active period:** 2026-05-30 to 2026-07-27
**Fork of:** Original

### Design Decisions

- mdBook adopted (commit 42e6a7f) as the static site generator after an initial Starlight/Astro phase. Migration simplified the build significantly.
- Multi-repo aggregation: Python scripts clone all governance-flagged repos and merge their `docs/` directories into a single mdBook build.
- Accept: text/markdown content negotiation: the site exports a .md sibling for every HTML page at build time; Caddy on infra-01 rewrites requests with `Accept: text/markdown` to the matching .md file from Garage.
- Excalidraw viewer with local fonts and fullscreen mode hosted in the docs site (migrated from Mermaid for richer diagrams).
- Mermaid diagram support also retained for simpler flow charts.
- Devops runbooks injected via mdBook include mechanism (commit d333358).
- CI splits docs rebuild and diagram rebuild into separate Forgejo workflow triggers.
- AGENTS.md excluded from aggregation to avoid polluting AI-readable docs (commit 1ffe7a1).

### Ryan's Contributions

**Contributors:** thesuperRL (62) — sole active contributor. Ryan built this repo from scratch.

**Initial build and content migration (May-June 2026):**
- `986f54a 2026-05-30` feat: site icon.
- `986f54a 2026-05-30` feat: migrate info from wiki.
- `7108ac1 2026-06-02` feat: migrate over the codeberg signup docs.
- `9ffeb59 2026-06-02` feat: link to headers.

**Documentation content (June 2026):**
- `93b8523 2026-06-12` refactor(sidebar): remove custom sidebar components and use starlight defaults.
- `81d7e11 2026-06-12` refactor(docs): reorganize org-docs structure and add tech-stack page.
- `8ddcd78 2026-06-12` feat(docs): improve mermaid diagram rendering and update tech-stack content.
- `566f91f 2026-06-12` docs(tech-stack): overhaul platform diagram and add authentication and observability details.
- `d34be39 2026-06-12` docs(tech-stack): update platform diagram and observability details.
- `8348f25 2026-06-12` feat(docs): migrate tech-stack diagram from Mermaid to Excalidraw.
- `a0b32af 2026-06-12` feat(docs): add fullscreen mode and local fonts to excalidraw viewer.
- `3fc28a7 2026-06-12` feat(docs): add fullscreen mode and local fonts to excalidraw viewer.
- `d2cc601 2026-06-12` feat(docs): implement Accept: text/markdown content negotiation.
- `93508b1 2026-06-12` docs: add git best practices guide.
- `3b94c93 2026-06-12` docs: update AI/LLM access and content negotiation guide.
- `bf07b61 2026-06-12` ci(forgejo): reorganize workflows and add diagram rebuild triggers.
- `18caae4 2026-06-15` feat(docs): implement custom quote box component.
- `a4fd866 2026-06-15` refactor(doc): add kernel commit style section.

**mdBook migration and devops runbooks (July 2026):**
- `42e6a5f 2026-07-22` feat: use mdbook -- migrated from Astro/Starlight to mdBook.
- `f0955cb 2026-07-22` fix: bring bun.
- `477a262 2026-07-22` fix: gitignore build outputs.
- `d333358 2026-07-25` feat: add devops runbooks at /devops via mdbook injection.

**Sidebar and aggregation improvements (June 2026):**
- `98ee800 2026-06-25` feat(docs): use README.md as homepage for each project.
- `65f3d55 2026-06-26` feat(docs): make project titles clickable links to homepage.
- `b36d135 2026-06-26` feat(docs): add new projects to sidebar and improve aggregation fallback.
- `029099c 2026-06-26` fix(docs): prioritize existing index.md over README for homepage.
