# arknights-website

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A full-stack Arknights teambuilding and reference website with a TypeScript/Express backend, React/Vite frontend, and PostgreSQL account storage. Covers tier lists, team building, Integrated Strategies (roguelite mode) tools, operator pages, synergy analysis, and collectibles tracking. Actively maintained with biweekly automated data scrapes.
**Language(s):** TypeScript (frontend React + backend Express), HTML/CSS
**Active period:** 2026-02-19 - 2026-08-01 (ongoing)
**Fork of:** Original

## Design Decisions

- Split architecture: Node/Express backend serves a REST API; React+Vite frontend is deployable independently to GitHub Pages. A `VITE_API_BASE` secret in GitHub Actions wires the frontend to the backend at build time.
- Cross-origin auth: backend uses `SameSite=None; Secure` session cookies when `CORS_ORIGIN` is set, enabling login from GitHub Pages to a separate backend host (Render, Railway, etc.).
- Account and auth data stored in PostgreSQL only; the app auto-creates the `accounts` table on startup.
- Operator images split into a separate git submodule (`arknights-pfp-dataset`) after growing too large. The site references `default/` subfolder for quick operator face lookups.
- Biweekly GitHub Actions workflows auto-scrape operator data and collectibles and commit updates with `[skip ci]` to avoid triggering deploys.
- Frontend pages cover a wide surface: `TeamBuilderPage`, `TierListsPage`, `OperatorPage`, `SynergiesPage`, `IntegratedStrategiesPage`, `IsHopeCostsPage`, `IsNicheWeightPoolsPage`, `FreeOperatorsPage`, `LowRarityPage`, `GlobalRangeOperatorsPage`, `TrashOperatorsPage`, `UnconventionalNichesPage`, `AllOperatorsPage`, `ChangelogPage`, `UserGuidePage`, and auth pages.
- Niche lists stored as JSON files under `data/niche-lists/` covering categories like anti-air, AOE arts DPS, boss-killing, elemental damage, fast-redeploy, fragile, healing, etc.
- Language selector context (`LanguageContext`) suggests EN/CN localization support for operator names or data.
- An `arknights-randomizer` companion site is referenced via `VITE_RANDOMIZER_URL`, defaulting to the GitHub Pages URL of that repo.

## Ryan's Contributions

Ryan is the sole developer. The repo was started on 2026-02-19 and has seen continuous feature development through mid-2026:

- Initial build: Express + React+Vite scaffold, auth with PostgreSQL, operator data pipeline.
- `1000184` - Add locked operators feature.
- `3d3f707` - Auth improvements and small fixes.
- `81335d9` - Feedback forms.
- `856d0b1` - Toggle badges feature.
- `487dc5b`, `e2ec255b`, `262372d` - Add new characters and unreleased operators (with blur for unreleased).
- `cea894e` - Blur unreleased operators.
- `d795994` - Fix teambuilds.
- `6864eb2` - Move operator profile pictures to a separate dataset repository (now a submodule).
- `3c0bf20` - Update references to use `default/` image folder.
- `db2960c` - Update submodule and docs for skin scraping feature.
- `08b9d80 2026-06-20` - Add `VITE_RANDOMIZER_URL` support for custom subdomain deployments.
- Ongoing: automated collectibles and operator data scrapes committed on a biweekly and monthly schedule through 2026-08-01.
