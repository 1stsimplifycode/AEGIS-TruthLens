# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  __init__.py
#  2. Program Description        : This file handles 'init' for the 'multimodal bankruptcy
#                                  early warning system' part of the project. It exists so this
#                                  piece of work stays in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Nothing visible; it only makes its folder importable or
#                                  defines shared names.
#  8. Variables                  : __all__ = ['Engine']
#  9. Algorithm / Logic          : Simple file: sets up names/imports only, no step-by-step
#                                  logic.
# 10. Dependencies               : Other files of this project: .engine.
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

# From another file of this project (`.engine`), bring in `Engine` so they can be used in this file.
from .engine import Engine

# Store a list of 1 item: `['Engine']` in the variable `__all__`.
__all__ = ["Engine"]
