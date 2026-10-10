# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  company.py
#  2. Program Description        : This file defines web addresses (API endpoints) that other
#                                  programs or a browser can call to read or save data. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Web (HTTP) requests: IDs in the address, and JSON data in
#                                    the request body.
#                                  - list_items() receives: limit, offset, db.
#                                  - get_item() receives: item_id, db.
#                                  - create_item() receives: payload, db.
#                                  - delete_item() receives: item_id, db.
#  7. Output                     : - JSON responses sent back to whoever called the web
#                                    endpoint.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : router = APIRouter(prefix='/companys', tags=['Company'])
#  9. Algorithm / Logic          : - list_items(): list items.
#                                  - get_item(): get item.
#                                  - create_item(): create item.
#                                  - delete_item(): delete item.
# 10. Dependencies               : - External libraries (install with pip): fastapi,
#                                    sqlalchemy.
#                                  - Other files of this project: ...api.deps,
#                                    ...repositories.company, ...schemas.company.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - A database is reachable using the configured connection
#                                    settings.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : - Deliberately raises these errors when something is wrong:
#                                    HTTPException.
#                                  - Missing records return a clear '404 not found' web error
#                                    instead of crashing.
# ==============================================================================================

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# From FastAPI, a library for building web APIs, bring in `APIRouter`, `Depends`, `HTTPException`,
# `status` so they can be used in this file.
from fastapi import APIRouter, Depends, HTTPException, status
# From `sqlalchemy.orm` (part of SQLAlchemy, a library for talking to databases from Python), bring
# in `Session` so they can be used in this file.
from sqlalchemy.orm import Session

# From another file of this project (`...api.deps`), bring in `get_db` so they can be used in this
# file.
from ...api.deps import get_db
# From another file of this project (`...repositories.company`), bring in `company_repository as
# repo` so they can be used in this file.
from ...repositories.company import company_repository as repo
# From another file of this project (`...schemas.company`), bring in `CompanyCreate`, `CompanyRead`
# so they can be used in this file.
from ...schemas.company import CompanyCreate, CompanyRead

# Store a group of web endpoints (`prefix='/companys', tags=['Company']`) in the variable `router`.
router = APIRouter(prefix="/companys", tags=["Company"])


# Register the function below as the web endpoint that handles requests to read data (GET) at the
# address `(the group's main address)`.
@router.get("", response_model=list[CompanyRead])
# Define a function (a reusable set of steps) named `list_items` (name meaning: list items). It
# takes: limit (default 100), offset (default 0), db (default Depends(get_db)).
def list_items(limit: int = 100, offset: int = 0, db: Session = Depends(get_db)):
    # Send back the result of calling `repo.list` (name meaning: list) with `db, limit=limit,
    # offset=offset` as the result of this function.
    return repo.list(db, limit=limit, offset=offset)


# Register the function below as the web endpoint that handles requests to read data (GET) at the
# address `'/{item_id}'`.
@router.get("/{item_id}", response_model=CompanyRead)
# Define a function (a reusable set of steps) named `get_item` (name meaning: get item). It takes:
# item_id, db (default Depends(get_db)).
def get_item(item_id: int, db: Session = Depends(get_db)):
    # Store the result of looking up `db, item_id` in `repo` (without crashing if it is missing) in
    # the variable `obj`.
    obj = repo.get(db, item_id)
    # Check whether `obj` is empty (None); if so, do the indented steps below.
    if obj is None:
        # Stop here and report an error of type `HTTPException` with the message
        # `status.HTTP_404_NOT_FOUND, 'Company not found'`.
        raise HTTPException(status.HTTP_404_NOT_FOUND, "Company not found")
    # Send back the value of `obj` as the result of this function.
    return obj


# Register the function below as the web endpoint that handles requests to create data (POST) at the
# address `(the group's main address)`.
@router.post("", response_model=CompanyRead, status_code=status.HTTP_201_CREATED)
# Define a function (a reusable set of steps) named `create_item` (name meaning: create item). It
# takes: payload, db (default Depends(get_db)).
def create_item(payload: CompanyCreate, db: Session = Depends(get_db)):
    # Send back the result of calling `repo.create` (name meaning: create) with `db,
    # **payload.model_dump(exclude_none=True)` as the result of this function.
    return repo.create(db, **payload.model_dump(exclude_none=True))


# Register the function below as the web endpoint that handles requests to delete data (DELETE) at
# the address `'/{item_id}'`.
@router.delete("/{item_id}", status_code=status.HTTP_204_NO_CONTENT)
# Define a function (a reusable set of steps) named `delete_item` (name meaning: delete item). It
# takes: item_id, db (default Depends(get_db)).
def delete_item(item_id: int, db: Session = Depends(get_db)):
    # Check whether `repo.delete(db, item_id)` gives a false / empty result (it failed or found
    # nothing); if so, do the indented steps below.
    if not repo.delete(db, item_id):
        # Stop here and report an error of type `HTTPException` with the message
        # `status.HTTP_404_NOT_FOUND, 'Company not found'`.
        raise HTTPException(status.HTTP_404_NOT_FOUND, "Company not found")
