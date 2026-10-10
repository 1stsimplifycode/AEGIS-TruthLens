# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  audit.py
#  2. Program Description        : This file defines web addresses (API endpoints) that other
#                                  programs or a browser can call to read or save data. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Web (HTTP) requests: IDs in the address, and JSON data in
#                                    the request body.
#                                  - audit_log() receives: limit, db.
#                                  - add_audit() receives: action, detail, db.
#  7. Output                     : - JSON responses sent back to whoever called the web
#                                    endpoint.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : router = APIRouter(prefix='/audit', tags=['audit'])
#  9. Algorithm / Logic          : - audit_log(): audit log.
#                                  - add_audit(): add audit.
# 10. Dependencies               : - External libraries (install with pip): fastapi,
#                                    sqlalchemy.
#                                  - Other files of this project: ...api.deps,
#                                    ...services.audit_service.
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
# From another file of this project (`...services.audit_service`), bring in `list_audit`,
# `record_audit` so they can be used in this file.
from ...services.audit_service import list_audit, record_audit

# Store a group of web endpoints (`prefix='/audit', tags=['audit']`) in the variable `router`.
router = APIRouter(prefix="/audit", tags=["audit"])


# Register the function below as the web endpoint that handles requests to read data (GET) at the
# address `(the group's main address)`.
@router.get("")
# Define a function (a reusable set of steps) named `audit_log` (name meaning: audit log). It takes:
# limit (default 100), db (default Depends(get_db)).
def audit_log(limit: int = 100, db: Session = Depends(get_db)):
    # Send back the result of the function `list_audit` (name meaning: list audit) given `db,
    # limit=limit` as the result of this function.
    return list_audit(db, limit=limit)


# Register the function below as the web endpoint that handles requests to create data (POST) at the
# address `(the group's main address)`.
@router.post("")
# Define a function (a reusable set of steps) named `add_audit` (name meaning: add audit). It takes:
# action, detail (default ''), db (default Depends(get_db)).
def add_audit(action: str, detail: str = "", db: Session = Depends(get_db)):
    # Send back the result of the function `record_audit` (name meaning: record audit) given `db,
    # action=action, detail=detail` as the result of this function.
    return record_audit(db, action=action, detail=detail)
