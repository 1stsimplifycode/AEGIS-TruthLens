# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  seed.py
#  2. Program Description        : This file fills the database with starting sample data. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : seed() receives: n.
#  7. Output                     : Messages printed to the screen or written to the log.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - seed(): seed.
#                                  - When run directly, the code under 'if __name__ ==
#                                    "__main__"' starts the work.
# 10. Dependencies               : - Built into Python (no install needed): datetime.
#                                  - Other files of this project:
#                                    multimodal_bankruptcy_early_warning_system.db.session, multi
#                                    modal_bankruptcy_early_warning_system.repositories.company.
# 11. Execution Instructions     : - From the 'multimodal-bankruptcy-early-warning-system'
#                                    folder run: python scripts/seed.py
#                                  - Whole app: pip install -r requirements.txt, then uvicorn
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

# From datetime, Python's built-in date and time tools, bring in `datetime` so they can be used in
# this file.
from datetime import datetime

# From the module `multimodal_bankruptcy_early_warning_system.db.session`, bring in `SessionLocal`,
# `init_db` so they can be used in this file.
from multimodal_bankruptcy_early_warning_system.db.session import SessionLocal, init_db
# From the module `multimodal_bankruptcy_early_warning_system.repositories.company`, bring in
# `company_repository as repo` so they can be used in this file.
from multimodal_bankruptcy_early_warning_system.repositories.company import company_repository as repo


# Define a function (a reusable set of steps) named `seed` (name meaning: seed). It takes: n
# (default 25), and gives back `None`.
def seed(n: int = 25) -> None:
    # Call the function `init_db` (name meaning: init db).
    init_db()
    # Store a new `SessionLocal` object in the variable `db`.
    db = SessionLocal()
    # Try the following steps; if an error happens, jump to the matching 'except' part instead of
    # crashing.
    try:
        # Repeat the indented steps once for each number `_` in a sequence of numbers (`n`).
        for _ in range(n):
            # Call `repo.create` (name meaning: create) with `db, ticker='sample', name='sample',
            # sector='sample'`.
            repo.create(db, ticker="sample", name="sample", sector="sample")
        # Show `f'seeded {n} company rows'` on the screen.
        print(f"seeded {n} company rows")
    # Always do the following clean-up steps, whether or not an error happened.
    finally:
        # Close `db`.
        db.close()


# Only when this file is started directly (not imported by another file), run the steps below.
if __name__ == "__main__":
    # Call the function `seed` (name meaning: seed).
    seed()
