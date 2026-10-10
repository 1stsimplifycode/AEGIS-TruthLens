# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal_tune_parameters_train_multi_horizon  >
#                                  multimodal_threshold_calibrator_risk_metrics.py
#  2. Program Description        : Tune Parameters — Threshold Calibrator. In simple words,
#                                  this file trains (teaches) a prediction model using
#                                  historical data. It exists so this piece of work stays in
#                                  its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - MultimodalThresholdCalibratorRiskMetricsConfig is created
#                                    with: horizons, universe_size, train_window, test_window,
#                                    learning_rate, l2_reg ....
#                                  - HorizonResult is created with: horizon, sharpe_train,
#                                    sharpe_test, ic_mean, ic_std, max_drawdown ....
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions
#                                    (MultimodalThresholdCalibratorRiskMetricsConfig,
#                                    HorizonResult, MultimodalBaseHorizon,
#                                    MultimodalThresholdCalibratorEngine) that other files can
#                                    use.
#  8. Variables                  : - logger = logging.getLogger(__name__)
#                                  - MULTIMODAL_MODULE =
#                                    'multimodal_threshold_calibrator_risk_metrics'
#                                  - TOPIC = 'tune_parameters'
#                                  - VERSION = '1.0.0'
#                                  - HORIZONS = [1, 5, 10, 21, 63, 126, 252]
#  9. Algorithm / Logic          : - Class MultimodalThresholdCalibratorRiskMetricsConfig:
#                                    Multimodal multi-horizon config for threshold_calibrator.
#                                  - Class HorizonResult: Stores per-horizon train/test metrics
#                                    for multimodal comparison.
#                                  - Class MultimodalBaseHorizon: Abstract multimodal multi-
#                                    horizon pipeline stage (steps: fit, predict, evaluate).
#                                  - Class MultimodalThresholdCalibratorEngine: Multimodal
#                                    engine: tune parameters — threshold calibrator. Trains,
#                                    evaluates, (steps: fit, predict, evaluate,
#                                    train_all_horizons).
# 10. Dependencies               : - External libraries (install with pip): numpy, pandas.
#                                  - Built into Python (no install needed): time, logging,
#                                    copy, json, typing, dataclasses, datetime, abc.
# 11. Execution Instructions     : - Not run on its own. Another file imports it, e.g. 'from
#                                    multimodal_threshold_calibrator_risk_metrics import ...'.
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Input data is numeric (numbers in arrays or tables) with
#                                    no missing rows.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : Problems are written to the log for later checking.
# ==============================================================================================

# A description (docstring) explaining what this part of the code does - Python stores it but does
# not run it.
"""
  Multimodal Stock-Market Module
  ZIP Topic  : TuneParameters
  Folder     : multimodal_threshold_calibrator
  File       : multimodal_threshold_calibrator_risk_metrics.py
  Purpose    : Tune Parameters — Threshold Calibrator
"""

# Load NumPy, a library for fast maths on lists/tables of numbers, and call it `np` for short.
import numpy as np
# Load pandas, a library for working with tables of data (like Excel in code), and call it `pd` for
# short.
import pandas as pd
# Load time, Python's built-in clock and timing tools. Then: Load logging, Python's built-in tool
# for writing log messages. Then: Load copy, Python's built-in tools for duplicating objects. Then:
# Load json, Python's built-in tool for reading/writing JSON text data.
import time, logging, copy, json
# From typing, Python's built-in labels that describe what type a value is, bring in `List`, `Dict`,
# `Optional`, `Tuple`, `Any` so they can be used in this file.
from typing import List, Dict, Optional, Tuple, Any
# From dataclasses, Python's built-in shortcut for simple data-holding classes, bring in
# `dataclass`, `field` so they can be used in this file.
from dataclasses import dataclass, field
# From datetime, Python's built-in date and time tools, bring in `datetime`, `timedelta` so they can
# be used in this file.
from datetime import datetime, timedelta
# From abc, Python's built-in tool for making template (abstract) classes, bring in `ABC`,
# `abstractmethod` so they can be used in this file.
from abc import ABC, abstractmethod

# Store a logger (message recorder) named `__name__` in the variable `logger`.
logger = logging.getLogger(__name__)
# Store the text `'multimodal_threshold_calibrator_risk_metrics'` in the fixed setting (constant)
# `MULTIMODAL_MODULE`.
MULTIMODAL_MODULE = 'multimodal_threshold_calibrator_risk_metrics'
# Store the text `'tune_parameters'` in the fixed setting (constant) `TOPIC`.
TOPIC             = 'tune_parameters'
# Store the text `'1.0.0'` in the fixed setting (constant) `VERSION`.
VERSION           = '1.0.0'
# Store a list of 7 items: `[1, 5, 10, 21, 63, 126, 252]` in the fixed setting (constant)
# `HORIZONS`.
HORIZONS          = [1, 5, 10, 21, 63, 126, 252]   # trading-day horizons

