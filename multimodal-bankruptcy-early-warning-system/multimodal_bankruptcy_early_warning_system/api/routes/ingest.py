# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  ingest.py
#  2. Program Description        : This file defines web addresses (API endpoints) that other
#                                  programs or a browser can call to read or save data. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Web (HTTP) requests: IDs in the address, and JSON data in
#                                    the request body.
#                                  - ingest_batch() receives: rows, db.
#  7. Output                     : - JSON responses sent back to whoever called the web
#                                    endpoint.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : router = APIRouter(prefix='/ingest', tags=['ingestion'])
#  9. Algorithm / Logic          : ingest_batch(): ingest batch.
# 10. Dependencies               : - External libraries (install with pip): fastapi,
#                                    sqlalchemy.
#                                  - Other files of this project: ...api.deps,
#                                    ...repositories.company, ...schemas.company.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - A database is reachable using the configured connection
#                                    settings.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : No special error handling. If something goes wrong, Python
#                                  stops and prints an error message explaining what failed.
# ==============================================================================================

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# From FastAPI, a library for building web APIs, bring in `APIRouter`, `Depends` so they can be used
# in this file.
from fastapi import APIRouter, Depends
# From `sqlalchemy.orm` (part of SQLAlchemy, a library for talking to databases from Python), bring
# in `Session` so they can be used in this file.
from sqlalchemy.orm import Session

# From another file of this project (`...api.deps`), bring in `get_db` so they can be used in this
# file.
from ...api.deps import get_db
# From another file of this project (`...repositories.company`), bring in `company_repository as
# repo` so they can be used in this file.
from ...repositories.company import company_repository as repo
# From another file of this project (`...schemas.company`), bring in `CompanyCreate` so they can be
# used in this file.
from ...schemas.company import CompanyCreate

# Store a group of web endpoints (`prefix='/ingest', tags=['ingestion']`) in the variable `router`.
router = APIRouter(prefix="/ingest", tags=["ingestion"])


# Register the function below as the web endpoint that handles requests to create data (POST) at the
# address `'/company/batch'`.
@router.post("/company/batch")
# Define a function (a reusable set of steps) named `ingest_batch` (name meaning: ingest batch). It
# takes: rows, db (default Depends(get_db)).
def ingest_batch(rows: list[CompanyCreate], db: Session = Depends(get_db)):
    # Store a new list made by taking each `r` in `rows` and computing
    # `r.model_dump(exclude_none=True)` in the variable `payload`.
    payload = [r.model_dump(exclude_none=True) for r in rows]
    # Store the result of calling `repo.bulk_create` (name meaning: bulk create) with `db, payload`
    # in the variable `inserted`.
    inserted = repo.bulk_create(db, payload)
    # Send back a dictionary (lookup table) with 2 entries as the result of this function.
    return {"inserted": inserted, "entity": "Company"}
