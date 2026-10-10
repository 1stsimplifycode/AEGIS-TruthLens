# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  base.py
#  2. Program Description        : This file sets up the connection to the database. It exists
#                                  so this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Nothing visible; it only makes its folder importable or
#                                  defines shared names.
#  8. Variables                  : - NAMING = {'ix': 'ix_%(column_0_label)s', 'uq':
#                                    'uq_%(table_name)s_...
#                                  - Base =
#                                    declarative_base(metadata=MetaData(naming_convention=NAMI...
#  9. Algorithm / Logic          : Simple file: sets up names/imports only, no step-by-step
#                                  logic.
# 10. Dependencies               : External libraries (install with pip): sqlalchemy.
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

# From SQLAlchemy, a library for talking to databases from Python, bring in `MetaData` so they can
# be used in this file.
from sqlalchemy import MetaData
# From `sqlalchemy.orm` (part of SQLAlchemy, a library for talking to databases from Python), bring
# in `declarative_base` so they can be used in this file.
from sqlalchemy.orm import declarative_base

# Stable constraint naming so migrations are deterministic.
# Store a dictionary (lookup table) with 4 entries in the fixed setting (constant) `NAMING` (this
# instruction continues over the next 5 lines).
NAMING = {
    "ix": "ix_%(column_0_label)s",
    "uq": "uq_%(table_name)s_%(column_0_name)s",
    "fk": "fk_%(table_name)s_%(column_0_name)s",
    "pk": "pk_%(table_name)s",
}

# Store the base class for database table definitions in the variable `Base`.
Base = declarative_base(metadata=MetaData(naming_convention=NAMING))
