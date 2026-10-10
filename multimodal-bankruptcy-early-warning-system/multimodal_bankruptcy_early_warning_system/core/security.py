# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  security.py
#  2. Program Description        : This file holds the central settings of the application. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Data read from files on disk.
#                                  - create_token() receives: subject.
#                                  - verify_token() receives: token.
#                                  - get_current_subject() receives: creds.
#  7. Output                     : - Files written to disk.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : _bearer = HTTPBearer(auto_error=False)
#  9. Algorithm / Logic          : - _b64(): b64.
#                                  - _unb64(): unb64.
#                                  - _sign(): sign.
#                                  - create_token(): Compact HMAC-signed token (JWT-style,
#                                    dependency-free).
#                                  - verify_token(): verify token.
#                                  - get_current_subject(): get current subject.
# 10. Dependencies               : - External libraries (install with pip): fastapi.
#                                  - Built into Python (no install needed): base64, hashlib,
#                                    hmac, json, time.
#                                  - Other files of this project: ..config.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : - Catches these problems with try/except so the program does
#                                    not crash: Exception.
#                                  - Deliberately raises these errors when something is wrong:
#                                    HTTPException, ValueError.
#                                  - Missing records return a clear '404 not found' web error
#                                    instead of crashing.
# ==============================================================================================

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# Load base64, Python's built-in tool for turning bytes into plain text.
import base64
# Load hashlib, Python's built-in tools for making fingerprints (hashes) of data.
import hashlib
# Load hmac, Python's built-in tool for signing data with a secret key.
import hmac
# Load json, Python's built-in tool for reading/writing JSON text data.
import json
# Load time, Python's built-in clock and timing tools.
import time

# From FastAPI, a library for building web APIs, bring in `Depends`, `HTTPException`, `status` so
# they can be used in this file.
from fastapi import Depends, HTTPException, status
# From `fastapi.security` (part of FastAPI, a library for building web APIs), bring in
# `HTTPAuthorizationCredentials`, `HTTPBearer` so they can be used in this file.
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer

# From another file of this project (`..config`), bring in `get_settings` so they can be used in
# this file.
from ..config import get_settings

# Store a new `HTTPBearer` object created from `auto_error=False` in the variable `_bearer`.
_bearer = HTTPBearer(auto_error=False)


# Define a function (a reusable set of steps) named `_b64` (name meaning: b64). It takes: data, and
# gives back `str`.
def _b64(data: bytes) -> str:
    # Send back the result of calling `base64.urlsafe_b64encode(data).decode().rstrip` (name
    # meaning: rstrip) with `'='` as the result of this function.
    return base64.urlsafe_b64encode(data).decode().rstrip("=")


# Define a function (a reusable set of steps) named `_unb64` (name meaning: unb64). It takes: data,
# and gives back `bytes`.
def _unb64(data: str) -> bytes:
    # Store `'='` times `-len(data) % 4` in the variable `pad`.
    pad = "=" * (-len(data) % 4)
    # Send back the result of calling `base64.urlsafe_b64decode` (name meaning: urlsafe b64decode)
    # with `data + pad` as the result of this function.
    return base64.urlsafe_b64decode(data + pad)


# Define a function (a reusable set of steps) named `_sign` (name meaning: sign). It takes: payload,
# secret, and gives back `str`.
def _sign(payload: bytes, secret: str) -> str:
    # Send back the result of the function `_b64` (name meaning: b64) given
    # `hmac.new(secret.encode(), payload, hashlib.sha256).digest()` as the result of this function.
    return _b64(hmac.new(secret.encode(), payload, hashlib.sha256).digest())


# Define a function (a reusable set of steps) named `create_token` - purpose: Compact HMAC-signed
# token (JWT-style, dependency-free). It takes: subject, and gives back `str`.
def create_token(subject: str) -> str:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Compact HMAC-signed token (JWT-style, dependency-free)."""
    # Store the result of the function `get_settings` (name meaning: get settings) in the variable
    # `s`.
    s = get_settings()
    # Store a dictionary (lookup table) with 2 entries in the variable `body`.
    body = {"sub": subject, "exp": int(time.time()) + s.token_ttl_seconds}
    # Store `json.dumps(body, separators=(',', ':'))` converted to bytes in the variable `raw`.
    raw = json.dumps(body, separators=(",", ":")).encode()
    # Send back `_b64(raw) + '.'` plus `_sign(raw, s.secret_key)` as the result of this function.
    return _b64(raw) + "." + _sign(raw, s.secret_key)


# Define a function (a reusable set of steps) named `verify_token` (name meaning: verify token). It
# takes: token, and gives back `str`.
def verify_token(token: str) -> str:
    # Store the result of the function `get_settings` (name meaning: get settings) in the variable
    # `s`.
    s = get_settings()
    # Try the following steps; if an error happens, jump to the matching 'except' part instead of
    # crashing.
    try:
        # Split `token` split into pieces into the variables `body_b64`, `sig`.
        body_b64, sig = token.split(".", 1)
        # Store the result of the function `_unb64` (name meaning: unb64) given `body_b64` in the
        # variable `raw`.
        raw = _unb64(body_b64)
        # Check whether `hmac.compare_digest(sig, _sign(raw, s.secret_key))` gives a false / empty
        # result (it failed or found nothing); if so, do the indented steps below.
        if not hmac.compare_digest(sig, _sign(raw, s.secret_key)):
            # Stop here and report an error of type `ValueError` with the message `'bad signature'`.
            raise ValueError("bad signature")
        # Store JSON text `raw` converted to Python data in the variable `body`.
        body = json.loads(raw)
        # Check whether `body.get('exp', 0)` is less than `int(time.time())`; if so, do the indented
        # steps below.
        if body.get("exp", 0) < int(time.time()):
            # Stop here and report an error of type `ValueError` with the message `'expired'`.
            raise ValueError("expired")
        # Send back `body['sub']` converted to text as the result of this function.
        return str(body["sub"])
    # If an error of type `Exception` happened in the 'try' part, do these steps instead (the error
    # details are kept in `exc`).
    except Exception as exc:  # noqa: BLE001
        # Stop here and report an error of type `HTTPException` with the message
        # `status.HTTP_401_UNAUTHORIZED, 'invalid token'`.
        raise HTTPException(status.HTTP_401_UNAUTHORIZED, "invalid token") from exc


# Define a function (a reusable set of steps) named `get_current_subject` (name meaning: get current
# subject). It takes: creds (default Depends(_bearer)), and gives back `str`.
def get_current_subject(
    creds: HTTPAuthorizationCredentials = Depends(_bearer),
) -> str:
    # Check whether `creds` is empty (None); if so, do the indented steps below.
    if creds is None:
        # Stop here and report an error of type `HTTPException` with the message
        # `status.HTTP_401_UNAUTHORIZED, 'missing bearer token'`.
        raise HTTPException(status.HTTP_401_UNAUTHORIZED, "missing bearer token")
    # Send back the result of the function `verify_token` (name meaning: verify token) given
    # `creds.credentials` as the result of this function.
    return verify_token(creds.credentials)
