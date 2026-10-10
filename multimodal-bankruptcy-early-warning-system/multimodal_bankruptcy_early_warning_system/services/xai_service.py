# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  xai_service.py
#  2. Program Description        : This file contains the business rules: it combines data and
#                                  decides what the program should do with it. It exists so
#                                  this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : explain_payload() receives: features.
#  7. Output                     : Values returned by its functions to the code that calls
#                                  them.
#  8. Variables                  : _engine = Engine()
#  9. Algorithm / Logic          : explain_payload(): Run the project's AI primitive and return
#                                  a structured explanation.
# 10. Dependencies               : Other files of this project: ..ai.engine.
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

# From another file of this project (`..ai.engine`), bring in `Engine` so they can be used in this
# file.
from ..ai.engine import Engine

# Store a new `Engine` object in the variable `_engine`.
_engine = Engine()


# Define a function (a reusable set of steps) named `explain_payload` - purpose: Run the project's
# AI primitive and return a structured explanation. It takes: features, and gives back `dict`.
def explain_payload(features: dict) -> dict:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Run the project's AI primitive and return a structured explanation."""
    # Send back the result of calling `_engine.explain` (name meaning: explain) with `features` as
    # the result of this function.
    return _engine.explain(features)
