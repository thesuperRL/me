# arknights-pfp-dataset

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A dataset repository containing all operator profile pictures scraped from the Arknights Wiki, plus the Python scraper used to collect and update them. Split out from arknights-website when the image files grew too large to keep in the main repo; used as a git submodule there.
**Language(s):** Python (scraper), PNG image assets
**Active period:** 2026-06-27 - 2026-06-28
**Fork of:** Original

## Design Decisions

- Two output modes: `default/` (one PNG per operator named `{operator-id}.png`) for fast lookups, and `all/{operator-id}/` (all skins organized by operator) for the complete collection.
- Scraper uses Playwright with Firefox because Chromium is blocked by Cloudflare on the Arknights Wiki. Discovered and documented mid-development: "WORKING: Firefox bypasses Cloudflare successfully!" commit.
- CI scraping is blocked by Cloudflare; a `SCRAPING.md` documents a local-only workflow. A convenience script `scrape_all.sh` covers the full rarity range.
- Skin detection looks for `skin` in the image URL (not `avatar`), fixed after a bug where skin images were missed.
- Skips images already present to make re-runs idempotent.
- `data/` directory (temporary JSON from scraping) is gitignored.

## Ryan's Contributions

Ryan is the sole developer. Built and debugged over a single intensive day (2026-06-27 to 2026-06-28):

- `332d5e1` - Initial TypeScript scraper setup.
- `f8293b2` - Switch to system Chrome.
- `a31d407` - Rewrite scraper in Python for simplicity.
- `f7e0886` - Optimize for speed and remove TypeScript entirely.
- `b48aa94` - Improve table detection with multiple fallbacks.
- `e690ed1` - Add Cloudflare bypass improvements.
- `6d99edf` - Increase Cloudflare wait timeout to 60s and add debugging.
- `47c34c6` - Add debug output to understand page structure.
- `b748318` - Key fix: Firefox bypasses Cloudflare. Marked "WORKING" in commit message.
- `2ace532` - Update workflow to use Firefox instead of Chromium.
- `fca23ff` - Fix skin detection: look for `skin` in URL rather than `avatar`.
- `7438f1d` - Fix double `.png` extension in skin filenames.
- `7e82ea5` - Scrape run committing the full dataset.