# ── Config ────────────────────────────────────────────────────────────────────
# Mark the class below as a dataclass: Python automatically writes its setup code from the listed
# fields.
@dataclass
# Define `MultimodalThresholdCalibratorRiskMetricsConfig`: a simple data-holding class (blueprint
# for objects). Purpose: Multimodal multi-horizon config for threshold_calibrator.
class MultimodalThresholdCalibratorRiskMetricsConfig:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Multimodal multi-horizon config for threshold_calibrator."""
    # A field called `horizons` of type `List[int]`, with settings `default_factory=lambda:
    # HORIZONS`.
    horizons: List[int]       = field(default_factory=lambda: HORIZONS)
    # A field called `universe_size` of type `int`, starting value `500`.
    universe_size: int        = 500
    # A field called `train_window` of type `int`, starting value `756`.
    train_window: int         = 756          # 3 yrs
    # A field called `test_window` of type `int`, starting value `252`.
    test_window: int          = 252          # 1 yr
    # A field called `learning_rate` of type `float`, starting value `0.001`.
    learning_rate: float      = 1e-3
    # A field called `l2_reg` of type `float`, starting value `0.0001`.
    l2_reg: float             = 1e-4
    # A field called `n_estimators` of type `int`, starting value `100`.
    n_estimators: int         = 100
    # A field called `confidence` of type `float`, starting value `0.95`.
    confidence: float         = 0.95
    # A field called `n_bootstrap` of type `int`, starting value `1000`.
    n_bootstrap: int          = 1000
    # A field called `doc_format` of type `str`, starting value `'markdown'`.
    doc_format: str           = 'markdown'   # markdown | json | html

# ── Data container ────────────────────────────────────────────────────────────
# Mark the class below as a dataclass: Python automatically writes its setup code from the listed
# fields.
@dataclass
# Define `HorizonResult`: a simple data-holding class (blueprint for objects). Purpose: Stores
# per-horizon train/test metrics for multimodal comparison.
class HorizonResult:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Stores per-horizon train/test metrics for multimodal comparison."""
    # A field (piece of data) called `horizon` of type `int`; it must be given when the object is
    # created.
    horizon: int
    # A field (piece of data) called `sharpe_train` of type `float`; it must be given when the
    # object is created.
    sharpe_train: float
    # A field (piece of data) called `sharpe_test` of type `float`; it must be given when the object
    # is created.
    sharpe_test: float
    # A field (piece of data) called `ic_mean` of type `float`; it must be given when the object is
    # created.
    ic_mean: float
    # A field (piece of data) called `ic_std` of type `float`; it must be given when the object is
    # created.
    ic_std: float
    # A field (piece of data) called `max_drawdown` of type `float`; it must be given when the
    # object is created.
    max_drawdown: float
    # A field (piece of data) called `hit_rate` of type `float`; it must be given when the object is
    # created.
    hit_rate: float
    # A field (piece of data) called `n_trades` of type `int`; it must be given when the object is
    # created.
    n_trades: int
    # A field called `pvalue` of type `float`, starting value `1.0`.
    pvalue: float = 1.0
    # A field called `significant` of type `bool`, starting value `False`.
    significant: bool = False

