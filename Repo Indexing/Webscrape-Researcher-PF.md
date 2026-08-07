# Webscrape-Researcher-For-PF

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A Python tool built for Public Forum (PF) debate research. Given a query string, it searches Google via SerpAPI, scrapes the returned URLs with BeautifulSoup, and ranks the scraped text passages by semantic relevance to the query using a HuggingFace sentence-transformer model. Returns the top matching paragraphs with source links.
**Language(s):** Python
**Active period:** 2023-08-04 to 2023-08-05
**Fork of:** Original

## Design Decisions

- Pipeline split into three scripts: `access_search_results.py` (SerpAPI query), `scrape_webpage.py` (BeautifulSoup HTML extraction), `ai_relation_checker.py` (relevance ranking and orchestration)
- Uses `sentence-transformers/msmarco-distilbert-base-tas-b` from HuggingFace Inference API for semantic similarity scoring rather than keyword matching; avoids running a local model
- Supports both standard Google Search and Google Scholar Search via a `googlescholarsearch` flag, making it usable for academic evidence cards
- Results sorted by a float relevance score returned by the transformer model; top N are printed with source URL
- API keys (SerpAPI, HuggingFace) loaded from `.env` via `python-dotenv`; no hardcoded credentials
- Minimal dependencies: `google-search-results`, `requests`, `beautifulsoup4`, `python-dotenv`, `unicodedata2`

## Ryan's Contributions

Sole developer. Built the entire tool from scratch in a single day (Aug 4-5 2023).

Key implementation details:
- `run_web_query(query_string, googlescholarsearch=False, total_searches=10, first_responses=10)` in `main.py` is the top-level entry point
- `construct_query_json` in `ai_relation_checker.py` assembles the HuggingFace batch inference payload: one `source_sentence` (the query) against N `sentences` (scraped paragraphs)
- `match_and_sort` pairs relevance scores back to source dicts and sorts descending
- `print_best_match` outputs the top results with their URLs
- 4 commits total: initial implementation plus minor fixes
