# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  news_signal.py
#  2. Program Description        : This file describes a database table: what columns it has
#                                  and what type of data each column stores. It exists so this
#                                  piece of work stays in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (NewsSignal) that other files can use.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : Class NewsSignal: news signal.
# 10. Dependencies               : - External libraries (install with pip): sqlalchemy.
#                                  - Built into Python (no install needed): datetime.
#                                  - Other files of this project: ..db.base.
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

# From datetime, Python's built-in date and time tools, bring in `datetime` so they can be used in
# this file.
from datetime import datetime

# From SQLAlchemy, a library for talking to databases from Python, bring in `Boolean`, `Column`,
# `DateTime`, `Float`, `Integer`, `JSON` and 2 more so they can be used in this file (this
# instruction continues over the next 1 line).
from sqlalchemy import (Boolean, Column, DateTime, Float, Integer,
                        JSON, String, Text)

# From another file of this project (`..db.base`), bring in `Base` so they can be used in this file.
from ..db.base import Base


# Define `NewsSignal`: a database table definition (each object = one row), based on `Base` (it
# inherits their abilities).
class NewsSignal(Base):
    # Name the database table `'news_signals'`.
    __tablename__ = "news_signals"

    # Database column `id`: `Integer, primary_key=True, index=True` - the unique ID (primary key) of
    # each row, indexed for fast searching.
    id = Column(Integer, primary_key=True, index=True)
    # Database column `company_id`: `Integer, nullable=True, index=True` - indexed for fast
    # searching.
    company_id = Column(Integer, nullable=True, index=True)
    # Database column `sentiment`: `Float, nullable=True`.
    sentiment = Column(Float, nullable=True)
    # Database column `source`: `String(255), nullable=True`.
    source = Column(String(255), nullable=True)
    # Database column `ts`: `DateTime, nullable=True`.
    ts = Column(DateTime, nullable=True)
    # Database column `created_at`: `DateTime, default=datetime.utcnow, index=True` - indexed for
    # fast searching.
    created_at = Column(DateTime, default=datetime.utcnow, index=True)

    # Define how this object describes itself when printed for developers. It takes no inputs, and
    # gives back `str`.
    def __repr__(self) -> str:  # pragma: no cover
        # Send back a piece of text built from values: `f'<NewsSignal id={self.id}>'` as the result
        # of this function.
        return f"<NewsSignal id={self.id}>"
