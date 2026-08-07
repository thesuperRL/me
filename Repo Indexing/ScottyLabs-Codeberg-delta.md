# ScottyLabs Codeberg Delta

This file documents Ryan Li's (thesuperRL / ryanlin) contributions to ScottyLabs repos that live **only on Codeberg** (no GitHub mirror), plus Codeberg-specific commit activity in repos that also have a GitHub presence. The GitHub ScottyLabs analysis covers repos at github.com/ScottyLabs; this file captures what is not visible there.

---

## Codeberg-Only Repos (no GitHub equivalent)

### ScottyLabs/org-observability

**Language:** TypeScript
**Description:** "Visual display for tasks and permissions within the ScottyLabs Organization." Renders a nested circle graph of teams and subteams from a TOML filesystem (imported from governance/data). Supports a Rust-based CLI (`cargo run`) to import governance data, validate group definitions, and build a static site.
**Ryan's commits (6):**
- `9229d5e` 2026-05-25 Initial commit
- `5d1505c` 2026-05-24 feat: initial commit idea
- `af64957` 2026-05-24 feat: migrate to ts
- `ec73726` 2026-05-24 feat: better architecture
- `0f5c592` 2026-05-30 feat: initial data and nonoverlapping circles
- `47198fb` 2026-05-30 fix: wrong info

Ryan built this tool from scratch (sole or primary developer). The project takes TOML org structure from the governance repo and produces an interactive nested-circle org chart showing team hierarchy and permissions.

---

### ScottyLabs/terraform-provider-matrix

**Language:** Go
**Description:** OpenTofu/Terraform provider for linking mautrix-slack into mautrix-discord portal rooms. Predecessor/sibling to `thesuperRL/terraform-provider-synapse`. Discord is the source of truth; this provider finds the Discord portal room, invites `@slack`, and sends `!slack bridge <slack_channel_id>`. Resource: `matrix_bridge_channel_pair`.
**Ryan's commits (2):**
- `0c70366` 2026-05-27 feat: initial
- `dae4f12` 2026-05-27 feat: link Slack into Discord portal rooms (no hub rooms)

Ryan authored this provider from scratch in a single day (May 27 2026). This is the ScottyLabs-org version of the bridge linking logic; the `thesuperRL/terraform-provider-synapse` personal fork evolved this further with the Synapse Admin API integration. Registry address: `scottylabs/matrix`.

---

### ScottyLabs/devops-troubleshooting-docs

**Language:** Python (mdBook static site)
**Description:** "Documentation for potential infra, governance, and project-level troubleshooting." A living troubleshooting runbook wiki built with mdBook. Covers infrastructure, governance, bus-sign, devenv, observability, CMU-related networking, Garage object storage, and Atlantis. Also includes an Obsidian vault layout (`.obsidian/`) and Forgejo Actions workflows for deploying the mdBook and auto-updating infrastructure graphs.
**Ryan's commits (many, sample below):**
- `1e04a2c` 2026-06-08 docs(infra): add comprehensive troubleshooting and infrastructure guides
- `9d4b067` 2026-06-08 docs(hub): add comprehensive guides for CI, deployment, and troubleshooting
- `21dba22` 2026-06-08 docs(governance): add comprehensive troubleshooting and operational guides
- `d3278e0` 2026-06-08 docs: condense troubleshooting guides and add devenv and observability docs
- `9d4b067` 2026-06-08 docs(hub): guides for CI, deployment, troubleshooting
- `af05a18` 2026-06-08 docs: standardize formatting and symbols across troubleshooting guides
- `2c05c56` 2026-07-16 Merge PR: restructuring of repo with handwritten notes
- `37df765` 2026-07-15 feat: restructuring of repo with real notes
- `92aca34` 2026-07-15 feat: notes from meeting 07-15
- `046a9e9` 2026-07-15 feat: init cmu-related category
- `bc0f526` 2026-07-16 feat: bus sign
- `ef2ad5e` 2026-07-15 fix: clear up hosting info
- `80f3f62` 2026-07-22 feat: mdbookify
- `298e6ce` 2026-07-25 feat: update jul 24

Ryan is the primary author. Converted the docs from an Obsidian-only format to an mdBook deployment (`feat: mdbookify`, July 22 2026). Injected the devops-troubleshooting-docs content into the main ScottyLabs documentation hub (`feat: add devops runbooks at /devops via mdbook injection` in ScottyLabs/documentation).

---

## Codeberg-Specific Activity in Dual-Platform Repos

