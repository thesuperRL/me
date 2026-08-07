# mautrix Bridge Forks (ScottyLabs / thesuperRL)

These three repositories are Ryan's personal forks of the [mautrix](https://github.com/mautrix) suite (authored primarily by tulir, with hundreds of contributors). Ryan's role across all three is **ScottyLabs patch maintainer**: he applies a small set of ScottyLabs-specific changes on top of upstream releases. He is not a primary contributor to the upstream codebases. Contributor breakdown: mautrix-go (tulir: 1072, kegsay: 71, sumnerevans: 50 — Ryan: 1 patch commit); mautrix-discord (tulir: 443, grimmy: 89 — thesuperRL: 19); mautrix-slack (tulir: 300, vurpo: 187 — thesuperRL: 16).

---

## thesuperRL/mautrix-go

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** ScottyLabs fork of the upstream mautrix-go Go library (v0.16.x branch). Carries custom patches for bridge identity resolution and reaction mirroring that are applied on top of upstream release tags. Both mautrix-discord and mautrix-slack forks depend on this library via go.mod replace directives.
**Language(s):** Go
**Active period:** 2026-06-28 (ScottyLabs patch applied)
**Fork of:** Maintained independently (not a GitHub fork of mautrix/mautrix-go; described as a separate repo with upstream patches cherry-picked)

### Design Decisions

- Maintained on the v0.16.x release line; Ryan applies a named bundle of patches (`Apply ScottyLabs bridge patches for v0.16.3`) on top of upstream tags.
- Used as the common base for both mautrix-discord and mautrix-slack forks via `go.mod replace` so both bridges share the same patched mautrix-go.
- Patches include: HTML parser space collapsing, base64 fix in federation signatures, MSC4190 backport, authed media download hack, and the ScottyLabs-specific identity/reaction patches.

### Ryan's Contributions

Ryan maintains the ScottyLabs-specific patch bundle applied to each upstream release. His single commit on this repo applies the bundle to the upstream v0.16.3 tag; the rest of the commit history is upstream tulir/contributors work.

- `9a4f178 2026-06-28` Apply ScottyLabs bridge patches for v0.16.3 -- the canonical ScottyLabs patch commit bundling identity and reaction mirroring changes onto v0.16.3.

Upstream commits in this fork (pre-Ryan ownership) include mautrix-go v0.16.x development through v0.16.2 release. Ryan's role is patch maintenance and version tracking, not upstream feature development.

---

## thesuperRL/mautrix-discord

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** Fork of mautrix/discord (Matrix-Discord puppeting bridge based on discordgo). Carries ScottyLabs-specific patches for Keycloak identity scanning, org-role ping mirroring, relay thread behavior, and governance-linked mention mirroring.
**Language(s):** Go
**Active period:** 2026-02-16 (upstream) to 2026-08-05
**Fork of:** mautrix/discord

### Design Decisions

