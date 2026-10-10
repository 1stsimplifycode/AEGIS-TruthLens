# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  main.py
#  2. Program Description        : This file handles 'main' for the 'multimodal bankruptcy
#                                  early warning system' part of the project. It exists so this
#                                  piece of work stays in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Web (HTTP) requests: IDs in the address, and JSON data in
#                                    the request body.
#                                  - lifespan() receives: app.
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : - logger =
#                                    get_logger('multimodal_bankruptcy_early_warning_system')
#                                  - settings = get_settings()
#                                  - app = FastAPI(title=settings.title,
#                                    version=settings.version, l...
#  9. Algorithm / Logic          : - lifespan(): lifespan.
#                                  - root(): root.
# 10. Dependencies               : - External libraries (install with pip): fastapi.
#                                  - Built into Python (no install needed): contextlib.
#                                  - Other files of this project: .api.router, .config,
#                                    .core.errors, .core.logging, .db.session,
#                                    .middleware.request_context.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : Problems are written to the log for later checking.
# ==============================================================================================

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# From contextlib, Python's built-in helpers for 'with' blocks, bring in `asynccontextmanager` so
# they can be used in this file.
from contextlib import asynccontextmanager

# From FastAPI, a library for building web APIs, bring in `FastAPI` so they can be used in this
# file.
from fastapi import FastAPI
# From `fastapi.middleware.cors` (part of FastAPI, a library for building web APIs), bring in
# `CORSMiddleware` so they can be used in this file.
from fastapi.middleware.cors import CORSMiddleware

# From another file of this project (`.api.router`), bring in `api_router` so they can be used in
# this file.
from .api.router import api_router
# From another file of this project (`.config`), bring in `get_settings` so they can be used in this
# file.
from .config import get_settings
# From another file of this project (`.core.errors`), bring in `DomainError`, `domain_error_handler`
# so they can be used in this file.
from .core.errors import DomainError, domain_error_handler
# From another file of this project (`.core.logging`), bring in `configure_logging`, `get_logger` so
# they can be used in this file.
from .core.logging import configure_logging, get_logger
# From another file of this project (`.db.session`), bring in `init_db` so they can be used in this
# file.
from .db.session import init_db
# From another file of this project (`.middleware.request_context`), bring in
# `RequestContextMiddleware` so they can be used in this file.
from .middleware.request_context import RequestContextMiddleware

# Call the function `configure_logging` (name meaning: configure logging).
configure_logging()
# Store the result of the function `get_logger` (name meaning: get logger) given
# `'multimodal_bankruptcy_early_warning_system'` in the variable `logger`.
logger = get_logger("multimodal_bankruptcy_early_warning_system")
# Store the result of the function `get_settings` (name meaning: get settings) in the variable
# `settings`.
settings = get_settings()


# Apply the decorator `asynccontextmanager` to the next definition (it adds extra behaviour to it).
@asynccontextmanager
# Define an asynchronous function (a reusable set of steps) named `lifespan` (name meaning:
# lifespan). It takes: app.
async def lifespan(app: FastAPI):
    # Write an information message to the log: `'starting %s', settings.title`.
    logger.info("starting %s", settings.title)
    # Call the function `init_db` (name meaning: init db).
    init_db()
    # Hand out nothing to the caller, then pause until the next item is requested.
    yield
    # Write an information message to the log: `'stopping %s', settings.title`.
    logger.info("stopping %s", settings.title)


# Store the web application object (`title=settings.title, version=settings.version, lifespan=...`)
# in the variable `app`.
app = FastAPI(title=settings.title, version=settings.version, lifespan=lifespan)
# Add the extra request-processing layer `RequestContextMiddleware`.
app.add_middleware(RequestContextMiddleware)
# Add the extra request-processing layer `CORSMiddleware,
# allow_origins=list(settings.cors_origins)...` (this instruction continues over the next 1 line).
app.add_middleware(CORSMiddleware, allow_origins=list(settings.cors_origins),
                   allow_methods=["*"], allow_headers=["*"])
# Call `app.add_exception_handler` (name meaning: add exception handler) with `DomainError,
# domain_error_handler`.
app.add_exception_handler(DomainError, domain_error_handler)
# Plug the endpoint group `api_router` into the app.
app.include_router(api_router)


# Register the function below as the web endpoint that handles requests to read data (GET) at the
# address `'/'`.
@app.get("/")
# Define a function (a reusable set of steps) named `root` (name meaning: root). It takes no inputs.
def root():
    # Send back a dictionary (lookup table) with 3 entries as the result of this function.
    return {"service": settings.title, "slug": settings.slug, "docs": "/docs"}
