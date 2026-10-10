# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  config.py
#  2. Program Description        : This file holds the central settings of the application. It
#                                  exists so this piece of work stays in its own small, easy-
#                                  to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Settings read from environment variables.
#                                  - Settings is created with: title, slug, version,
#                                    secret_key, token_ttl_seconds, database_url ....
#  7. Output                     : - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (Settings) that other files can use.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - Class Settings: settings.
#                                  - get_settings(): get settings.
# 10. Dependencies               : Built into Python (no install needed): os, dataclasses.
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

# Load os, Python's built-in tools for files, folders and system settings.
import os
# From dataclasses, Python's built-in shortcut for simple data-holding classes, bring in `dataclass`
# so they can be used in this file.
from dataclasses import dataclass


# Mark the class below as a dataclass: Python automatically writes its setup code from the listed
# fields.
@dataclass(frozen=True)
# Define `Settings`: a simple data-holding class (blueprint for objects).
class Settings:
    # A field called `title` of type `str`, starting value `'Multimodal Bankruptcy Early-Warning
    # System'`.
    title: str = "Multimodal Bankruptcy Early-Warning System"
    # A field called `slug` of type `str`, starting value
    # `'multimodal-bankruptcy-early-warning-system'`.
    slug: str = "multimodal-bankruptcy-early-warning-system"
    # A field called `version` of type `str`, starting value `'1.0.0'`.
    version: str = "1.0.0"
    # A field called `secret_key` of type `str`, starting value `os.environ.get('SECRET_KEY',
    # 'dev-secret-r...`.
    secret_key: str = os.environ.get("SECRET_KEY", "dev-secret-rotate-me")
    # A field called `token_ttl_seconds` of type `int`, starting value
    # `int(os.environ.get('TOKEN_TTL', '3600'))`.
    token_ttl_seconds: int = int(os.environ.get("TOKEN_TTL", "3600"))
    # A field called `database_url` of type `str`, starting value `os.environ.get('DATABASE_URL',
    # 'sqlite:///...`.
    database_url: str = os.environ.get("DATABASE_URL", "sqlite:///./multimodal_bankruptcy_early_warning_system.db")
    # A field called `audit_database_url` of type `str`, starting value
    # `os.environ.get('AUDIT_DATABASE_URL', 'sqli...`.
    audit_database_url: str = os.environ.get("AUDIT_DATABASE_URL", "sqlite:///./multimodal_bankruptcy_early_warning_system`_audit.db")
    # A field called `redis_url` of type `str`, starting value `os.environ.get('REDIS_URL',
    # 'redis://local...`.
    redis_url: str = os.environ.get("REDIS_URL", "redis://localhost:6379/0")
    # A field called `mongo_url` of type `str`, starting value `os.environ.get('MONGO_URL',
    # 'mongodb://loc...`.
    mongo_url: str = os.environ.get("MONGO_URL", "mongodb://localhost:27017")
    # A field called `clickhouse_url` of type `str`, starting value
    # `os.environ.get('CLICKHOUSE_URL', 'http://l...`.
    clickhouse_url: str = os.environ.get("CLICKHOUSE_URL", "http://localhost:8123")
    # A field called `qdrant_url` of type `str`, starting value `os.environ.get('QDRANT_URL',
    # 'http://local...`.
    qdrant_url: str = os.environ.get("QDRANT_URL", "http://localhost:6333")
    # A field called `neo4j_url` of type `str`, starting value `os.environ.get('NEO4J_URL',
    # 'bolt://localh...`.
    neo4j_url: str = os.environ.get("NEO4J_URL", "bolt://localhost:7687")
    # A field called `cors_origins` of type `tuple`, starting value `('*',)`.
    cors_origins: tuple = ("*",)


# Define a function (a reusable set of steps) named `get_settings` (name meaning: get settings). It
# takes no inputs, and gives back `Settings`.
def get_settings() -> Settings:
    # Send back a new `Settings` object as the result of this function.
    return Settings()
