# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal_validate_stability_define_thresholds  >
#                                  multimodal_sensitivity_stab_probe_data_pipeline.py
#  2. Program Description        : Validate Stability — Sensitivity Stab Probe. In simple
#                                  words, this file loads, cleans and prepares market data
#                                  before it is analysed. It exists so this piece of work stays
#                                  in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - MultimodalSensitivityStabProbeDataPipelineConfig is
#                                    created with: thresholds, universe_size, lookback,
#                                    n_bootstrap, n_permutations, confidence ....
#                                  - ThresholdResult is created with: threshold, sharpe,
#                                    calmar, ic_mean, hit_rate, turnover ....
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions
#                                    (MultimodalSensitivityStabProbeDataPipelineConfig,
#                                    ThresholdResult, MultimodalThresholdBase,
#                                    MultimodalSensitivityStabProbeEngine) that other files can
#                                    use.
#  8. Variables                  : - logger = logging.getLogger(__name__)
#                                  - MULTIMODAL_MODULE =
#                                    'multimodal_sensitivity_stab_probe_data_pipeline'
#                                  - TOPIC = 'validate_stability'
#                                  - VERSION = '1.0.0'
#                                  - DEFAULT_THRESHOLDS = [0.0, 0.25, 0.5, 0.75, 1.0, 1.25,
#                                    1.5, 2.0, 2.5, 3.0]
#  9. Algorithm / Logic          : - Class MultimodalSensitivityStabProbeDataPipelineConfig:
#                                    Multimodal threshold-sweep config for
#                                    sensitivity_stab_probe.
#                                  - Class ThresholdResult: Per-threshold evaluation record for
#                                    multimodal sweep.
#                                  - Class MultimodalThresholdBase: Abstract interface for
#                                    every multimodal threshold-analysis module (steps: sweep,
#                                    optimal, summarize).
#                                  - Class MultimodalSensitivityStabProbeEngine: Multimodal
#                                    threshold engine: validate stability — sensitivity stab
#                                    probe. Swe (steps: sweep, _eval_threshold).
# 10. Dependencies               : - External libraries (install with pip): numpy, pandas.
#                                  - Built into Python (no install needed): time, logging,
#                                    copy, json, itertools, typing, dataclasses, datetime, abc.
# 11. Execution Instructions     : - Not run on its own. Another file imports it, e.g. 'from
#                                    multimodal_sensitivity_stab_probe_data_pipeline import ...'.
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
  ZIP Topic  : ValidateStability
  Folder     : multimodal_sensitivity_stab_probe
  File       : multimodal_sensitivity_stab_probe_data_pipeline.py
  Purpose    : Validate Stability — Sensitivity Stab Probe
