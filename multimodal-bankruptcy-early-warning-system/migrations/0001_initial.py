# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >
#                                  0001_initial.py
#  2. Program Description        : Initial schema migration. This project uses SQLAlchemy
#                                  ``create_all`` for the relational stores; this script makes
#                                  the bootstrap explicit and re-runnable for CI/CD. In simple
#                                  words, this file creates or updates the database tables so
#                                  the database structure matches what the program expects. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : No direct input. Other files import and use what this file
#                                  defines.
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Records or tables saved in the database.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - upgrade(): upgrade.
#                                  - downgrade(): downgrade.
#                                  - When run directly, the code under 'if __name__ ==
#                                    "__main__"' starts the work.
# 10. Dependencies               : Other files of this project:
#                                  multimodal_bankruptcy_early_warning_system.db.base,
#                                  multimodal_bankruptcy_early_warning_system.db.session,
#                                  multimodal_bankruptcy_early_warning_system,
#                                  multimodal_bankruptcy_early_warning_system.services.
# 11. Execution Instructions     : - From the 'multimodal-bankruptcy-early-warning-system'
#                                    folder run: python migrations/0001_initial.py
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

# A description (docstring) explaining what this part of the code does - Python stores it but does
# not run it.
"""Initial schema migration.

This project uses SQLAlchemy ``create_all`` for the relational stores; this
script makes the bootstrap explicit and re-runnable for CI/CD.
"""

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# From the module `multimodal_bankruptcy_early_warning_system.db.base`, bring in `Base` so they can
# be used in this file.
from multimodal_bankruptcy_early_warning_system.db.base import Base
# From the module `multimodal_bankruptcy_early_warning_system.db.session`, bring in `engine` so they
# can be used in this file.
from multimodal_bankruptcy_early_warning_system.db.session import engine
# From the module `multimodal_bankruptcy_early_warning_system`, bring in `models` so they can be
# used in this file.
from multimodal_bankruptcy_early_warning_system import models  # noqa: F401  (register tables)
# From the module `multimodal_bankruptcy_early_warning_system.services`, bring in `audit_service` so
# they can be used in this file.
from multimodal_bankruptcy_early_warning_system.services import audit_service  # noqa: F401  (register audit table)


# Define a function (a reusable set of steps) named `upgrade` (name meaning: upgrade). It takes no
# inputs, and gives back `None`.
def upgrade() -> None:
    # Call `Base.metadata.create_all` (name meaning: create all) with `bind=engine`.
    Base.metadata.create_all(bind=engine)


# Define a function (a reusable set of steps) named `downgrade` (name meaning: downgrade). It takes
# no inputs, and gives back `None`.
def downgrade() -> None:
    # Call `Base.metadata.drop_all` (name meaning: drop all) with `bind=engine`.
    Base.metadata.drop_all(bind=engine)


# Only when this file is started directly (not imported by another file), run the steps below.
if __name__ == "__main__":
    # Call the function `upgrade` (name meaning: upgrade).
    upgrade()
    # Show `'schema created'` on the screen.
    print("schema created")
