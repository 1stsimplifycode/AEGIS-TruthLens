# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  deps.py
#  2. Program Description        : This file provides shared helpers (such as opening a
#                                  database connection) that the web endpoints reuse. It exists
#                                  so this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Nothing visible; it only makes its folder importable or
#                                  defines shared names.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : get_db(): get db.
# 10. Dependencies               : - External libraries (install with pip): sqlalchemy.
#                                  - Built into Python (no install needed): typing.
#                                  - Other files of this project: ..db.session.
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

# From typing, Python's built-in labels that describe what type a value is, bring in `Iterator` so
# they can be used in this file.
from typing import Iterator

# From `sqlalchemy.orm` (part of SQLAlchemy, a library for talking to databases from Python), bring
# in `Session` so they can be used in this file.
from sqlalchemy.orm import Session

# From another file of this project (`..db.session`), bring in `SessionLocal` so they can be used in
# this file.
from ..db.session import SessionLocal


# Define a function (a reusable set of steps) named `get_db` (name meaning: get db). It takes no
# inputs, and gives back `Iterator[Session]`.
def get_db() -> Iterator[Session]:
    # Store a new `SessionLocal` object in the variable `db`.
    db = SessionLocal()
    # Try the following steps; if an error happens, jump to the matching 'except' part instead of
    # crashing.
    try:
        # Hand out the value of `db` to the caller, then pause until the next item is requested.
        yield db
    # Always do the following clean-up steps, whether or not an error happened.
    finally:
        # Close `db`.
        db.close()