# ── Abstract base ─────────────────────────────────────────────────────────────
# Define `MultimodalBaseHorizon`: an abstract template class that other classes fill in. Purpose:
# Abstract multimodal multi-horizon pipeline stage.
class MultimodalBaseHorizon(ABC):
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Abstract multimodal multi-horizon pipeline stage."""
    # Mark the function below as abstract: every child class MUST write its own version.
    @abstractmethod
    # Define a method (a function that belongs to this class) named `fit` (name meaning: fit). It
    # takes: X, y, horizon, and gives back `None`. Then: Placeholder (...): there is intentionally
    # no code here.
    def fit(self, X: np.ndarray, y: np.ndarray, horizon: int) -> None: ...
    # Mark the function below as abstract: every child class MUST write its own version.
    @abstractmethod
    # Define a method (a function that belongs to this class) named `predict` (name meaning:
    # predict). It takes: X, horizon, and gives back `np.ndarray`. Then: Placeholder (...): there is
    # intentionally no code here.
    def predict(self, X: np.ndarray, horizon: int) -> np.ndarray: ...
    # Mark the function below as abstract: every child class MUST write its own version.
    @abstractmethod
    # Define a method (a function that belongs to this class) named `evaluate` (name meaning:
    # evaluate). It takes: X, y, and gives back `HorizonResult`. Then: Placeholder (...): there is
    # intentionally no code here.
    def evaluate(self, X: np.ndarray, y: np.ndarray) -> HorizonResult: ...

# ── Core engine ───────────────────────────────────────────────────────────────
# Define a class (a blueprint for creating objects) named `MultimodalThresholdCalibratorEngine`,
# based on `MultimodalBaseHorizon` (it inherits their abilities). Purpose: Multimodal engine: tune
# parameters — threshold calibrator.
class MultimodalThresholdCalibratorEngine(MultimodalBaseHorizon):
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    Multimodal engine: tune parameters — threshold calibrator.
    Trains, evaluates, tunes and documents multi-horizon stock signals.
    """
    # Define the setup step (constructor) that runs automatically when a new object is created. It
    # takes: cfg (default None).
    def __init__(self, cfg: Optional[MultimodalThresholdCalibratorRiskMetricsConfig] = None):
        # Store `cfg` if it has a value, otherwise `MultimodalThresholdCalibratorRiskMetr...` in
        # this object's `cfg` attribute.
        self.cfg     = cfg or MultimodalThresholdCalibratorRiskMetricsConfig()
        # Store an empty dictionary (lookup table) in this object's `models` attribute.
        self.models  : Dict[int, np.ndarray] = {}   # horizon → weights
        # Store an empty dictionary (lookup table) in this object's `results` attribute.
        self.results : Dict[int, HorizonResult] = {}
        # Store an empty list in this object's `history` attribute.
        self.history : List[Dict] = []
        # Store an empty list in this object's `docs` attribute.
        self.docs    : List[str]  = []
        # Write an information message to the log: `'Multimodal %s ready topic=%s',
        # MULTIMODAL_MODULE, TOPIC`.
        logger.info("Multimodal %s ready  topic=%s", MULTIMODAL_MODULE, TOPIC)

    # ── ABC ──────────────────────────────────────────────────────────────────
    # Define a method (a function that belongs to this class) named `fit` - purpose:
    # Ridge-regression fit for one multimodal horizon. It takes: X, y, horizon, and gives back
    # `None`.
    def fit(self, X: np.ndarray, y: np.ndarray, horizon: int) -> None:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Ridge-regression fit for one multimodal horizon."""
        # Store `X.T @ X` plus `self.cfg.l2_reg * np.eye(X.shape[1])` in the variable `XtX`.
        XtX = X.T @ X + self.cfg.l2_reg * np.eye(X.shape[1])
        # Store `X.T` matrix-multiplied by `y` in the variable `Xty`.
        Xty = X.T @ y
        # Store the result of calling `np.linalg.solve` (name meaning: solve) with `XtX, Xty` in the
        # entry `horizon` of `self.models`.
        self.models[horizon] = np.linalg.solve(XtX, Xty)

    # Define a method (a function that belongs to this class) named `predict` - purpose: Score
    # assets with multimodal horizon-specific weights. It takes: X, horizon, and gives back
    # `np.ndarray`.
    def predict(self, X: np.ndarray, horizon: int) -> np.ndarray:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Score assets with multimodal horizon-specific weights."""
        # Store the result of looking up `horizon` in `self.models` (without crashing if it is
        # missing) in the variable `w`.
        w = self.models.get(horizon)
        # Check whether `w` is empty (None); if so, do the indented steps below.
        if w is None:
            # Send back an array filled with zeros (`X.shape[0]`) as the result of this function.
            return np.zeros(X.shape[0])
        # Send back `X` matrix-multiplied by `w` as the result of this function.
        return X @ w

    # Define a method (a function that belongs to this class) named `evaluate` - purpose: Evaluate
    # most-recently trained horizon. It takes: X, y, and gives back `HorizonResult`.
    def evaluate(self, X: np.ndarray, y: np.ndarray) -> HorizonResult:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Evaluate most-recently trained horizon."""
        # Store `max(self.models)` if `self.models` has a value / is true, otherwise `1` in the
        # variable `h`.
        h = max(self.models) if self.models else 1
        # Send back the result of calling `self._score_horizon` (name meaning: score horizon) with
        # `h, X, y` as the result of this function.
        return self._score_horizon(h, X, y)

    # ── Multi-horizon training ───────────────────────────────────────────────
    # Define a method (a function that belongs to this class) named `train_all_horizons` - purpose:
    # Train multimodal model on every configured horizon. It takes: prices, and gives back
    # `Dict[int, HorizonResult]`.
    def train_all_horizons(self, prices: np.ndarray) -> Dict[int, HorizonResult]:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Train multimodal model on every configured horizon."""
        # Go through the value `self.cfg.horizons` one item at a time; each item is called `h`.
        for h in self.cfg.horizons:
            # Split the result of calling `self._build_features` (name meaning: build features) with
            # `prices, h` into the variables `X`, `y`.
            X, y = self._build_features(prices, h)