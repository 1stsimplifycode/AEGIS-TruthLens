# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  test_crud.py
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
#  9. Algorithm / Logic          : - test_create_and_list_company(): test create and list
#                                    company.
#                                  - test_auth_token_flow(): test auth token flow.
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


# Define a function (a reusable set of steps) named `test_create_and_list_company` (name meaning:
# test create and list company). It takes no inputs.
def test_create_and_list_company():
    # Use a new `TestClient` object created from `app` (called `c`) for the indented steps below; it
    # is closed/cleaned up automatically afterwards.
    with TestClient(app) as c:
        # Store the result of calling `c.post` (name meaning: post) with `'/companys', json={}` in
        # the variable `created`.
        created = c.post("/companys", json={})
        # Safety check: make sure `created.status_code` equals `201`; if not, stop with an error.
        assert created.status_code == 201
        # Store the result of looking up `'/companys'` in `c` (without crashing if it is missing) in
        # the variable `listed`.
        listed = c.get("/companys")
        # Safety check: make sure `listed.status_code` equals `200`; if not, stop with an error.
        assert listed.status_code == 200
        # Safety check: make sure `listed.json()` is of type `list`; if not, stop with an error.
        assert isinstance(listed.json(), list)


# Define a function (a reusable set of steps) named `test_auth_token_flow` (name meaning: test auth
# token flow). It takes no inputs.
def test_auth_token_flow():
    # Use a new `TestClient` object created from `app` (called `c`) for the indented steps below; it
    # is closed/cleaned up automatically afterwards.
    with TestClient(app) as c:
        # Store the result of calling `c.post` (name meaning: post) with `'/auth/token',
        # json={'email': 'x', 'password': 'y'}` in the variable `bad`.
        bad = c.post("/auth/token", json={"email": "x", "password": "y"})
        # Safety check: make sure `bad.status_code` equals `401`; if not, stop with an error.
        assert bad.status_code == 401
        # Store the result of calling `c.post` (name meaning: post) with `'/auth/token',
        # json={'email': 'analyst@desk.io', 'passwor...` in the variable `ok` (this instruction
        # continues over the next 1 line).
        ok = c.post("/auth/token",
                    json={"email": "analyst@desk.io", "password": "change-me"})
        # Safety check: make sure `ok.status_code` equals `200`; if not, stop with an error.
        assert ok.status_code == 200
        # Store the item `'access_token'` from `ok.json()` in the variable `token`.
        token = ok.json()["access_token"]
        # Store the result of looking up `'/auth/me', headers={'Authorization': f'Bearer {token}'}`
        # in `c` (without crashing if it is missing) in the variable `me`.
        me = c.get("/auth/me", headers={"Authorization": f"Bearer {token}"})
        # Safety check: make sure `me.status_code` equals `200`; if not, stop with an error.
        assert me.status_code == 200
