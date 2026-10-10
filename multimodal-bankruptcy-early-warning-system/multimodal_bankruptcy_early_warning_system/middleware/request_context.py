# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  request_context.py
#  2. Program Description        : This file sits between the incoming web request and the
#                                  program, adding extra processing to every request. It exists
#                                  so this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (RequestContextMiddleware) that other
#                                    files can use.
#  8. Variables                  : logger = get_logger('request')
#  9. Algorithm / Logic          : Class RequestContextMiddleware: request context middleware
#                                  (steps: dispatch).
# 10. Dependencies               : - External libraries (install with pip): starlette.
#                                  - Built into Python (no install needed): time, uuid.
#                                  - Other files of this project: ..core.logging.
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

# Load time, Python's built-in clock and timing tools.
import time
# Load uuid, Python's built-in generator of unique ID codes.
import uuid

# From the module `starlette.middleware.base`, bring in `BaseHTTPMiddleware` so they can be used in
# this file.
from starlette.middleware.base import BaseHTTPMiddleware
# From the module `starlette.requests`, bring in `Request` so they can be used in this file.
from starlette.requests import Request

# From another file of this project (`..core.logging`), bring in `get_logger` so they can be used in
# this file.
from ..core.logging import get_logger

# Store the result of the function `get_logger` (name meaning: get logger) given `'request'` in the
# variable `logger`.
logger = get_logger("request")


# Define a class (a blueprint for creating objects) named `RequestContextMiddleware`, based on
# `BaseHTTPMiddleware` (it inherits their abilities).
class RequestContextMiddleware(BaseHTTPMiddleware):
    # Define an asynchronous method (a function that belongs to this class) named `dispatch` (name
    # meaning: dispatch). It takes: request, call_next.
    async def dispatch(self, request: Request, call_next):
        # Store the result of looking up `'x-request-id', uuid.uuid4().hex` in `request.headers`
        # (without crashing if it is missing) in the variable `request_id`.
        request_id = request.headers.get("x-request-id", uuid.uuid4().hex)
        # Store a precise timer reading in the variable `start`.
        start = time.perf_counter()
        # Store the result after waiting for the result of the function `call_next` (name meaning:
        # call next) given `request` in the variable `response`.
        response = await call_next(request)
        # Store `time.perf_counter() - start` times `1000` in the variable `elapsed_ms`.
        elapsed_ms = (time.perf_counter() - start) * 1000
        # Store the value of `request_id` in the entry `'x-request-id'` of `response.headers`.
        response.headers["x-request-id"] = request_id
        # Store a piece of text built from values: `f'{elapsed_ms:.1f}'` in the entry
        # `'x-response-time-ms'` of `response.headers`.
        response.headers["x-response-time-ms"] = f"{elapsed_ms:.1f}"
        # Write an information message to the log: `'%s %s -> %s (%.1fms)', request.method,
        # request.url.path,...` (this instruction continues over the next 1 line).
        logger.info("%s %s -> %s (%.1fms)", request.method, request.url.path,
                    response.status_code, elapsed_ms)
        # Send back the value of `response` as the result of this function.
        return response
