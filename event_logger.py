"""
Logs corporate events (earnings, board meetings, M&A, results - task #6) and
index/sector-wide events affecting multiple stocks (task #7).

NSE does publish a corporate-announcements feed (bhavcopy/corporate-actions
endpoints), but it's inconsistent and needs a logged-in session for the full
feed. For a first pass, this script supports:
  1. Manual/curated entry (add_corporate_event, add_index_event) - fastest
     way to get high-quality labeled events for RAMA training data.
  2. A stub for NSE's public corporate-announcements CSV, to extend later.

Manual curation is not a weakness here - for detecting *manipulation*, you
want a small number of precisely-timestamped, verified events more than a
huge noisy auto-scraped set.
"""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from catalogue_db import add_entry, init_db  # noqa: E402


def add_corporate_event(ticker: str, event_type: str, event_timestamp: str,
                         description: str, company_name: str = None, sector: str = None,
                         source: str = "manual"):
    """event_type e.g. 'earnings', 'board_meeting', 'merger', 'guidance_revision'"""
    add_entry(
        ticker=ticker,
        modality="corporate_event",
        source=source,
        company_name=company_name,
        sector=sector,
        event_timestamp=event_timestamp,
        publication_timestamp=event_timestamp,
        notes=f"[{event_type}] {description}",
    )
    print(f"Logged corporate event: {ticker} / {event_type} @ {event_timestamp}")


def add_index_event(affected_tickers: list[str], index_or_sector: str, event_timestamp: str,
                     description: str, source: str = "manual"):
    """Logs one event against every affected ticker, tagged with the shared
    index/sector so downstream modules can find co-moving stocks easily."""
    for ticker in affected_tickers:
        add_entry(
            ticker=ticker,
            modality="index_event",
            source=source,
            event_timestamp=event_timestamp,
            publication_timestamp=event_timestamp,
            linked_index_or_sector=index_or_sector,
            notes=description,
        )
    print(f"Logged index/sector event across {len(affected_tickers)} tickers: {description}")


if __name__ == "__main__":
    init_db()
    # Examples - replace with real curated events
    add_corporate_event(
        ticker="RELIANCE",
        event_type="earnings",
        event_timestamp="2026-07-19T15:30:00+05:30",
        description="Q1 FY27 results announcement",
    )
    add_index_event(
        affected_tickers=["HDFCBANK", "ICICIBANK", "SBIN", "KOTAKBANK"],
        index_or_sector="NIFTY_BANK",
        event_timestamp="2026-08-06T10:00:00+05:30",
        description="RBI monetary policy announcement - repo rate held",
    )
