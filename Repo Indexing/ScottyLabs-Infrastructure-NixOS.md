# ScottyLabs Infrastructure and NixOS Tooling

---

## infrastructure

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** NixOS configurations for all ScottyLabs virtual machines. Declares services, secrets (agenix), and system state declaratively; covers Synapse Matrix homeserver, mautrix bridge daemons, LiteLLM AI gateway, Caddy reverse proxy, PostgreSQL, Valkey/Redis, Forgejo CI runner, and the documentation site.
**Language(s):** Nix
**Active period:** 2026-01-17 to 2026-08-05
**Fork of:** Original

### Design Decisions

- Full NixOS declarative system: every service, user, package, and secret defined as code; no manual imperative provisioning.
- agenix for secret management: age-encrypted secret files committed to the repo, decrypted at deploy time per host.
- Caddy as the edge reverse proxy with content negotiation support (Accept: text/markdown for docs.scottylabs.org).
- Matrix homeserver (Synapse) supplemented with patched mautrix-discord and mautrix-slack bridge daemons. Bridges are built from forked source using the Nix vendored Go module pattern.
- Custom patch system: bridge source patches are applied at Nix build time, tracked as .patch files in the repo. Ryan wrote a pinned-fork update script to keep patch hunk headers current.
- Reaction mirror and ping mirror: custom patches to the bridge daemons implement bidirectional Slack/Discord/Matrix reaction aggregation and @here/@room ping propagation.
- Stale-while-revalidate identity cache: Keycloak identity lookups are cached and refreshed in the background so bridge message mirroring is never blocked.
- LiteLLM AI gateway deployed with Prisma migrations from the Nix store, patched for proxy-extras compatibility.
- docs.scottylabs.org served from a Garage S3 bucket; Caddy negotiates Accept: text/markdown at the edge.
- Renovate with custom manager for devenv updates (commit be6bdf9).

### Ryan's Contributions

**Contributors:** ap-1 (514 commits, primary), thesuperRL (150), XboxBedrock (7), jefferyoo (4), others. Ryan is the second-largest contributor; ap-1 is the primary infrastructure author and lead.

Ryan's contributions (150 commits) focus on Matrix/Synapse setup, mautrix bridge deployment, docs hosting, and ongoing DevOps maintenance:

**Initial setup and host onboarding:**
- `9315335 2026-01-17` feat: add thesuperRL -- SSH key and user addition, bootstrapping Ryan's access.
- `7e0091f 2026-02-21` fix: wrong public key for thesuperRL.
- `52d8907 2026-03-15` feat: matrix server setup -- Synapse homeserver initial NixOS configuration.
- `e4b5918 2026-04-08` feat: merge prod-02 into prod-01 and rename it deploy-01 -- server consolidation.
- `b5f4527 2026-04-10` feat: upgrade pgsql to 18.

**Matrix/mautrix bridge rollout (May-June 2026):**
- `a2ed7cd 2026-05-15` feat: slack webhooks -- first webhook integration.
- `8ca5ea1 2026-05-25` feat: mirroring -- initial Slack/Discord/Matrix bidirectional mirroring.
- `3304b6b 2026-05-25` feat: agenix secrets.
- `4e067f5 2026-05-27` fix: enable bridge E2EE for encrypted rooms.
- `7cfc192 2026-05-28` feat: mirror pfp over -- avatar propagation across bridges.
- `4a4837b 2026-05-28` feat: matrix slack passive relay.
- `7b85c44 2026-06-07` feat: ping mirroring -- @here/@room mention forwarding.
- `a928ff7 2026-06-07` feat: memory for ping mirroring.
- `466fcf9 2026-06-08` feat: accumulated reaction mirror -- emoji reaction aggregation.
- `f94c57c 2026-06-08` feat(reaction-mirror): add !mirror-reaction trigger for summary messages.
- `ee5b996..8d8c12f 2026-06-08` chore: update reaction mirror summary patches (x5 iterations).

**Bridge identity and Keycloak integration:**
- `e47b9c9 2026-06-14` refactor(matrix): implement stale-while-revalidate for Keycloak identity map.
- `bbdca22 2026-06-14` feat(matrix): add Slack to Matrix localpart mapping and improve outbound puppet logic.
- `b1fb144 2026-06-14` feat(matrix): implement outbound puppet lookups for Slack ghosts.
- `91cc7eb 2026-06-28` feat(matrix): vendor bridge v1 in Discord, consolidate mautrix-go v0.28.0.
- `a2700aa 2026-06-28` feat(matrix): add relay configuration to mautrix-discord bridge.
- `fccbc12 2026-06-26` matrix mirroring: convert channel pings to/from team roles via governance.
- `dcecb07 2026-06-19` matrix mirroring: make mirrored pings to discord ping the role of the channel's team instead of here.

