# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  router.py
#  2. Program Description        : This file defines web addresses (API endpoints) that other
#                                  programs or a browser can call to read or save data. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Nothing visible; it only makes its folder importable or
#                                  defines shared names.
#  8. Variables                  : api_router = APIRouter()
#  9. Algorithm / Logic          : Simple file: sets up names/imports only, no step-by-step
#                                  logic.
# 10. Dependencies               : - External libraries (install with pip): fastapi.
#                                  - Other files of this project: .routes.
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

# From FastAPI, a library for building web APIs, bring in `APIRouter` so they can be used in this
# file.
from fastapi import APIRouter

# From another file of this project (`.routes`), bring in `auth`, `audit`, `explain`, `health`,
# `ingest` so they can be used in this file.
from .routes import auth, audit, explain, health, ingest
# From another file of this project (`.routes`), bring in `company as r_company` so they can be used
# in this file.
from .routes import company as r_company
# From another file of this project (`.routes`), bring in `financials as r_financials` so they can
# be used in this file.
from .routes import financials as r_financials
# From another file of this project (`.routes`), bring in `news_signal as r_news_signal` so they can
# be used in this file.
from .routes import news_signal as r_news_signal
# From another file of this project (`.routes`), bring in `warning_score as r_warning_score` so they
# can be used in this file.
from .routes import warning_score as r_warning_score
# From another file of this project (`.routes`), bring in `filing as r_filing` so they can be used
# in this file.
from .routes import filing as r_filing

# Store a group of web endpoints (nothing) in the variable `api_router`.
api_router = APIRouter()
# Plug the endpoint group `health.router` into the app.
api_router.include_router(health.router)
# Plug the endpoint group `auth.router` into the app.
api_router.include_router(auth.router)
# Plug the endpoint group `audit.router` into the app.
api_router.include_router(audit.router)
# Plug the endpoint group `ingest.router` into the app.
api_router.include_router(ingest.router)
# Plug the endpoint group `explain.router` into the app.
api_router.include_router(explain.router)
# Plug the endpoint group `r_company.router` into the app.
api_router.include_router(r_company.router)
# Plug the endpoint group `r_financials.router` into the app.
api_router.include_router(r_financials.router)
# Plug the endpoint group `r_news_signal.router` into the app.
api_router.include_router(r_news_signal.router)
# Plug the endpoint group `r_warning_score.router` into the app.
api_router.include_router(r_warning_score.router)
# Plug the endpoint group `r_filing.router` into the app.
api_router.include_router(r_filing.router)
