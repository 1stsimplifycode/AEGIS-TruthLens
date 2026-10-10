# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  financials.py
#  2. Program Description        : This file talks to the database: it saves, finds, lists and
#                                  deletes records so other parts of the program do not have to
#                                  write database code. It exists so this piece of work stays
#                                  in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Class definitions (FinancialsRepository) that other files
#                                  can use.
#  8. Variables                  : financials_repository = FinancialsRepository()
#  9. Algorithm / Logic          : Class FinancialsRepository: financials repository.
# 10. Dependencies               : Other files of this project: ..models.financials, .base.
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

# From another file of this project (`..models.financials`), bring in `Financials` so they can be
# used in this file.
from ..models.financials import Financials
# From another file of this project (`.base`), bring in `CRUDRepository` so they can be used in this
# file.
from .base import CRUDRepository


# Define a class (a blueprint for creating objects) named `FinancialsRepository`, based on
# `CRUDRepository[Financials]` (it inherits their abilities).
class FinancialsRepository(CRUDRepository[Financials]):
    # Define the setup step (constructor) that runs automatically when a new object is created. It
    # takes no inputs, and gives back `None`.
    def __init__(self) -> None:
        # Run the setup step (constructor) that runs automatically when a new object is created on
        # `super()`.
        super().__init__(Financials)


# Store a new `FinancialsRepository` object in the variable `financials_repository`.
financials_repository = FinancialsRepository()
