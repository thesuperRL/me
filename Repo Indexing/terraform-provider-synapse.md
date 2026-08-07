# terraform-provider-synapse

**Owner:** thesuperRL (personal fork of ScottyLabs' fork)
**Platform:** Codeberg (thesuperRL/terraform-provider-synapse)
**Nature:** A Terraform/OpenTofu provider for the Synapse Admin API, extended by Ryan with a custom resource (`synapse_mautrix_slack_link`) that bridges Slack channels into mautrix-discord portal rooms for ScottyLabs' Matrix/Discord/Slack communication infrastructure. Upstreamed from risson/terraform-provider-synapse via ScottyLabs.
**Language(s):** Go
**Active period:** 2026-05 to 2026-07 (based on commit messages)
**Fork of:** ScottyLabs fork of risson/terraform-provider-synapse (GitLab)

## Design Decisions

- Implemented using the Terraform Plugin SDK v2 (`github.com/hashicorp/terraform-plugin-sdk/v2`); not migrated to the newer Plugin Framework
- Uses `maunium.net/go/mautrix` as the Matrix client library for admin room messaging and bridge state inspection
- `synapse_mautrix_slack_link` is a custom ScottyLabs-only resource; it does NOT create Matrix hub rooms; Discord is the source of truth and the portal room is pre-existing
- Bridge state detection uses both room alias lookup (`#discord_<channel_id>`) and `m.bridge` state event scan on the portal room to determine if a Slack channel is already plumbed
- Idempotency: on plan/apply, the resource checks live bridge state before sending any bot commands; only sends `!slack bridge ... --ignore-permissions --overwrite` if the Slack channel is not yet plumbed, and only sends `!discord set-relay --create mautrix` if the mautrix relay webhook is absent
- Auth model split by resource: `synapse_user` and `synapse_membership` use username+password, while `synapse_mautrix_slack_link` uses `admin_token` (`MATRIX_ADMIN_TOKEN`)
- `slack_team_id` and `slack_relay_login_id` are optional provider config, resolved from `data/org.toml` via governance's Terraform locals at apply time
- `synapse/mautrixbridge/` subdirectory contains the Matrix bridge client and bridge state types (`bridge_status.go`, `client.go`) with unit tests (`bridge_status_test.go`)
- Bug fix `fix: decode admin rooms next_batch as json.Number` addresses a type assertion failure in the Synapse pagination token when the value is a number rather than a string
- Registry namespace: `thesuperrl/synapse` (personal Codeberg registry mirror)
- Build: `go build -o terraform-provider-synapse .`; also has a Dockerfile and goreleaser configs for both GitHub and GitLab CI

## Ryan's Contributions

Ryan authored all commits on this personal fork (sole developer on this repo):

- `ce85a5a` feat: add synapse_mautrix_slack_link (ScottyLabs fork) - initial new resource implementing the Discord/Slack bridge linking via mautrix bot commands
- `4dbcd4a` docs: thesuperrl registry namespace
- `0806ba3` Update README.md
- `ebc9a95` feat: mirror via app
- `4d59809` fix: create relay with mautrix
- `1025652` fix: no duplicate
- `1be6b08` fix: only rebridge if unbridged
- `9ccc2d9` fix: misparse of synapse api
- `0ac45c7` fix: stop re-bridging on plan refresh and match bare Slack channel IDs
- `3cf93e3` fix: decode admin rooms next_batch as json.Number
- `696b108` fix: confirm portal bridge state before returning from ReconcilePortalBridge
- `c73b79f` Merge pull request: fix: decode admin rooms next_batch as json.Number
- `911d4c2` Merge pull request: fix: confirm portal bridge state before returning from ReconcilePortalBridge

### Key Go files

- `synapse/resource_mautrix_slack_link.go`: full CRUD implementation for the `synapse_mautrix_slack_link` resource. Schema fields include `discord_channel_id` (required, ForceNew), `slack_channel_id` (required), team/project metadata (optional), and computed outputs `room_alias`, `room_id`, `slack_bridged`, `discord_relay_configured`.
- `synapse/provider.go`: provider schema including `homeserver_url`, `domain`, `username`, `password`, `admin_token`, `slack_bot_id`, and `slack_relay_login_id`.
- `synapse/mautrixbridge/bridge_status.go` + `client.go`: Matrix client wrapper for querying bridge state and sending bot commands in admin rooms.
- `synapse/errors.go`, `resource_user.go`, `resource_membership.go`, `datasource_user.go`: upstream Synapse user/membership resources (inherited from risson).