These repos exist on both GitHub (ScottyLabs) and Codeberg (ScottyLabs). GitHub commits in these repos are tracked by the main GitHub ScottyLabs analysis. The commits below are Ryan's Codeberg-side contributions that may not appear in the GitHub mirror history.

### ScottyLabs/infrastructure (Codeberg)

The infrastructure repo was migrated from GitHub to Codeberg (`0d29497` feat: migrate to codeberg). Ryan's Codeberg-side commit:
- `be6bdf9` 2026-07-21 feat: run renovate with custom manager for devenv updates (#72) - added a custom Renovate manager to automatically track devenv updates

The bulk of Ryan's infrastructure contributions (NixOS modules, comin, nginx, discord-verify, dalmatian, vaultwarden, keycloak, minio, secrets, runner config) are captured in the `thesuperRL/infrastructure` Codeberg fork history (50+ commits) and would also appear in the upstream ScottyLabs/infrastructure Codeberg history. The GitHub ScottyLabs analysis covers the GitHub-side; those early contributions may not be present there since the primary development occurred on Codeberg after migration.

---

### ScottyLabs/kennel (Codeberg)

Ryan's Codeberg commits (not on GitHub):
- `ab0a783` 2026-07-15 fix: make sure nixpkgs is nixos-unstable
- `e498fca` 2026-07-17 chore: flake: update scottylabs devenv to current HEAD

Both are Nix flake maintenance commits ensuring kennel uses the correct nixpkgs channel.

---

### ScottyLabs/governance (Codeberg)

Ryan's Codeberg commits (not on GitHub):
- `fed0c34` 2026-07-10 feat: add Foundry channel to org-wide Slack/Discord mirror
- `e27f391` 2026-07-10 feat: mirror leadership channel
- `ae3c7da` 2026-07-10 fix: governance slack-join should no-op if already a channel member
- `120f761` 2026-07-10 fix: mirror new leadership channel
- `7d1714c` 2026-07-11 fix: taplo fmt cmuhousing (#104)
- `bc5b5d2` 2026-07-17 fix: implement correct actions skip behavior on bot commits

Six commits around Slack/Discord channel mirroring configuration and CI bot behavior.

---

### ScottyLabs/documentation (Codeberg)

Ryan's Codeberg commits are numerous (49+). A representative sample:
- `a30ba3c` 2026-06-13 ci(forgejo): split docs and diagrams rebuild triggers
- `93508b1` 2026-06-14 docs: add git best practices guide
- `a4fd866` 2026-06-14 refactor(doc): add kernel commit style section
- `18caae4` 2026-06-14 feat(docs): implement custom quote box component
- `6c68fb9` 2026-06-14 fix: add quote marks
- `98ee800` 2026-06-25 feat(docs): use README.md as homepage for each project
- `9deb744` 2026-06-25 fix(docs): exclude index from sidebar
- `65f3d55` 2026-06-25 feat(docs): make project titles clickable links to homepage
- `029099c` 2026-06-25 fix(docs): prioritize existing index.md over README for homepage
- `b36d135` 2026-06-25 feat(docs): add new projects to sidebar and improve aggregation fallback
- `42e6a5f` 2026-06-25 fix(docs): use autogenerate to make project titles clickable
- `4227d3c` 2026-07-22 feat: use mdbook (converted the doc site from custom to mdBook)
- `f0955cb` 2026-07-22 fix: bring bun
- `477a262` 2026-07-22 fix: gitignore build outputs
- `d333358` 2026-07-25 feat: add devops runbooks at /devops via mdbook injection

Ryan is a major contributor to the documentation hub: added git best practices, custom quote box component, project sidebar improvements, README-as-homepage logic, and led the migration to mdBook.

---

### ScottyLabs/mcp-server (Codeberg, also on GitHub)

Ryan's Codeberg commit:
- `19ab9d6` 2026-06-23 fix: address PR review comments

One PR-review-driven fix. This repo also exists on GitHub ScottyLabs.

---

## Summary

| Repo | Platform | Ryan Commits | Status |
|------|----------|-------------|--------|
| org-observability | Codeberg-only | 6 | Built from scratch |
| terraform-provider-matrix | Codeberg-only | 2 | Built from scratch |
| devops-troubleshooting-docs | Codeberg-only | 14+ | Primary author |
| infrastructure (Codeberg) | Both | 1 (+ 50+ in fork) | Renovate manager |
| kennel (Codeberg) | Both | 2 | Nix flake fixes |
| governance (Codeberg) | Both | 6 | Channel mirroring |
| documentation (Codeberg) | Both | 49+ | Major contributor |
| mcp-server (Codeberg) | Both | 1 | PR follow-up fix |
