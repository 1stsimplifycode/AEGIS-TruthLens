# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  errors.py
#  2. Program Description        : This file holds the central settings of the application. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - domain_error_handler() receives: _, exc.
#                                  - DomainError is created with: message, code.
#  7. Output                     : - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (DomainError) that other files can use.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - Class DomainError: domain error.
#                                  - domain_error_handler(): domain error handler.
# 10. Dependencies               : External libraries (install with pip): fastapi.
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

# From FastAPI, a library for building web APIs, bring in `Request` so they can be used in this
# file.
from fastapi import Request
# From `fastapi.responses` (part of FastAPI, a library for building web APIs), bring in
# `JSONResponse` so they can be used in this file.
from fastapi.responses import JSONResponse


# Define `DomainError`: a custom error type for this program, based on `Exception` (it inherits
# their abilities).
class DomainError(Exception):
    # Define the setup step (constructor) that runs automatically when a new object is created. It
    # takes: message, code (default 'domain_error'), and gives back `None`.
    def __init__(self, message: str, code: str = "domain_error") -> None:
        # Run the setup step (constructor) that runs automatically when a new object is created on
        # `super()`.
        super().__init__(message)
        # Store the value of `message` in this object's `message` attribute.
        self.message = message
        # Store the value of `code` in this object's `code` attribute.
        self.code = code


# Define an asynchronous function (a reusable set of steps) named `domain_error_handler` (name
# meaning: domain error handler). It takes: _, exc, and gives back `JSONResponse`.
async def domain_error_handler(_: Request, exc: DomainError) -> JSONResponse:
    # Send back a new `JSONResponse` object created from `status_code=400, content={'error':
    # exc.code, 'detail': ex...` as the result of this function.
    return JSONResponse(status_code=400, content={"error": exc.code, "detail": exc.message})
