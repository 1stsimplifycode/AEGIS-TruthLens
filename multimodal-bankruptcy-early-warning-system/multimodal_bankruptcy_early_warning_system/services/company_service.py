# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  company_service.py
#  2. Program Description        : This file contains the business rules: it combines data and
#                                  decides what the program should do with it. It exists so
#                                  this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - create_company() receives: db.
#                                  - list_company() receives: db, limit.
#                                  - count_company() receives: db.
#  7. Output                     : Values returned by its functions to the code that calls
#                                  them.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - create_company(): create company.
#                                  - list_company(): list company.
#                                  - count_company(): count company.
# 10. Dependencies               : - External libraries (install with pip): sqlalchemy.
#                                  - Other files of this project: ..repositories.company.
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

# From another file of this project (`..repositories.company`), bring in `company_repository as
# repo` so they can be used in this file.
from ..repositories.company import company_repository as repo


# Define a function (a reusable set of steps) named `create_company` (name meaning: create company).
# It takes: db, any extra named options (**data).
def create_company(db: Session, **data):
    # Send back the result of calling `repo.create` (name meaning: create) with `db, **data` as the
    # result of this function.
    return repo.create(db, **data)


# Define a function (a reusable set of steps) named `list_company` (name meaning: list company). It
# takes: db, limit (default 100).
def list_company(db: Session, limit: int = 100):
    # Send back the result of calling `repo.list` (name meaning: list) with `db, limit=limit` as the
    # result of this function.
    return repo.list(db, limit=limit)


# Define a function (a reusable set of steps) named `count_company` (name meaning: count company).
# It takes: db, and gives back `int`.
def count_company(db: Session) -> int:
    # Send back how many times `db` appears in `repo` as the result of this function.
    return repo.count(db)
