# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  datastores.py
#  2. Program Description        : This file sets up the connection to the database. It exists
#                                  so this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - client_for() receives: name.
#                                  - DatastoreInfo is created with: name, kind, purpose, dsn.
#                                  - LazyClient is created with: info.
#  7. Output                     : - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (DatastoreInfo, LazyClient) that other
#                                    files can use.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : - Class DatastoreInfo: datastore info.
#                                  - Class LazyClient: Connects on first use; reports
#                                    unavailable instead of crashing import (steps: available,
#                                    connect).
#                                  - registry(): registry.
#                                  - client_for(): client for.
# 10. Dependencies               : - External libraries (install with pip): redis, pymongo,
#                                    qdrant_client, neo4j.
#                                  - Built into Python (no install needed): dataclasses.
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
#                                    KeyError.
# ==============================================================================================

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# A description (docstring) explaining what this part of the code does - Python stores it but does
# not run it.
"""Eight logical datastores.

The two SQL stores are live (SQLAlchemy). The remaining clients are thin,
lazily-connected wrappers that degrade gracefully when the underlying service
or driver is not present, so the app imports and runs in a bare environment.
"""

# From dataclasses, Python's built-in shortcut for simple data-holding classes, bring in `dataclass`
# so they can be used in this file.
from dataclasses import dataclass

# From another file of this project (`..config`), bring in `get_settings` so they can be used in
# this file.
from ..config import get_settings


# Mark the class below as a dataclass: Python automatically writes its setup code from the listed
# fields.
@dataclass
# Define `DatastoreInfo`: a simple data-holding class (blueprint for objects).
class DatastoreInfo:
    # A field (piece of data) called `name` of type `str`; it must be given when the object is
    # created.
    name: str
    # A field (piece of data) called `kind` of type `str`; it must be given when the object is
    # created.
    kind: str
    # A field (piece of data) called `purpose` of type `str`; it must be given when the object is
    # created.
    purpose: str
    # A field (piece of data) called `dsn` of type `str`; it must be given when the object is
    # created.
    dsn: str


# Define a function (a reusable set of steps) named `registry` (name meaning: registry). It takes no
# inputs, and gives back `list[DatastoreInfo]`.
def registry() -> list[DatastoreInfo]:
    # Store the result of the function `get_settings` (name meaning: get settings) in the variable
    # `s`.
    s = get_settings()
    # Send back a list of 8 items: `[DatastoreInfo('postgres_core', 'sql', 'primary rela...` as the
    # result of this function (this instruction continues over the next 9 lines).
    return [
        DatastoreInfo("postgres_core", "sql", "primary relational entities", s.database_url),
        DatastoreInfo("postgres_audit", "sql", "append-only audit trail", s.audit_database_url),
        DatastoreInfo("timescaledb", "sql", "time-series market data", s.database_url),
        DatastoreInfo("redis_cache", "redis", "cache / sessions / rate limits", s.redis_url),
        DatastoreInfo("mongo_documents", "mongo", "raw payloads & explanations", s.mongo_url),
        DatastoreInfo("clickhouse_analytics", "clickhouse", "OLAP analytics", s.clickhouse_url),
        DatastoreInfo("qdrant_vectors", "vector", "embedding similarity", s.qdrant_url),
        DatastoreInfo("neo4j_graph", "graph", "influence graph", s.neo4j_url),
    ]


# Define a class (a blueprint for creating objects) named `LazyClient`. Purpose: Connects on first
# use; reports unavailable instead of crashing import.
class LazyClient:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Connects on first use; reports unavailable instead of crashing import."""

    # Define the setup step (constructor) that runs automatically when a new object is created. It
    # takes: info, and gives back `None`.
    def __init__(self, info: DatastoreInfo) -> None:
        # Store the value of `info` in this object's `info` attribute.
        self.info = info
        # Store nothing (None) in this object's `_client` attribute.
        self._client = None

    # Define a method (a function that belongs to this class) named `available` (name meaning:
    # available). It takes no inputs, and gives back `bool`.
    def available(self) -> bool:
        # Try the following steps; if an error happens, jump to the matching 'except' part instead
        # of crashing.
        try:
            # Call `self.connect` (name meaning: connect).
            self.connect()
            # Send back whether `self._client` has a value (is not None) as the result of this
            # function.
            return self._client is not None
        # If an error of type `Exception` happened in the 'try' part, do these steps instead.
        except Exception:  # noqa: BLE001
            # Send back False (no) as the result of this function.
            return False

    # Define a method (a function that belongs to this class) named `connect` (name meaning:
    # connect). It takes no inputs.
    def connect(self):
        # Check whether `self._client` has a value (is not None); if so, do the indented steps
        # below.
        if self._client is not None:
            # Send back this object's `_client` value as the result of this function.
            return self._client
        # Store the value `self.info.kind` in the variable `kind`.
        kind = self.info.kind
        # Check whether `kind` equals `'redis'`; if so, do the indented steps below.
        if kind == "redis":
            # Load the `redis` module.
            import redis  # type: ignore
            # Store the result of calling `redis.Redis.from_url` (name meaning: from url) with
            # `self.info.dsn` in this object's `_client` attribute.
            self._client = redis.Redis.from_url(self.info.dsn)
        # Otherwise, check whether `kind` equals `'mongo'`; if so, do the indented steps below.
        elif kind == "mongo":
            # From the module `pymongo`, bring in `MongoClient` so they can be used in this file.
            from pymongo import MongoClient  # type: ignore
            # Store a new `MongoClient` object created from `self.info.dsn,
            # serverSelectionTimeoutMS=500` in this object's `_client` attribute.
            self._client = MongoClient(self.info.dsn, serverSelectionTimeoutMS=500)
        # Otherwise, check whether `kind` equals `'vector'`; if so, do the indented steps below.
        elif kind == "vector":
            # From the module `qdrant_client`, bring in `QdrantClient` so they can be used in this
            # file.
            from qdrant_client import QdrantClient  # type: ignore
            # Store a new `QdrantClient` object created from `url=self.info.dsn` in this object's
            # `_client` attribute.
            self._client = QdrantClient(url=self.info.dsn)
        # Otherwise, check whether `kind` equals `'graph'`; if so, do the indented steps below.
        elif kind == "graph":
            # From the module `neo4j`, bring in `GraphDatabase` so they can be used in this file.
            from neo4j import GraphDatabase  # type: ignore
            # Store the result of calling `GraphDatabase.driver` (name meaning: driver) with
            # `self.info.dsn` in this object's `_client` attribute.
            self._client = GraphDatabase.driver(self.info.dsn)
        # Otherwise (when the check above was not true), do the following steps.
        else:
            # Store a dictionary (lookup table) with 1 entry in this object's `_client` attribute.
            self._client = {"dsn": self.info.dsn}  # clickhouse via http; placeholder handle
        # Send back this object's `_client` value as the result of this function.
        return self._client


# Define a function (a reusable set of steps) named `client_for` (name meaning: client for). It
# takes: name, and gives back `LazyClient`.
def client_for(name: str) -> LazyClient:
    # Go through the result of the function `registry` (name meaning: registry) one item at a time;
    # each item is called `info`.
    for info in registry():
        # Check whether `info.name` equals `name`; if so, do the indented steps below.
        if info.name == name:
            # Send back a new `LazyClient` object created from `info` as the result of this
            # function.
            return LazyClient(info)
    # Stop here and report an error of type `KeyError` with the message `name`.
    raise KeyError(name)
