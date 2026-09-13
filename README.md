# AEGIS-Market Data Ingestion Layer

Starter scaffold for the data collection task list. Kept fully separate from
the 16-module pipeline so the data source can be swapped later (e.g. free
NSE sources now, Zerodha Kite Connect after a paying pilot) without touching
downstream modules.

## Task → Script mapping

| Task from the brief | Script | Notes |
|---|---|---|
| Timestamped OHLCV + news sources | `ohlcv_collector.py` | jugaad-data, more stable than raw NSE scraping |
| Company news + stock-period info | `news_collector.py` | RSS-based; publication timestamps come free |
| Financial video/audio + stock | `video_ingest.py` | Enforces `Stockname_timestamp_source.mp4` naming |
| Catalogue publication dates/times | built into `catalogue_db.py` | every entry has `publication_timestamp` |
| Ticker ↔ company ↔ sector mapping | `build_ticker_mapping.py` | NSE equity master + sectoral index lists |
| Corporate events linked to moves | `event_logger.py` → `add_corporate_event()` | curated manual entry recommended |
| Index/sector events, multi-stock | `event_logger.py` → `add_index_event()` | tags all affected tickers in one call |
| Multimodal source catalogue | `catalogue_db.py` | single SQLite table, one row per artifact |

## Setup

```bash
pip install jugaad-data feedparser requests
python scripts/catalogue_db.py          # creates the DB
python scripts/build_ticker_mapping.py  # run once, refresh periodically
python scripts/ohlcv_collector.py       # edit sample_tickers to your watchlist
python scripts/news_collector.py
python scripts/event_logger.py          # add real curated events here
```

For video: whenever you save a clip from anywhere, run

```bash
python scripts/video_ingest.py /path/to/clip.mp4 \
  --ticker RELIANCE --timestamp 2026-09-13T14:30:00Z --source CNBCTV18
```

## Checking coverage

```python
from scripts.catalogue_db import coverage_summary
for row in coverage_summary():
    print(row)   # (ticker, modality, count)
```

This tells you at a glance which tickers are missing which modality - useful
for spotting gaps before they become holes in RAMA's training data.

## What's stubbed vs. real

- **OHLCV**: real, works once `jugaad-data` is installed and network access exists.
- **News**: real RSS feeds, but the ticker-matching is a naive first-word
  substring match — swap in `rapidfuzz` for fuzzy matching once volume grows,
  or replace with an LLM-based extraction pass over headlines.
- **Ticker mapping**: real NSE source, but sector coverage is only as good as
  the sectoral index CSVs listed — extend `SECTOR_INDEX_URLS` with more indices.
- **Corporate/index events**: intentionally manual-first. For manipulation
  detection, a smaller set of verified, precisely-timestamped events beats a
  large noisy auto-scraped set — but a scraper stub can be added once the
  manual pattern is validated.

## Next steps

1. Run these against your actual watchlist and check `coverage_summary()`.
2. Decide the fuzzy-matching approach for news→ticker linking before volume grows.
3. Once this is stable, this becomes the "swap-in" data source layer feeding
   the 16-module pipeline, per the modular design principle.
