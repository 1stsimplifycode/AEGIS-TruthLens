# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  __init__.py
#  2. Program Description        : This file contains the business rules: it combines data and
#                                  decides what the program should do with it. It exists so
#                                  this piece of work stays in its own small, easy-to-test
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
#  9. Algorithm / Logic          : Simple file: sets up names/imports only, no step-by-step
#                                  logic.
# 10. Dependencies               : Other files of this project: .audit_service, .xai_service,
#                                  .company_service, .financials_service, .news_signal_service,
#                                  .warning_score_service, .filing_service.
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

# From another file of this project (`.audit_service`), bring in `record_audit`, `list_audit`,
# `AuditEntry` so they can be used in this file.
from .audit_service import record_audit, list_audit, AuditEntry
# From another file of this project (`.xai_service`), bring in `explain_payload` so they can be used
# in this file.
from .xai_service import explain_payload
# From another file of this project (`.company_service`), bring in `create_company`, `list_company`,
# `count_company` so they can be used in this file.
from .company_service import create_company, list_company, count_company
# From another file of this project (`.financials_service`), bring in `create_financials`,
# `list_financials`, `count_financials` so they can be used in this file.
from .financials_service import create_financials, list_financials, count_financials
# From another file of this project (`.news_signal_service`), bring in `create_news_signal`,
# `list_news_signal`, `count_news_signal` so they can be used in this file.
from .news_signal_service import create_news_signal, list_news_signal, count_news_signal
# From another file of this project (`.warning_score_service`), bring in `create_warning_score`,
# `list_warning_score`, `count_warning_score` so they can be used in this file.
from .warning_score_service import create_warning_score, list_warning_score, count_warning_score
# From another file of this project (`.filing_service`), bring in `create_filing`, `list_filing`,
# `count_filing` so they can be used in this file.
from .filing_service import create_filing, list_filing, count_filing
