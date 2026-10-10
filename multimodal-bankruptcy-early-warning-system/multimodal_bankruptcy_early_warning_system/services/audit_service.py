# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  audit_service.py
#  2. Program Description        : This file contains the business rules: it combines data and
#                                  decides what the program should do with it. It exists so
#                                  this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - record_audit() receives: db, action, detail.
#                                  - list_audit() receives: db, limit.
#  7. Output                     : - Records or tables saved in the database.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (AuditEntry) that other files can use.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - Class AuditEntry: audit entry.
#                                  - record_audit(): record audit.
#                                  - list_audit(): list audit.
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

# From SQLAlchemy, a library for talking to databases from Python, bring in `Column`, `DateTime`,
# `Integer`, `String`, `Text` so they can be used in this file.
from sqlalchemy import Column, DateTime, Integer, String, Text
# From `sqlalchemy.orm` (part of SQLAlchemy, a library for talking to databases from Python), bring
# in `Session` so they can be used in this file.
from sqlalchemy.orm import Session

# From another file of this project (`..db.base`), bring in `Base` so they can be used in this file.
from ..db.base import Base


# Define `AuditEntry`: a database table definition (each object = one row), based on `Base` (it
# inherits their abilities).
class AuditEntry(Base):
    # Name the database table `'audit_entries'`.
    __tablename__ = "audit_entries"
    # Database column `id`: `Integer, primary_key=True` - the unique ID (primary key) of each row.
    id = Column(Integer, primary_key=True)
    # Database column `action`: `String(255), index=True` - indexed for fast searching.
    action = Column(String(255), index=True)
    # Database column `detail`: `Text, default=''`.
    detail = Column(Text, default="")
    # Database column `created_at`: `DateTime, default=datetime.utcnow, index=True` - indexed for
    # fast searching.
    created_at = Column(DateTime, default=datetime.utcnow, index=True)


# Define a function (a reusable set of steps) named `record_audit` (name meaning: record audit). It
# takes: db, action, detail (default ''), and gives back `dict`.
def record_audit(db: Session, action: str, detail: str = "") -> dict:
    # Store a new `AuditEntry` object created from `action=action, detail=detail` in the variable
    # `entry`.
    entry = AuditEntry(action=action, detail=detail)
    # Add `entry` to `db`.
    db.add(entry)
    # Save all pending changes permanently in `db`.
    db.commit()
    # Reload `entry` from the database.
    db.refresh(entry)
    # Send back a dictionary (lookup table) with 3 entries as the result of this function.
    return {"id": entry.id, "action": entry.action, "created_at": str(entry.created_at)}


# Define a function (a reusable set of steps) named `list_audit` (name meaning: list audit). It
# takes: db, limit (default 100), and gives back `list[dict]`.
def list_audit(db: Session, limit: int = 100) -> list[dict]:
    # Store the result of calling `db.query(AuditEntry).order_by(AuditEntry.id.des...` (name
    # meaning: all) in the variable `rows`.
    rows = db.query(AuditEntry).order_by(AuditEntry.id.desc()).limit(limit).all()
    # Send back a new list made by taking each `r` in `rows` and computing `{'id': r.id, 'action':
    # r.action, 'det...` as the result of this function (this instruction continues over the next 1
    # line).
    return [{"id": r.id, "action": r.action, "detail": r.detail,
             "created_at": str(r.created_at)} for r in rows]
