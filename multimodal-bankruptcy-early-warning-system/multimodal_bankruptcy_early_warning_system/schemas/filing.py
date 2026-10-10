# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  filing.py
#  2. Program Description        : This file describes the exact shape of the data (which
#                                  fields, which types) that the web API accepts and sends
#                                  back. It exists so this piece of work stays in its own
#                                  small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Class definitions (FilingBase, FilingCreate, FilingRead)
#                                  that other files can use.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - Class FilingBase: filing base.
#                                  - Class FilingCreate: filing create.
#                                  - Class FilingRead: filing read.
# 10. Dependencies               : - External libraries (install with pip): pydantic.
#                                  - Built into Python (no install needed): datetime, typing.
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

# From datetime, Python's built-in date and time tools, bring in `datetime` so they can be used in
# this file.
from datetime import datetime
# From typing, Python's built-in labels that describe what type a value is, bring in `Optional` so
# they can be used in this file.
from typing import Optional

# From pydantic, a library that checks data has the right shape and types, bring in `BaseModel`,
# `ConfigDict` so they can be used in this file.
from pydantic import BaseModel, ConfigDict


# Define `FilingBase`: a data-shape definition that checks incoming/outgoing data, based on
# `BaseModel` (it inherits their abilities).
class FilingBase(BaseModel):
    # A field called `company_id` of type `Optional[int]`, starting value `None`.
    company_id: Optional[int] = None
    # A field called `form` of type `Optional[str]`, starting value `None`.
    form: Optional[str] = None
    # A field called `filed_at` of type `Optional[datetime]`, starting value `None`.
    filed_at: Optional[datetime] = None


# Define a class (a blueprint for creating objects) named `FilingCreate`, based on `FilingBase` (it
# inherits their abilities).
class FilingCreate(FilingBase):
    # Do nothing here (a placeholder so the block is not empty).
    pass


# Define a class (a blueprint for creating objects) named `FilingRead`, based on `FilingBase` (it
# inherits their abilities).
class FilingRead(FilingBase):
    # Store a new `ConfigDict` object created from `from_attributes=True` in the variable
    # `model_config`.
    model_config = ConfigDict(from_attributes=True)
    # Declare the variable `id` with the type `int` (no value yet).
    id: int
    # Declare the variable `created_at` with the type `datetime` (no value yet).
    created_at: datetime
