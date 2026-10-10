# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  auth.py
#  2. Program Description        : This file defines web addresses (API endpoints) that other
#                                  programs or a browser can call to read or save data. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Web (HTTP) requests: IDs in the address, and JSON data in
#                                    the request body.
#                                  - issue_token() receives: req.
#                                  - me() receives: subject.
#  7. Output                     : - JSON responses sent back to whoever called the web
#                                    endpoint.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (LoginRequest, TokenResponse) that other
#                                    files can use.
#  8. Variables                  : - router = APIRouter(prefix='/auth', tags=['auth'])
#                                  - _USERS = {'analyst@desk.io': 'change-me'}
#  9. Algorithm / Logic          : - Class LoginRequest: login request.
#                                  - Class TokenResponse: token response.
#                                  - issue_token(): issue token.
#                                  - me(): me.
# 10. Dependencies               : - External libraries (install with pip): fastapi, pydantic.
#                                  - Other files of this project: ...core.security.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
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
# From pydantic, a library that checks data has the right shape and types, bring in `BaseModel` so
# they can be used in this file.
from pydantic import BaseModel

# From another file of this project (`...core.security`), bring in `create_token`,
# `get_current_subject` so they can be used in this file.
from ...core.security import create_token, get_current_subject

# Store a group of web endpoints (`prefix='/auth', tags=['auth']`) in the variable `router`.
router = APIRouter(prefix="/auth", tags=["auth"])

# Demo identity store; replace with a real user repository in production.
# Store a dictionary (lookup table) with 1 entry in the fixed setting (constant) `_USERS`.
_USERS = {"analyst@desk.io": "change-me"}


# Define `LoginRequest`: a data-shape definition that checks incoming/outgoing data, based on
# `BaseModel` (it inherits their abilities).
class LoginRequest(BaseModel):
    # A field (piece of data) called `email` of type `str`; it must be given when the object is
    # created.
    email: str
    # A field (piece of data) called `password` of type `str`; it must be given when the object is
    # created.
    password: str


# Define `TokenResponse`: a data-shape definition that checks incoming/outgoing data, based on
# `BaseModel` (it inherits their abilities).
class TokenResponse(BaseModel):
    # A field (piece of data) called `access_token` of type `str`; it must be given when the object
    # is created.
    access_token: str
    # A field called `token_type` of type `str`, starting value `'bearer'`.
    token_type: str = "bearer"


# Register the function below as the web endpoint that handles requests to create data (POST) at the
# address `'/token'`.
@router.post("/token", response_model=TokenResponse)
# Define a function (a reusable set of steps) named `issue_token` (name meaning: issue token). It
# takes: req.
def issue_token(req: LoginRequest):
    # Check whether `_USERS.get(req.email)` is not equal to `req.password`; if so, do the indented
    # steps below.
    if _USERS.get(req.email) != req.password:
        # Stop here and report an error of type `HTTPException` with the message
        # `status.HTTP_401_UNAUTHORIZED, 'invalid credentials'`.
        raise HTTPException(status.HTTP_401_UNAUTHORIZED, "invalid credentials")
    # Send back a new `TokenResponse` object created from `access_token=create_token(req.email)` as
    # the result of this function.
    return TokenResponse(access_token=create_token(req.email))


# Register the function below as the web endpoint that handles requests to read data (GET) at the
# address `'/me'`.
@router.get("/me")
# Define a function (a reusable set of steps) named `me` (name meaning: me). It takes: subject
# (default Depends(get_current_subject)).
def me(subject: str = Depends(get_current_subject)):
    # Send back a dictionary (lookup table) with 1 entry as the result of this function.
    return {"subject": subject}
