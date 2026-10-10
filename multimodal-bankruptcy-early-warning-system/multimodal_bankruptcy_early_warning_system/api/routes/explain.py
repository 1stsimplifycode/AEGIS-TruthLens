# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  explain.py
#  2. Program Description        : This file defines web addresses (API endpoints) that other
#                                  programs or a browser can call to read or save data. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Web (HTTP) requests: IDs in the address, and JSON data in
#                                    the request body.
#                                  - explain() receives: req.
#  7. Output                     : - JSON responses sent back to whoever called the web
#                                    endpoint.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (ExplainRequest) that other files can
#                                    use.
#  8. Variables                  : router = APIRouter(prefix='/explain',
#                                  tags=['explainability'])
#  9. Algorithm / Logic          : - Class ExplainRequest: explain request.
#                                  - explain(): explain.
# 10. Dependencies               : - External libraries (install with pip): fastapi, pydantic.
#                                  - Other files of this project: ...services.xai_service.
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

# From FastAPI, a library for building web APIs, bring in `APIRouter` so they can be used in this
# file.
from fastapi import APIRouter
# From pydantic, a library that checks data has the right shape and types, bring in `BaseModel` so
# they can be used in this file.
from pydantic import BaseModel

# From another file of this project (`...services.xai_service`), bring in `explain_payload` so they
# can be used in this file.
from ...services.xai_service import explain_payload

# Store a group of web endpoints (`prefix='/explain', tags=['explainability']`) in the variable
# `router`.
router = APIRouter(prefix="/explain", tags=["explainability"])


# Define `ExplainRequest`: a data-shape definition that checks incoming/outgoing data, based on
# `BaseModel` (it inherits their abilities).
class ExplainRequest(BaseModel):
    # A field (piece of data) called `features` of type `dict`; it must be given when the object is
    # created.
    features: dict


# Register the function below as the web endpoint that handles requests to create data (POST) at the
# address `(the group's main address)`.
@router.post("")
# Define a function (a reusable set of steps) named `explain` (name meaning: explain). It takes:
# req.
def explain(req: ExplainRequest):
    # Send back the result of the function `explain_payload` (name meaning: explain payload) given
    # `req.features` as the result of this function.
    return explain_payload(req.features)
