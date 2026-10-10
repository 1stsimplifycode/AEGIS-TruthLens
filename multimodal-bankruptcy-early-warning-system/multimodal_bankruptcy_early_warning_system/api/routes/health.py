# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  health.py
#  2. Program Description        : This file defines web addresses (API endpoints) that other
#                                  programs or a browser can call to read or save data. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : Web (HTTP) requests: IDs in the address, and JSON data in
#                                  the request body.
#  7. Output                     : - JSON responses sent back to whoever called the web
#                                    endpoint.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : - router = APIRouter(tags=['system'])
#                                  - _START = time.time()
#  9. Algorithm / Logic          : - health(): health.
#                                  - ready(): ready.
# 10. Dependencies               : - External libraries (install with pip): fastapi.
#                                  - Built into Python (no install needed): time.
#                                  - Other files of this project: ...config.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : No special error handling. If something goes wrong, Python
#                                  stops and prints an error message explaining what failed.
# ==============================================================================================

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# Load time, Python's built-in clock and timing tools.
import time

# From FastAPI, a library for building web APIs, bring in `APIRouter` so they can be used in this
# file.
from fastapi import APIRouter

# From another file of this project (`...config`), bring in `get_settings` so they can be used in
# this file.
from ...config import get_settings

# Store a group of web endpoints (`tags=['system']`) in the variable `router`.
router = APIRouter(tags=["system"])
# Store the current time in seconds in the fixed setting (constant) `_START`.
_START = time.time()


# Register the function below as the web endpoint that handles requests to read data (GET) at the
# address `'/health'`.
@router.get("/health")
# Define a function (a reusable set of steps) named `health` (name meaning: health). It takes no
# inputs.
def health():
    # Store the result of the function `get_settings` (name meaning: get settings) in the variable
    # `s`.
    s = get_settings()
    # Send back a dictionary (lookup table) with 3 entries as the result of this function.
    return {"status": "ok", "service": s.title, "version": s.version}


# Register the function below as the web endpoint that handles requests to read data (GET) at the
# address `'/ready'`.
@router.get("/ready")
# Define a function (a reusable set of steps) named `ready` (name meaning: ready). It takes no
# inputs.
def ready():
    # Send back a dictionary (lookup table) with 2 entries as the result of this function.
    return {"ready": True, "uptime_seconds": round(time.time() - _START, 2)}
