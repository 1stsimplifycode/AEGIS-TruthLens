"""
Builds ticker <-> company-name <-> sector mapping (task #5).

NSE publishes an official equity master list (symbol, name, ISIN, sector-ish
'series') as a downloadable CSV. This is the cleanest free source - no scraping
fragility like raw NSE API calls.

Usage:
    python build_ticker_mapping.py

Requires internet access wherever this actually runs (not in this sandbox).
"""

import csv
from pathlib import Path

OUT_PATH = Path(__file__).parent.parent / "data" / "mappings" / "ticker_company_sector.csv"

# NSE's official listed-equity master. Update the URL if NSE changes it.
NSE_EQUITY_LIST_URL = "https://archives.nseindia.com/content/equity/EQUITY_L.csv"

# NSE doesn't give clean GICS-style sectors in that file - sector needs a second
# source. nsetools / nsepython expose sector via the quote endpoint per-symbol,
# which is slow (1 call per ticker). For an initial pass, pull sector from
# NSE's sectoral indices constituent lists instead (much fewer calls):
SECTOR_INDEX_URLS = {
    "NIFTY_BANK": "https://archives.nseindia.com/content/indices/ind_niftybanklist.csv",
    "NIFTY_IT": "https://archives.nseindia.com/content/indices/ind_niftyitlist.csv",
    "NIFTY_AUTO": "https://archives.nseindia.com/content/indices/ind_niftyautolist.csv",
    "NIFTY_PHARMA": "https://archives.nseindia.com/content/indices/ind_niftypharmalist.csv",
    "NIFTY_FMCG": "https://archives.nseindia.com/content/indices/ind_niftyfmcglist.csv",
    "NIFTY_METAL": "https://archives.nseindia.com/content/indices/ind_niftymetallist.csv",
    "NIFTY_ENERGY": "https://archives.nseindia.com/content/indices/ind_niftyenergylist.csv",
    "NIFTY_REALTY": "https://archives.nseindia.com/content/indices/ind_niftyrealtylist.csv",
    "NIFTY_FIN_SERVICE": "https://archives.nseindia.com/content/indices/ind_niftyfinservicelist.csv",
    # add more sectoral indices as needed
}

# NSE blocks non-browser user agents on archives.nseindia.com - a browser-like
# header set is required or every request 403s.
HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
        "(KHTML, like Gecko) Chrome/124.0 Safari/537.36"
    ),
    "Accept": "text/csv,*/*",
}


def fetch_csv(url: str, session) -> list[dict]:
    resp = session.get(url, headers=HEADERS, timeout=15)
    resp.raise_for_status()
    lines = resp.content.decode("utf-8-sig").splitlines()
    return list(csv.DictReader(lines))


def build_mapping():
    import requests

    session = requests.Session()
    # NSE requires a warm-up hit to the homepage to set cookies before archives work
    session.get("https://www.nseindia.com", headers=HEADERS, timeout=15)

    print("Fetching master equity list...")
    equity_rows = fetch_csv(NSE_EQUITY_LIST_URL, session)

    mapping = {}
    for row in equity_rows:
        symbol = row.get("SYMBOL", "").strip()
        name = row.get("NAME OF COMPANY", "").strip()
        if symbol:
            mapping[symbol] = {"ticker": symbol, "company_name": name, "sector": None}

    print(f"Loaded {len(mapping)} tickers. Tagging sectors from index constituent lists...")
    for sector_name, url in SECTOR_INDEX_URLS.items():
        try:
            sector_rows = fetch_csv(url, session)
        except Exception as e:
            print(f"  skip {sector_name}: {e}")
            continue
        for row in sector_rows:
            symbol = row.get("Symbol", "").strip()
            if symbol in mapping:
                mapping[symbol]["sector"] = sector_name.replace("NIFTY_", "").title()

    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    with open(OUT_PATH, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["ticker", "company_name", "sector"])
        writer.writeheader()
        for row in mapping.values():
            writer.writerow(row)

    unmapped = sum(1 for v in mapping.values() if not v["sector"])
    print(f"Wrote {len(mapping)} rows to {OUT_PATH}")
    print(f"{unmapped} tickers have no sector tag yet (add more sectoral index URLs, "
          f"or fill remaining manually / via per-symbol quote lookups).")


if __name__ == "__main__":
    build_mapping()