"""

# Load NumPy, a library for fast maths on lists/tables of numbers, and call it `np` for short.
import numpy as np
# Load pandas, a library for working with tables of data (like Excel in code), and call it `pd` for
# short.
import pandas as pd
# Load time, Python's built-in clock and timing tools. Then: Load logging, Python's built-in tool
# for writing log messages. Then: Load copy, Python's built-in tools for duplicating objects. Then:
# Load json, Python's built-in tool for reading/writing JSON text data. Then: Load itertools,
# Python's built-in tools for looping over combinations.
import time, logging, copy, json, itertools
# From typing, Python's built-in labels that describe what type a value is, bring in `List`, `Dict`,
# `Optional`, `Tuple`, `Any`, `Callable` so they can be used in this file.
from typing import List, Dict, Optional, Tuple, Any, Callable
# From dataclasses, Python's built-in shortcut for simple data-holding classes, bring in
# `dataclass`, `field` so they can be used in this file.
from dataclasses import dataclass, field
# From datetime, Python's built-in date and time tools, bring in `datetime` so they can be used in
# this file.
from datetime import datetime
# From abc, Python's built-in tool for making template (abstract) classes, bring in `ABC`,
# `abstractmethod` so they can be used in this file.
from abc import ABC, abstractmethod

# Store a logger (message recorder) named `__name__` in the variable `logger`.
logger = logging.getLogger(__name__)
# Store the text `'multimodal_sensitivity_stab_probe_data_pipeline'` in the fixed setting (constant)
# `MULTIMODAL_MODULE`.
MULTIMODAL_MODULE = 'multimodal_sensitivity_stab_probe_data_pipeline'
# Store the text `'validate_stability'` in the fixed setting (constant) `TOPIC`.
TOPIC             = 'validate_stability'
# Store the text `'1.0.0'` in the fixed setting (constant) `VERSION`.
VERSION           = '1.0.0'
# Store a list of 10 items: `[0.0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 2.0, 2.5, 3.0]` in the fixed
# setting (constant) `DEFAULT_THRESHOLDS`.
DEFAULT_THRESHOLDS = [0.0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 2.0, 2.5, 3.0]

# ── Configuration ─────────────────────────────────────────────────────────────
# Mark the class below as a dataclass: Python automatically writes its setup code from the listed
# fields.
@dataclass
# Define `MultimodalSensitivityStabProbeDataPipelineConfig`: a simple data-holding class (blueprint
# for objects). Purpose: Multimodal threshold-sweep config for sensitivity_stab_probe.
class MultimodalSensitivityStabProbeDataPipelineConfig:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Multimodal threshold-sweep config for sensitivity_stab_probe."""
    # A field called `thresholds` of type `List[float]`, with settings `default_factory=lambda:
    # DEFAULT_THRESHOLDS`.
    thresholds: List[float]   = field(default_factory=lambda: DEFAULT_THRESHOLDS)
    # A field called `universe_size` of type `int`, starting value `500`.
    universe_size: int        = 500
    # A field called `lookback` of type `int`, starting value `252`.
    lookback: int             = 252
    # A field called `n_bootstrap` of type `int`, starting value `500`.
    n_bootstrap: int          = 500
    # A field called `n_permutations` of type `int`, starting value `200`.
    n_permutations: int       = 200
    # A field called `confidence` of type `float`, starting value `0.95`.
    confidence: float         = 0.95
    # A field called `cost_per_trade_bps` of type `float`, starting value `5.0`.
    cost_per_trade_bps: float = 5.0
    # A field called `min_holding_days` of type `int`, starting value `1`.
    min_holding_days: int     = 1
    # A field called `stability_window` of type `int`, starting value `63`.
    stability_window: int     = 63
    # A field called `doc_format` of type `str`, starting value `'markdown'`.
    doc_format: str           = 'markdown'

# ── Result container ──────────────────────────────────────────────────────────
# Mark the class below as a dataclass: Python automatically writes its setup code from the listed
# fields.
@dataclass
# Define `ThresholdResult`: a simple data-holding class (blueprint for objects). Purpose:
# Per-threshold evaluation record for multimodal sweep.
class ThresholdResult:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Per-threshold evaluation record for multimodal sweep."""
    # A field (piece of data) called `threshold` of type `float`; it must be given when the object
    # is created.
    threshold: float
    # A field (piece of data) called `sharpe` of type `float`; it must be given when the object is
    # created.
    sharpe: float
    # A field (piece of data) called `calmar` of type `float`; it must be given when the object is
    # created.
    calmar: float
    # A field (piece of data) called `ic_mean` of type `float`; it must be given when the object is
    # created.
    ic_mean: float
    # A field (piece of data) called `hit_rate` of type `float`; it must be given when the object is
    # created.
    hit_rate: float
    # A field (piece of data) called `turnover` of type `float`; it must be given when the object is
    # created.
    turnover: float
    # A field (piece of data) called `cost_adj_sharpe` of type `float`; it must be given when the
    # object is created.
    cost_adj_sharpe: float
    # A field (piece of data) called `max_drawdown` of type `float`; it must be given when the
    # object is created.
    max_drawdown: float
    # A field (piece of data) called `n_trades` of type `int`; it must be given when the object is
    # created.
    n_trades: int
    # A field called `pvalue` of type `float`, starting value `1.0`.
    pvalue: float = 1.0
    # A field called `stable` of type `bool`, starting value `False`.
    stable: bool  = False
    # A field called `optimal` of type `bool`, starting value `False`.
    optimal: bool = False

# ── Abstract base ─────────────────────────────────────────────────────────────
# Define `MultimodalThresholdBase`: an abstract template class that other classes fill in. Purpose:
# Abstract interface for every multimodal threshold-analysis module.
class MultimodalThresholdBase(ABC):
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Abstract interface for every multimodal threshold-analysis module."""
    # Mark the function below as abstract: every child class MUST write its own version.
    @abstractmethod
    # Define a method (a function that belongs to this class) named `sweep` (name meaning: sweep).
    # It takes: signals, returns, and gives back `Dict[float, ThresholdResult]`. Then: Placeholder
    # (...): there is intentionally no code here.
    def sweep(self, signals: np.ndarray,
              returns: np.ndarray) -> Dict[float, ThresholdResult]: ...
    # Mark the function below as abstract: every child class MUST write its own version.
    @abstractmethod
    # Define a method (a function that belongs to this class) named `optimal` (name meaning:
    # optimal). It takes no inputs, and gives back `Optional[ThresholdResult]`. Then: Placeholder
    # (...): there is intentionally no code here.
    def optimal(self) -> Optional[ThresholdResult]: ...
    # Mark the function below as abstract: every child class MUST write its own version.
    @abstractmethod
    # Define a method (a function that belongs to this class) named `summarize` (name meaning:
    # summarize). It takes no inputs, and gives back `str`. Then: Placeholder (...): there is
    # intentionally no code here.
    def summarize(self) -> str: ...

