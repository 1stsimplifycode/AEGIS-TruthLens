"""
Collects timestamped OHLCV data per ticker (task #1) using jugaad-data,
which is more stable for historical NSE OHLCV than raw nsepython calls.

Install: pip install jugaad-data

Each ticker's OHLCV is saved as its own CSV under data/raw/ohlcv/, and a
catalogue entry is logged per collection run (not per row - one row per
run keeps the catalogue from exploding to millions of rows; the OHLCV file
itself is the timestamped record).
"""

import sys
from pathlib import Path
from datetime import date, datetime, timezone

sys.path.insert(0, str(Path(__file__).parent))
from catalogue_db import add_entry, init_db  # noqa: E402

RAW_DIR = Path(__file__).parent.parent / "data" / "raw" / "ohlcv"


def collect_ohlcv(ticker: str, from_date: date, to_date: date, company_name: str = None, sector: str = None):
    from jugaad_data.nse import stock_df

    print(f"Fetching {ticker} OHLCV: {from_date} -> {to_date}")
    df = stock_df(symbol=ticker, from_date=from_date, to_date=to_date, series="EQ")

    RAW_DIR.mkdir(parents=True, exist_ok=True)
    out_path = RAW_DIR / f"{ticker}_{from_date}_{to_date}.csv"
    df.to_csv(out_path, index=False)

    add_entry(
        ticker=ticker,
        modality="ohlcv",
        source="jugaad-data",
        company_name=company_name,
        sector=sector,
        file_path=str(out_path.relative_to(RAW_DIR.parent.parent)),
        event_timestamp=f"{from_date}/{to_date}",
        publication_timestamp=None,  # OHLCV isn't "published" like news - N/A
        notes=f"{len(df)} rows",
    )
    print(f"  saved {len(df)} rows -> {out_path}")
    return out_path


def collect_batch(tickers: list[str], from_date: date, to_date: date):
    """Run OHLCV collection for a list of tickers. Pull ticker/sector info
    from data/mappings/ticker_company_sector.csv if it exists."""
    import csv

    mapping_path = Path(__file__).parent.parent / "data" / "mappings" / "ticker_company_sector.csv"
    lookup = {}
    if mapping_path.exists():
        with open(mapping_path) as f:
            for row in csv.DictReader(f):
                lookup[row["ticker"]] = row

    for ticker in tickers:
        info = lookup.get(ticker, {})
        try:
            collect_ohlcv(
                ticker,
                from_date,
                to_date,
                company_name=info.get("company_name"),
                sector=info.get("sector"),
            )
        except Exception as e:
            print(f"  FAILED {ticker}: {e}")


if __name__ == "__main__":
    init_db()
    # Example: replace with your actual watchlist, ideally loaded from the
    # ticker mapping CSV once build_ticker_mapping.py has been run.
    sample_tickers = ["RELIANCE", "TCS", "HDFCBANK", "INFY"]
    collect_batch(
        sample_tickers,
        from_date=date(2026, 1, 1),
        to_date=date.today(),
    )
