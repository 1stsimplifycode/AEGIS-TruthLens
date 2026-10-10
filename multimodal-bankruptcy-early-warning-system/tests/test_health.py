# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  test_health.py
#  2. Program Description        : This file automatically checks that other parts of the
#                                  program work correctly. It exists so this piece of work
#                                  stays in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : Nothing visible; it only makes its folder importable or
#                                  defines shared names.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - test_health_ok(): test health ok.
#                                  - test_root_lists_docs(): test root lists docs.
# 10. Dependencies               : - External libraries (install with pip): fastapi.
#                                  - Other files of this project:
#                                    multimodal_bankruptcy_early_warning_system.main.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Tests: run 'pytest' from the project folder.
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : No special error handling. If something goes wrong, Python
#                                  stops and prints an error message explaining what failed.
# ==============================================================================================

# From `fastapi.testclient` (part of FastAPI, a library for building web APIs), bring in
# `TestClient` so they can be used in this file.
from fastapi.testclient import TestClient

# From the module `multimodal_bankruptcy_early_warning_system.main`, bring in `app` so they can be
# used in this file.
from multimodal_bankruptcy_early_warning_system.main import app


# Define a function (a reusable set of steps) named `test_health_ok` (name meaning: test health ok).
# It takes no inputs.
def test_health_ok():
    # Use a new `TestClient` object created from `app` (called `c`) for the indented steps below; it
    # is closed/cleaned up automatically afterwards.
    with TestClient(app) as c:
        # Store the result of looking up `'/health'` in `c` (without crashing if it is missing) in
        # the variable `r`.
        r = c.get("/health")
        # Safety check: make sure `r.status_code` equals `200`; if not, stop with an error.
        assert r.status_code == 200
        # Safety check: make sure `r.json()['status']` equals `'ok'`; if not, stop with an error.
        assert r.json()["status"] == "ok"


# Define a function (a reusable set of steps) named `test_root_lists_docs` (name meaning: test root
# lists docs). It takes no inputs.
def test_root_lists_docs():
    # Use a new `TestClient` object created from `app` (called `c`) for the indented steps below; it
    # is closed/cleaned up automatically afterwards.
    with TestClient(app) as c:
        # Safety check: make sure `c.get('/').json()['slug']` equals
        # `'multimodal-bankruptcy-early-warning-system'`; if not, stop with an error.
        assert c.get("/").json()["slug"] == "multimodal-bankruptcy-early-warning-system"
