# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  logging.py
#  2. Program Description        : This file holds the central settings of the application. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - configure_logging() receives: level.
#                                  - get_logger() receives: name.
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - configure_logging(): configure logging.
#                                  - get_logger(): get logger.
# 10. Dependencies               : Built into Python (no install needed): logging, sys.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : Problems are written to the log for later checking.
# ==============================================================================================

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# Load logging, Python's built-in tool for writing log messages.
import logging
# Load sys, Python's built-in tools for the running program itself.
import sys


# Define a function (a reusable set of steps) named `configure_logging` (name meaning: configure
# logging). It takes: level (default logging.INFO), and gives back `None`.
def configure_logging(level: int = logging.INFO) -> None:
    # Store the result of calling `logging.StreamHandler` (name meaning: stream handler) with
    # `sys.stdout` in the variable `handler`.
    handler = logging.StreamHandler(sys.stdout)
    # Call `handler.setFormatter` (name meaning: set formatter) with `logging.Formatter('%(asctime)s
    # %(levelname)s %(name)s %(m...` (this instruction continues over the next 2 lines).
    handler.setFormatter(
        logging.Formatter("%(asctime)s %(levelname)s %(name)s %(message)s")
    )
    # Store a logger (message recorder) named nothing in the variable `root`.
    root = logging.getLogger()
    # Store a list of 1 item: `[handler]` in the variable `root.handlers`.
    root.handlers = [handler]
    # Call `root.setLevel` (name meaning: set level) with `level`.
    root.setLevel(level)


# Define a function (a reusable set of steps) named `get_logger` (name meaning: get logger). It
# takes: name, and gives back `logging.Logger`.
def get_logger(name: str) -> logging.Logger:
    # Send back a logger (message recorder) named `name` as the result of this function.
    return logging.getLogger(name)