# ── Core Engine ───────────────────────────────────────────────────────────────
# Define a class (a blueprint for creating objects) named `MultimodalSensitivityStabProbeEngine`,
# based on `MultimodalThresholdBase` (it inherits their abilities). Purpose: Multimodal threshold
# engine: validate stability — sensitivity stab probe.
class MultimodalSensitivityStabProbeEngine(MultimodalThresholdBase):
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    Multimodal threshold engine: validate stability — sensitivity stab probe.
    Sweeps, evaluates, validates and documents signal thresholds.
    """
    # Define the setup step (constructor) that runs automatically when a new object is created. It
    # takes: cfg (default None).
    def __init__(self, cfg: Optional[MultimodalSensitivityStabProbeDataPipelineConfig] = None):
        # Store `cfg` if it has a value, otherwise `MultimodalSensitivityStabProbeDataPip...` in
        # this object's `cfg` attribute.
        self.cfg      = cfg or MultimodalSensitivityStabProbeDataPipelineConfig()
        # Store an empty dictionary (lookup table) in this object's `results` attribute.
        self.results  : Dict[float, ThresholdResult] = {}
        # Store an empty list in this object's `history` attribute.
        self.history  : List[Dict[str, Any]] = []
        # Store an empty list in this object's `docs` attribute.
        self.docs     : List[str] = []
        # Store the number `0` in this object's `_run_id` attribute.
        self._run_id  : int = 0
        # Write an information message to the log: `'Multimodal %s ready topic=%s',
        # MULTIMODAL_MODULE, TOPIC`.
        logger.info("Multimodal %s ready  topic=%s", MULTIMODAL_MODULE, TOPIC)

    # ── Threshold sweep ─────────────────────────────────────────────────────
    # Define a method (a function that belongs to this class) named `sweep` - purpose: Run
    # multimodal grid sweep across all configured thresholds. It takes: signals, returns, and gives
    # back `Dict[float, ThresholdResult]`.
    def sweep(self, signals: np.ndarray,
              returns: np.ndarray) -> Dict[float, ThresholdResult]:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Run multimodal grid sweep across all configured thresholds."""
        # Empty `self.results`.
        self.results.clear()
        # Go through the value `self.cfg.thresholds` one item at a time; each item is called `t`.
        for t in self.cfg.thresholds:
            # Store the result of calling `self._eval_threshold` (name meaning: eval threshold) with
            # `t, signals, returns` in the entry `t` of `self.results`.
            self.results[t] = self._eval_threshold(t, signals, returns)
        # Call `self._mark_optimal` (name meaning: mark optimal).
        self._mark_optimal()
        # Increase this object's `_run_id` attribute by `1`.
        self._run_id += 1
        # Add `{'run_id': self._run_id, 'n_thresh': len(self.cfg.thresho...` to the end of
        # `self.history` (this instruction continues over the next 2 lines).
        self.history.append({'run_id': self._run_id,
                             'n_thresh': len(self.cfg.thresholds),
                             'timestamp': datetime.utcnow().isoformat()})
        # Send back this object's `results` value as the result of this function.
        return self.results

    # Define a method (a function that belongs to this class) named `_eval_threshold` - purpose:
    # Compute all metrics for a single multimodal threshold value. It takes: t, signals, returns,
    # and gives back `ThresholdResult`.
    def _eval_threshold(self, t: float, signals: np.ndarray,
                        returns: np.ndarray) -> ThresholdResult:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Compute all metrics for a single multimodal threshold value."""
        # Store whether `np.abs(signals)` is at least `t` in the variable `mask`.
        mask       = np.abs(signals) >= t
        # Store `np.sign(signals)` times `mask.astype(float)` in the variable `pos`.
        pos        = np.sign(signals) * mask.astype(float)
        # Store `pos[:-1]` times `returns[1:]` in the variable `strat_rets`.
        strat_rets = pos[:-1] * returns[1:]
        # Store `mask.sum()` converted to a whole number in the variable `n_trades`.
        n_trades   = int(mask.sum())