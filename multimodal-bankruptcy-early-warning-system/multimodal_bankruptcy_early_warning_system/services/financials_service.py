# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  financials_service.py
#  2. Program Description        : This file contains the business rules: it combines data and
#                                  decides what the program should do with it. It exists so
#                                  this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - create_financials() receives: db.
#                                  - list_financials() receives: db, limit.
#                                  - count_financials() receives: db.
#  7. Output                     : Values returned by its functions to the code that calls
#                                  them.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - create_financials(): create financials.
#                                  - list_financials(): list financials.
#                                  - count_financials(): count financials.
# 10. Dependencies               : - External libraries (install with pip): sqlalchemy.
#                                  - Other files of this project: ..repositories.financials.
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

# From another file of this project (`..repositories.financials`), bring in `financials_repository
# as repo` so they can be used in this file.
from ..repositories.financials import financials_repository as repo


# Define a function (a reusable set of steps) named `create_financials` (name meaning: create
# financials). It takes: db, any extra named options (**data).
def create_financials(db: Session, **data):
    # Send back the result of calling `repo.create` (name meaning: create) with `db, **data` as the
    # result of this function.
    return repo.create(db, **data)


# Define a function (a reusable set of steps) named `list_financials` (name meaning: list
# financials). It takes: db, limit (default 100).
def list_financials(db: Session, limit: int = 100):
    # Send back the result of calling `repo.list` (name meaning: list) with `db, limit=limit` as the
    # result of this function.
    return repo.list(db, limit=limit)


# Define a function (a reusable set of steps) named `count_financials` (name meaning: count
# financials). It takes: db, and gives back `int`.
def count_financials(db: Session) -> int:
    # Send back how many times `db` appears in `repo` as the result of this function.
    return repo.count(db)
