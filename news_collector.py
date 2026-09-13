"""
Collects company news + stock-period info (task #2) and catalogues
publication timestamps (task #4).

Uses RSS feeds as the primary source - far more stable than scraping, and
publication timestamps come built-in (RSS `pubDate`), which directly satisfies
task #4's "catalogue publication dates/times" requirement without extra work.

Install: pip install feedparser

Swap/add feed URLs as needed. This is intentionally a thin collector - point
it at more feeds (Moneycontrol, Economic Times Markets, Livemint Markets,
Business Standard Markets) as you find reliable ones.
"""

import re
import sys
import json
from pathlib import Path
from datetime import datetime, timezone

sys.path.insert(0, str(Path(__file__).parent))
from catalogue_db import add_entry, init_db  # noqa: E402

RAW_DIR = Path(__file__).parent.parent / "data" / "news"

FEEDS = {
    "moneycontrol_markets": "https://www.moneycontrol.com/rss/marketreports.xml",
    "economictimes_markets": "https://economictimes.indiatimes.com/markets/rssfeeds/1977021501.cms",
    "livemint_markets": "https://www.livemint.com/rss/markets",
}


def guess_tickers(text: str, ticker_lookup: dict) -> list[str]:
    """Naive company-name -> ticker matcher. Good enough for a first pass;
    swap for fuzzy matching (rapidfuzz) once volume grows."""
    hits = []
    text_lower = text.lower()
    for ticker, info in ticker_lookup.items():
        name = (info.get("company_name") or "").lower()
        if name and name.split()[0] in text_lower:
            hits.append(ticker)
    return hits


def load_ticker_lookup():
    import csv

    mapping_path = Path(__file__).parent.parent / "data" / "mappings" / "ticker_company_sector.csv"
    lookup = {}
    if mapping_path.exists():
        with open(mapping_path) as f:
            for row in csv.DictReader(f):
                lookup[row["ticker"]] = row
    return lookup


def collect_news():
    import feedparser

    RAW_DIR.mkdir(parents=True, exist_ok=True)
    ticker_lookup = load_ticker_lookup()

    for source_name, url in FEEDS.items():
        print(f"Fetching feed: {source_name}")
        feed = feedparser.parse(url)

        for entry in feed.entries:
            title = entry.get("title", "")
            summary = entry.get("summary", "")
            link = entry.get("link", "")
            pub = entry.get("published_parsed")
            pub_iso = (
                datetime(*pub[:6], tzinfo=timezone.utc).isoformat() if pub else None
            )

            matched_tickers = guess_tickers(f"{title} {summary}", ticker_lookup)
            if not matched_tickers:
                continue  # skip general market noise not tied to a specific stock

            # save raw article record
            safe_title = re.sub(r"[^a-zA-Z0-9]+", "_", title)[:60]
            out_path = RAW_DIR / f"{source_name}_{safe_title}.json"
            out_path.write_text(json.dumps({
                "title": title, "summary": summary, "link": link,
                "published": pub_iso, "matched_tickers": matched_tickers,
            }, indent=2))

            for ticker in matched_tickers:
                info = ticker_lookup.get(ticker, {})
                add_entry(
                    ticker=ticker,
                    modality="news_text",
                    source=source_name,
                    company_name=info.get("company_name"),
                    sector=info.get("sector"),
                    file_path=str(out_path.relative_to(RAW_DIR.parent.parent)),
                    event_timestamp=pub_iso,
                    publication_timestamp=pub_iso,
                    notes=link,
                )
            print(f"  matched: {title[:60]}... -> {matched_tickers}")


if __name__ == "__main__":
    init_db()
    collect_news()
