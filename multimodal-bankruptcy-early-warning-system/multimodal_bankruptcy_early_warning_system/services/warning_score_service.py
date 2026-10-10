# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  warning_score_service.py
#  2. Program Description        : This file contains the business rules: it combines data and
#                                  decides what the program should do with it. It exists so
#                                  this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - create_warning_score() receives: db.
#                                  - list_warning_score() receives: db, limit.
#                                  - count_warning_score() receives: db.
#  7. Output                     : Values returned by its functions to the code that calls
#                                  them.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - create_warning_score(): create warning score.
#                                  - list_warning_score(): list warning score.
#                                  - count_warning_score(): count warning score.
# 10. Dependencies               : - External libraries (install with pip): sqlalchemy.
#                                  - Other files of this project: ..repositories.warning_score.
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

# From `sqlalchemy.orm` (part of SQLAlchemy, a library for talking to databases from Python), bring
# in `Session` so they can be used in this file.
from sqlalchemy.orm import Session

# From another file of this project (`..repositories.warning_score`), bring in
# `warning_score_repository as repo` so they can be used in this file.
from ..repositories.warning_score import warning_score_repository as repo


# Define a function (a reusable set of steps) named `create_warning_score` (name meaning: create
# warning score). It takes: db, any extra named options (**data).
def create_warning_score(db: Session, **data):
    # Send back the result of calling `repo.create` (name meaning: create) with `db, **data` as the
    # result of this function.
    return repo.create(db, **data)


# Define a function (a reusable set of steps) named `list_warning_score` (name meaning: list warning
# score). It takes: db, limit (default 100).
def list_warning_score(db: Session, limit: int = 100):
    # Send back the result of calling `repo.list` (name meaning: list) with `db, limit=limit` as the
    # result of this function.
    return repo.list(db, limit=limit)


# Define a function (a reusable set of steps) named `count_warning_score` (name meaning: count
# warning score). It takes: db, and gives back `int`.
def count_warning_score(db: Session) -> int:
    # Send back how many times `db` appears in `repo` as the result of this function.
    return repo.count(db)