**Infrastructure hardening and feature work:**
- `12c352c 2026-05-29` feat: host docs.scottylabs.org from Garage scottylabs-docs bucket.
- `1f0ca44 2026-06-12` feat(infra-01): negotiate Accept: text/markdown for docs.scottylabs.org.
- `fc2ba32 2026-06-05` feat: kennel redis and dv hosting on kennel -- migrated discord-verify to Kennel.
- `0911c50 2026-06-26` fix(governancedata): handle team.repos in TOML loader.
- `0be9781 2026-07-16` feat(postgresql): add pgvector for slai -- pgvector extension for SLAI AI projects.
- `92f7fe9 2026-07-14` fix: enable RDB persistence on valkey instances -- data durability fix.
- `be6bdf9 2026-07-21` feat: run renovate with custom manager for devenv updates.
- `cbd8b63 2026-07-10` feat: confirm rooms are restricted.
- `ba8adf3..08c0b4e 2026-07-12` chore: bump mautrix bridges for Keycloak scan schedule (4am, IdP-scoped).

---

## dalmatian

**Owner:** ScottyLabs
**Platform:** GitHub (READ-ONLY MIRROR; source on Codeberg)
**Nature:** Discord bot for CMU students, providing campus resource access including CMU Courses syllabus lookup and CMU Eats dining info. Built with Deno/TypeScript, deployed via Kennel with devenv/secretspec for secrets.
**Language(s):** TypeScript (Deno)
**Active period:** 2025-11-15 to 2026-08-03
**Fork of:** Original

### Design Decisions

- Deno runtime for TypeScript, compiled with `deno run` rather than `deno compile` (reverted after Nix packaging issues revealed compile binary portability problems on NixOS).
- Nix packaging with autoPatchelfHook to fix ELF interpreter paths for NixOS runtime.
- Drizzle ORM for database schema/migrations; migration files included in the Nix derivation.
- Kennel + secretspec integration for production deployment: secrets pulled from OpenBao vault.
- Biome for formatting and linting; treefmt for unified check.
- Postgres accessed via Unix socket in production; the devenv provides a local Postgres process.

### Ryan's Contributions

**Contributors:** TenType (36), maybe-yiyi (35), thesuperRL (33), XboxBedrock (31), ap-1 (14), Gostmeaper (14), zeyuyaoy (10), Arom1a (5). Ryan is one of five roughly equal active contributors; no single primary maintainer.

Ryan's 33 commits focus on Nix packaging and Kennel deployment plumbing:

**Nix/Kennel deployment plumbing (June 2026):**
- `4904618 2026-06-04` feat: use kennel and secretspec -- initial Kennel integration.
- `5dcf395 2026-06-04` fix: postgres unix socket fix and local kennel process.
- `8ec54ef 2026-06-08` fix: drop local secretspec provider so kennel can build kennel config.
- `9702444 2026-06-10` fix: declare autoPatchelfHook in package.nix args.
- `d9d4081 2026-06-10` fix: patchelf deno compile binary for NixOS runtime -- ELF interpreter patching.
- `1495b33 2026-06-10` fix: drop unused drizzle-zod import breaking deno compile cache.
- `5135d0d 2026-06-10` fix: restore vault provider in secretspec for Kennel builds.
- `e9310f3 2026-06-10` fix: exclude Kennel build stub .env from deno compile package.
- `930e4ae 2026-06-10` fix: include drizzle migrations in nix package.
- `fdbc490/8f03ca3 2026-06-10` fix: read env vars via process.env for Bun runtime on Kennel (reverted: runtime was Deno, not Bun).

**Bot fixes:**
- `d91bc22 2026-06-09` fix: defer role command while fetching member cache.
- `9907ee5 2026-07-23` fix: wrap error-handler reply to prevent uncaught DiscordAPIError[10062].
- `5d1c995 2026-07-23` fix: add timeouts for dining and library commands.

**Course data and formatting (Nov 2025):**
- `6c24020 2025-11-15` feat: old and reformatted syllabus files -- PDF syllabus data ingestion.
- `ed7d587 2025-11-22` fix: migrate to new course formatting.
- `f8ae25c 2025-11-22` fix: course formatting number consistency.

---

## devops-config

**Owner:** ScottyLabs
**Platform:** GitHub
**Nature:** Shared DevOps configuration template providing conventional commit linting, lint-staged, Husky pre-commit hooks, and MIT licensing scaffold for ScottyLabs projects.
**Language(s):** TypeScript
**Active period:** 2025-09-27 to 2025-12-26
**Fork of:** Original

### Design Decisions

- Commitlint + conventional commits enforced via Husky + lint-staged.
- Shared config intended to be copied into new projects as a starting point.
- MIT license added explicitly as part of this config package.

### Ryan's Contributions

Ryan bootstrapped this repo from his own templates and established the shared tooling baseline.

- `0efb054 2025-09-27` Copy from my templates -- seeded the repo from Ryan's personal template set.
- `6e3d2f5 2025-09-27` feat: Using commitlint, lint-staged, husky, and config conventional -- core linting stack.
- `ac3c1d6 2025-09-27` feat: licensing -- MIT license scaffold.
- `9176dd8 2025-09-27` feat: fix MIT license name.
- `771622e 2025-09-27` fix: remove bad cd and package rs treatment -- CI pipeline fix.
