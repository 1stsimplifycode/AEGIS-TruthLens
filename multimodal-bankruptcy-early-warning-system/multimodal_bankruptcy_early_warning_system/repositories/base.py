# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  base.py
#  2. Program Description        : This file talks to the database: it saves, finds, lists and
#                                  deletes records so other parts of the program do not have to
#                                  write database code. It exists so this piece of work stays
#                                  in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : CRUDRepository is created with: model.
#  7. Output                     : - Records or tables saved in the database.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (CRUDRepository) that other files can
#                                    use.
#  8. Variables                  : ModelT = TypeVar('ModelT', bound=Base)
#  9. Algorithm / Logic          : Class CRUDRepository: Generic synchronous CRUD repository
#                                  over a SQLAlchemy model (steps: create, bulk_create, get,
#                                  list, update, delete ...).
# 10. Dependencies               : - External libraries (install with pip): sqlalchemy.
#                                  - Built into Python (no install needed): typing.
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

# From typing, Python's built-in labels that describe what type a value is, bring in `Generic`,
# `Iterable`, `Optional`, `Type`, `TypeVar` so they can be used in this file.
from typing import Generic, Iterable, Optional, Type, TypeVar

# From SQLAlchemy, a library for talking to databases from Python, bring in `select` so they can be
# used in this file.
from sqlalchemy import select
# From `sqlalchemy.orm` (part of SQLAlchemy, a library for talking to databases from Python), bring
# in `Session` so they can be used in this file.
from sqlalchemy.orm import Session

# From another file of this project (`..db.base`), bring in `Base` so they can be used in this file.
from ..db.base import Base

# Store a new `TypeVar` object created from `'ModelT', bound=Base` in the variable `ModelT`.
ModelT = TypeVar("ModelT", bound=Base)


# Define a class (a blueprint for creating objects) named `CRUDRepository`, based on
# `Generic[ModelT]` (it inherits their abilities). Purpose: Generic synchronous CRUD repository over
# a SQLAlchemy model.
class CRUDRepository(Generic[ModelT]):
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Generic synchronous CRUD repository over a SQLAlchemy model."""

    # Define the setup step (constructor) that runs automatically when a new object is created. It
    # takes: model, and gives back `None`.
    def __init__(self, model: Type[ModelT]) -> None:
        # Store the value of `model` in this object's `model` attribute.
        self.model = model

    # Define a method (a function that belongs to this class) named `create` (name meaning: create).
    # It takes: db, any extra named options (**data), and gives back `ModelT`.
    def create(self, db: Session, **data) -> ModelT:
        # Store the result of calling `self.model` (name meaning: model) with `**data` in the
        # variable `obj`.
        obj = self.model(**data)
        # Add `obj` to `db`.
        db.add(obj)
        # Save all pending changes permanently in `db`.
        db.commit()
        # Reload `obj` from the database.
        db.refresh(obj)
        # Send back the value of `obj` as the result of this function.
        return obj

    # Define a method (a function that belongs to this class) named `bulk_create` (name meaning:
    # bulk create). It takes: db, rows, and gives back `int`.
    def bulk_create(self, db: Session, rows: Iterable[dict]) -> int:
        # Store a new list made by taking each `r` in `rows` and computing `self.model(**r)` in the
        # variable `objs`.
        objs = [self.model(**r) for r in rows]
        # Call `db.add_all` (name meaning: add all) with `objs`.
        db.add_all(objs)
        # Save all pending changes permanently in `db`.
        db.commit()
        # Send back the result of counting how many items are in `objs` as the result of this
        # function.
        return len(objs)

    # Define a method (a function that belongs to this class) named `get` (name meaning: get). It
    # takes: db, obj_id, and gives back `Optional[ModelT]`.
    def get(self, db: Session, obj_id: int) -> Optional[ModelT]:
        # Send back the result of looking up `self.model, obj_id` in `db` (without crashing if it is
        # missing) as the result of this function.
        return db.get(self.model, obj_id)

    # Define a method (a function that belongs to this class) named `list` (name meaning: list). It
    # takes: db, limit (default 100), offset (default 0), and gives back `list[ModelT]`.
    def list(self, db: Session, limit: int = 100, offset: int = 0) -> list[ModelT]:
        # Store the result of calling `select(self.model).order_by(self.model.id.desc(...` (name
        # meaning: offset) with `offset` in the variable `stmt`.
        stmt = select(self.model).order_by(self.model.id.desc()).limit(limit).offset(offset)
        # Send back a list made from `db.execute(stmt).scalars().all()` as the result of this
        # function.
        return list(db.execute(stmt).scalars().all())

    # Define a method (a function that belongs to this class) named `update` (name meaning: update).
    # It takes: db, obj_id, any extra named options (**data), and gives back `Optional[ModelT]`.
    def update(self, db: Session, obj_id: int, **data) -> Optional[ModelT]:
        # Store the result of looking up `db, obj_id` in `self` (without crashing if it is missing)
        # in the variable `obj`.
        obj = self.get(db, obj_id)
        # Check whether `obj` is empty (None); if so, do the indented steps below.
        if obj is None:
            # Send back nothing (None) as the result of this function.
            return None
        # Go through every key/value pair of `data` one item at a time; each item is called `(k,
        # v)`.
        for k, v in data.items():
            # Check whether `v` has a value (is not None) and the object has the attribute (`obj,
            # k`); if so, do the indented steps below.
            if v is not None and hasattr(obj, k):
                # Set an attribute by name (`obj, k, v`).
                setattr(obj, k, v)
        # Save all pending changes permanently in `db`.
        db.commit()
        # Reload `obj` from the database.
        db.refresh(obj)
        # Send back the value of `obj` as the result of this function.
        return obj

    # Define a method (a function that belongs to this class) named `delete` (name meaning: delete).
    # It takes: db, obj_id, and gives back `bool`.
    def delete(self, db: Session, obj_id: int) -> bool:
        # Store the result of looking up `db, obj_id` in `self` (without crashing if it is missing)
        # in the variable `obj`.
        obj = self.get(db, obj_id)
        # Check whether `obj` is empty (None); if so, do the indented steps below.
        if obj is None:
            # Send back False (no) as the result of this function.
            return False
        # Delete `obj`.
        db.delete(obj)
        # Save all pending changes permanently in `db`.
        db.commit()
        # Send back True (yes) as the result of this function.
        return True

    # Define a method (a function that belongs to this class) named `count` (name meaning: count).
    # It takes: db, and gives back `int`.
    def count(self, db: Session) -> int:
        # Send back how many times nothing appears in `db.query(self.model)` as the result of this
        # function.
        return db.query(self.model).count()
