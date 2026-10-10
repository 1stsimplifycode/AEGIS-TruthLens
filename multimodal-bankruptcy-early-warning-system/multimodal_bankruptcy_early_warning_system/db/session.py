# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  session.py
#  2. Program Description        : This file sets up the connection to the database. It exists
#                                  so this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Records or tables saved in the database.
#  8. Variables                  : - _settings = get_settings()
#                                  - _connect_args = {'check_same_thread': False} if
#                                    _settings.database_url.st...
#                                  - engine = create_engine(_settings.database_url,
#                                    future=True, connec...
#                                  - SessionLocal = sessionmaker(bind=engine, autoflush=False,
#                                    autocommit=Fal...
#  9. Algorithm / Logic          : init_db(): init db.
# 10. Dependencies               : - External libraries (install with pip): sqlalchemy.
#                                  - Other files of this project: ..config, .base, ...
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

# From SQLAlchemy, a library for talking to databases from Python, bring in `create_engine` so they
# can be used in this file.
from sqlalchemy import create_engine
# From `sqlalchemy.orm` (part of SQLAlchemy, a library for talking to databases from Python), bring
# in `sessionmaker` so they can be used in this file.
from sqlalchemy.orm import sessionmaker

# From another file of this project (`..config`), bring in `get_settings` so they can be used in
# this file.
from ..config import get_settings
# From another file of this project (`.base`), bring in `Base` so they can be used in this file.
from .base import Base

# Store the result of the function `get_settings` (name meaning: get settings) in the variable
# `_settings`.
_settings = get_settings()
# Store `{'check_same_thread': False}` if `_settings.database_url` starts with `'sqlite'`, otherwise
# `{}` in the variable `_connect_args`.
_connect_args = {"check_same_thread": False} if _settings.database_url.startswith("sqlite") else {}

# Store a database connection engine for `_settings.database_url, future=True,
# connect_args=_connec...` in the variable `engine`.
engine = create_engine(_settings.database_url, future=True, connect_args=_connect_args)
# Store a factory that creates database sessions (`bind=engine, autoflush=False, autocommit=False,
# future=True`) in the variable `SessionLocal`.
SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False, future=True)


# Define a function (a reusable set of steps) named `init_db` (name meaning: init db). It takes no
# inputs, and gives back `None`.
def init_db() -> None:
    # Import models so they register on the metadata, then create tables.
    # From another file of this project (`..`), bring in `models` so they can be used in this file.
    from .. import models  # noqa: F401
    # Call `Base.metadata.create_all` (name meaning: create all) with `bind=engine`.
    Base.metadata.create_all(bind=engine)
