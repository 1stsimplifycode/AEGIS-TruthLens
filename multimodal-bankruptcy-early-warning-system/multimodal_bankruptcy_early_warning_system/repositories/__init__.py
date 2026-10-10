# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  __init__.py
#  2. Program Description        : This file talks to the database: it saves, finds, lists and
#                                  deletes records so other parts of the program do not have to
#                                  write database code. It exists so this piece of work stays
#                                  in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Nothing visible; it only makes its folder importable or
#                                  defines shared names.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : Simple file: sets up names/imports only, no step-by-step
#                                  logic.
# 10. Dependencies               : Other files of this project: .base, .company, .financials,
#                                  .news_signal, .warning_score, .filing.
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

# From another file of this project (`.base`), bring in `CRUDRepository` so they can be used in this
# file.
from .base import CRUDRepository
# From another file of this project (`.company`), bring in `company_repository` so they can be used
# in this file.
from .company import company_repository
# From another file of this project (`.financials`), bring in `financials_repository` so they can be
# used in this file.
from .financials import financials_repository
# From another file of this project (`.news_signal`), bring in `news_signal_repository` so they can
# be used in this file.
from .news_signal import news_signal_repository
# From another file of this project (`.warning_score`), bring in `warning_score_repository` so they
# can be used in this file.
from .warning_score import warning_score_repository
# From another file of this project (`.filing`), bring in `filing_repository` so they can be used in
# this file.
from .filing import filing_repository