- Patches applied on top of upstream v0.7.6 tag (commit 08241ed) then consolidated onto vendored bridge v1 framework with mautrix-go v0.28.0 upgrade (commit d484a52).
- Local mautrix-go fork referenced via `go.mod replace` (commit 5b7a582), then switched to GitHub fork reference (commit 8a812da).
- Vendor directory committed: upstream dependency crypto APIs vendored (commits 80c2fe7, 39ee6a4) to avoid module proxy issues.
- Keycloak identity scan runs asynchronously on a 24h schedule and at deploy time; does not block message mirroring (commit d0bad9c). Scoped to Discord/Slack IdP users only (commit 588c04b).
- Role ping mirror: Discord role pings translated to/from Matrix room pings based on governance channel-team mapping (commit 3af625e).
- Mention mirroring: applied for all users, not just governance-linked accounts (commit 94ae440).
- Identity cache warmed from Keycloak on startup and when governance data changes (commits 74f4118, d264bf5).
- Relay thread fix: `bridge.relay.default_relays` honored for thread creation (commit 5932f4e, merged via PR #1).

### Ryan's Contributions

Ryan maintains the ScottyLabs patch layer on top of this bridge (19 commits vs. upstream's 443 from tulir alone). He is not a contributor to the core bridge logic.

**Patch baseline and vendor setup (June 2026):**
- `08241ed 2026-06-26` Apply ScottyLabs matrix mirroring patches on v0.7.6 -- initial ScottyLabs patch application.
- `94ae440 2026-06-28` fix: mirror mentions for all users, not just governance-linked ones.
- `5b7a582 2026-06-28` Use local mautrix-go fork via go.mod replace.
- `8a812da 2026-06-28` Use GitHub fork thesuperRL/mautrix-go.
- `d484a52 2026-06-28` Vendor bridge v1 framework and upgrade to mautrix-go v0.28.0.
- `80c2fe7 2026-06-28` fix: update vendored bridge crypto for mautrix-go v0.28 API.
- `39ee6a4 2026-06-28` fix: remaining vendored crypto API updates for v0.28.
- `412df13 2026-06-28` build(vendor): vendor filippo.io/edwards25519.

**Identity and ping mirroring (July 2026):**
- `d264bf5 2026-07-04` feat: ping mirroring -- initial ping mirroring implementation.
- `74f4118 2026-07-05` feat: add logs for error detection.
- `9131e25 2026-07-07` feat: cache matrix mirroring links when loading from keycloak.
- `3af625e 2026-07-11` feat: role ping mirror -- Discord role pings mapped to Matrix room roles.
- `d0bad9c 2026-07-12` fix: stop Keycloak identity scan from blocking message mirroring.
- `07a9412 2026-07-12` fix: run full Keycloak identity scan every 24h or on governance data change.
- `588c04b 2026-07-12` fix: scope Keycloak identity scan to discord/slack IdP users.
- `38c0a91 2026-07-12` fix: run full Keycloak scan at deploy and 4am America/New_York.

**Relay thread fix (July 2026):**
- `5932f4e 2026-07-13` fix(relay): honor bridge.relay.default_relays for thread creation (PR #1).
- `2531ca7 2026-07-13` Merge pull request #1 from thesuperRL/discord-relay-thread-fix.
- `7b0a425 2026-08-05` fix: remove worktrees.

---

## thesuperRL/mautrix-slack

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** Fork of mautrix/slack (Matrix-Slack puppeting bridge based on slack-go). Carries the same ScottyLabs-specific patches as mautrix-discord: Keycloak identity scanning, org-role ping mirroring, governance-linked mention mirroring, and identity cache warming. Also adds video/GIF file attachment bridging.
**Language(s):** Go
**Active period:** 2026-03-31 (upstream) to 2026-08-05
**Fork of:** mautrix/slack

### Design Decisions

- Patches applied on top of upstream v26.05.0 tag (commit 39f897a).
- Same mautrix-go fork dependency via go.mod replace as mautrix-discord.
- Identity cache warmed on startup (commit 57efd34) in addition to periodic refresh; Slack ghost parsing improved for outbound puppet lookups.
- Nil-deref guard on SyncChannels info fetch when channel ID is absent (commit 4add958).
- Video and GIF attachment bridging added (commit 6777ff0, PR #1); includes test coverage.
- Keycloak scan scoped to Slack IdP users only; runs asynchronously so message mirroring is not blocked.

### Ryan's Contributions

Ryan maintains the ScottyLabs patch layer on top of this bridge (16 commits vs. upstream's 300 from tulir, 187 from vurpo). Patch structure mirrors mautrix-discord closely; where the two bridges share the same feature, Ryan implemented the same fix in both.

**Patch baseline (June 2026):**
- `39f897a 2026-06-26` Apply ScottyLabs matrix mirroring patches on v0.2605.0 -- initial patch application.
- `01f0945 2026-06-28` fix: mirror mentions for all users, not just governance-linked ones.
- `089d6f6 2026-06-28` Use local mautrix-go fork via go.mod replace.
- `e2b753d 2026-06-28` Use GitHub fork thesuperRL/mautrix-go.
- `57efd34 2026-06-28` feat(connector): warm identity cache on startup.

**Identity and ping mirroring (July 2026):**
- `9b81594 2026-07-04` feat: ping mirroring.
- `5d5cb62 2026-07-07` feat: cache matrix mirroring links when loading from keycloak.
- `dbdb66a 2026-07-11` feat: role ping mirror.
- `ac15c89 2026-07-12` fix: stop Keycloak identity scan from blocking message mirroring.
- `263ca38 2026-07-12` fix: run full Keycloak identity scan every 24h or on governance data change.
- `ae7292a 2026-07-12` fix: run full Keycloak scan at deploy and 4am America/New_York.
- `36b1000 2026-07-12` fix: scope Keycloak identity scan to discord/slack IdP users.
- `4add958 2026-07-12` fix: don't nil-deref channel ID when SyncChannels info fetch fails.

**File attachment bridging (August 2026):**
- `6777ff0 2026-08-05` fix: allow for support of video and gif attachments.
- `69bfc39 2026-08-05` tests: gif related tests.
- `e9ed253 2026-08-05` Merge pull request #1 from thesuperRL/file-attachment-bridging.

---

## Cross-repo architecture note

The three repos form a dependency chain: mautrix-go (ScottyLabs base library) is referenced by both mautrix-discord and mautrix-slack via `go.mod replace`. The NixOS infrastructure repo then builds both bridge daemons from these fork sources using vendored Go modules. Ryan's governance repo generates the channel-to-team mapping that the bridges use at runtime to resolve which Matrix room corresponds to which Slack channel or Discord server role.
