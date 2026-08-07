# TartanHacks-2026 (Survey)

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A hackathon project built at TartanHacks 2026 (CMU, February 2026): an interactive news map that pins geo-located news articles on a Mapbox world map, lets users explore article locations with Street View, and includes a financial portfolio planning mode with stock tracking and AI-powered company analysis.
**Language(s):** JavaScript (React frontend), Python (Flask backend)
**Active period:** 2026-02-06 - 2026-02-08
**Fork of:** Original

## Design Decisions

- Two-service architecture: Python/Flask backend on port 5004 (avoiding macOS AirPlay conflict on 5000), React frontend on port 3000.
- Backend pipeline: `NewsScraper` aggregates articles from multiple sources; `NewsProcessor` (backed by OpenAI via `openrouter_client.py`) detects article locations and categorizes them as financial or political; results are cached in `backend/cache/` as JSON to avoid re-scraping.
- Location detection uses OpenAI to infer geographic coordinates from article text, enabling map pin placement without structured location data in the feed.
- Mapbox integration: map markers for news articles, Street View overlay when a pin is clicked, and category-based filtering (Financial / Political / All).
- Financial mode: `PortfolioPlanner.js` component overlays a stock portfolio interface. `StockPredictor` and `PortfolioPredictor` provide AI-generated stock movement analysis. `CompanyDataProvider` and `companies_data.py` supply company metadata for top firms.
- "Popular Articles" sidebar: article titles blurred by default, revealed on click.
- Built over roughly 24 hours; final commits include key removal (`remove keys`) and a "final commits" squash, typical of a hackathon push.

## Ryan's Contributions

Built as a team project at TartanHacks 2026. Ryan's commits cover both frontend and backend:

- `eaad789` - Fix: better location prediction (OpenAI prompt tuning for geo-detection).
- `71e559e` - Feat: political mode, Street View integration, and UI fixes.
- `5373d77` - Revert knowledge graph (abandoned feature).
- `21f353f` - Knowledge graph exploration (later reverted).
- `d30f25b` - Update `app.py` backend.
- `f0b20ab`, `e8de9b3` - Create `PortfolioPlanner.js` and `PortfolioPlanner.css`.
- `bf750db`, `ce03e04` - Add and merge Top Companies feature.
- `1aecad2`, `7bc5ee6`, `c53463f` - App.js and Sidebar updates for category switching.
- `3430010` - Back button navigation.
- `947e3a9` - Final commits before submission.
- `a3276f8` - Post-hackathon fixes.
- `af4d777` - Remove API keys from committed files.
