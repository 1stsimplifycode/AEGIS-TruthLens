# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal_stability_analysis_incremental_updates  >
#                                  multimodal_drawdown_monitor_core_logic.py
#  2. Program Description        : Stability Analysis — Drawdown Monitor. In simple words, this
#                                  file holds the main calculations of this module. It exists
#                                  so this piece of work stays in its own small, easy-to-test
#                                  file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - MultimodalDrawdownMonitorCoreLogicConfig is created with:
#                                    lookback_window, confidence_level, rebalance_freq,
#                                    learning_rate, forgetting_factor, drift_threshold ....
#                                  - MarketSnapshot is created with: timestamp, prices,
#                                    volumes, returns, volatilities, signals.
#                                  - MultimodalDrawdownMonitorEngine is created with: config.
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions
#                                    (MultimodalDrawdownMonitorCoreLogicConfig, MarketSnapshot,
#                                    MultimodalDrawdownMonitorEngine) that other files can use.
#  8. Variables                  : - logger = logging.getLogger(__name__)
#                                  - MULTIMODAL_MODULE =
#                                    'multimodal_drawdown_monitor_core_logic'
#                                  - TOPIC = 'stability_analysis'
#                                  - VERSION = '1.0.0'
#  9. Algorithm / Logic          : - Class MultimodalDrawdownMonitorCoreLogicConfig:
#                                    Configuration for multimodal drawdown_monitor module.
#                                  - Class MarketSnapshot: Point-in-time multimodal market
#                                    state.
#                                  - Class MultimodalDrawdownMonitorEngine: Multimodal engine
#                                    for stability analysis in equity markets. Implements increm
#                                    (steps: incremental_update, _compute_signals, _update_state,
#                                    _track_performance).
# 10. Dependencies               : - External libraries (install with pip): numpy, pandas.
#                                  - Built into Python (no install needed): typing,
#                                    dataclasses, datetime, logging.
# 11. Execution Instructions     : - Not run on its own. Another file imports it, e.g. 'from
#                                    multimodal_drawdown_monitor_core_logic import ...'.
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
  ZIP Topic  : StabilityAnalysis
  Folder     : multimodal_drawdown_monitor
  File       : multimodal_drawdown_monitor_core_logic.py
  Purpose    : Stability Analysis — Drawdown Monitor
"""

# Load NumPy, a library for fast maths on lists/tables of numbers, and call it `np` for short.
import numpy as np
# Load pandas, a library for working with tables of data (like Excel in code), and call it `pd` for
# short.
import pandas as pd
# From typing, Python's built-in labels that describe what type a value is, bring in `List`, `Dict`,
# `Optional`, `Tuple` so they can be used in this file.
from typing import List, Dict, Optional, Tuple
# From dataclasses, Python's built-in shortcut for simple data-holding classes, bring in
# `dataclass`, `field` so they can be used in this file.
from dataclasses import dataclass, field
# From datetime, Python's built-in date and time tools, bring in `datetime`, `timedelta` so they can
# be used in this file.
from datetime import datetime, timedelta
# Load logging, Python's built-in tool for writing log messages.
import logging

# Store a logger (message recorder) named `__name__` in the variable `logger`.
logger = logging.getLogger(__name__)

# Store the text `'multimodal_drawdown_monitor_core_logic'` in the fixed setting (constant)
# `MULTIMODAL_MODULE`.
MULTIMODAL_MODULE = 'multimodal_drawdown_monitor_core_logic'
# Store the text `'stability_analysis'` in the fixed setting (constant) `TOPIC`.
TOPIC             = 'stability_analysis'
# Store the text `'1.0.0'` in the fixed setting (constant) `VERSION`.
VERSION           = '1.0.0'

# ── Configuration ────────────────────────────────────────────────────────────
# Mark the class below as a dataclass: Python automatically writes its setup code from the listed
# fields.
@dataclass
# Define `MultimodalDrawdownMonitorCoreLogicConfig`: a simple data-holding class (blueprint for
# objects). Purpose: Configuration for multimodal drawdown_monitor module.
class MultimodalDrawdownMonitorCoreLogicConfig:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Configuration for multimodal drawdown_monitor module."""
    # A field called `lookback_window` of type `int`, starting value `252`.
    lookback_window: int = 252          # trading days
    # A field called `confidence_level` of type `float`, starting value `0.95`.
    confidence_level: float = 0.95      # VaR / CVaR confidence
    # A field called `rebalance_freq` of type `str`, starting value `'daily'`.
    rebalance_freq: str = 'daily'       # daily | weekly | monthly
    # A field called `learning_rate` of type `float`, starting value `0.01`.
    learning_rate: float = 0.01         # online update step
    # A field called `forgetting_factor` of type `float`, starting value `0.97`.
    forgetting_factor: float = 0.97     # exponential decay lambda
    # A field called `drift_threshold` of type `float`, starting value `0.05`.
    drift_threshold: float = 0.05       # regime-change sensitivity
    # A field called `max_drawdown_limit` of type `float`, starting value `0.15`.
    max_drawdown_limit: float = 0.15    # hard stop loss %
    # A field called `universe_size` of type `int`, starting value `500`.
    universe_size: int = 500            # S&P-500 style universe

# ── Data Structures ──────────────────────────────────────────────────────────
# Mark the class below as a dataclass: Python automatically writes its setup code from the listed
# fields.
@dataclass
# Define `MarketSnapshot`: a simple data-holding class (blueprint for objects). Purpose:
# Point-in-time multimodal market state.
class MarketSnapshot:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Point-in-time multimodal market state."""
    # A field (piece of data) called `timestamp` of type `datetime`; it must be given when the
    # object is created.
    timestamp: datetime
    # A field (piece of data) called `prices` of type `np.ndarray`; it must be given when the object
    # is created.
    prices: np.ndarray
    # A field (piece of data) called `volumes` of type `np.ndarray`; it must be given when the
    # object is created.
    volumes: np.ndarray
    # A field (piece of data) called `returns` of type `np.ndarray`; it must be given when the
    # object is created.
    returns: np.ndarray
    # A field (piece of data) called `volatilities` of type `np.ndarray`; it must be given when the
    # object is created.
    volatilities: np.ndarray
    # A field called `signals` of type `Dict[str, float]`, with settings `default_factory=dict`.
    signals: Dict[str, float] = field(default_factory=dict)

# ── Core Engine ──────────────────────────────────────────────────────────────
# Define a class (a blueprint for creating objects) named `MultimodalDrawdownMonitorEngine`.
# Purpose: Multimodal engine for stability analysis in equity markets.
class MultimodalDrawdownMonitorEngine:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    Multimodal engine for stability analysis in equity markets.
    Implements incremental, drift-aware, convergence-tracked updates.
    """

    # Define the setup step (constructor) that runs automatically when a new object is created. It
    # takes: config (default None).
    def __init__(self, config: Optional[object] = None):
        # Store `config` if it has a value, otherwise `MultimodalDrawdownMonitorCoreLogicCon...` in
        # this object's `config` attribute.
        self.config   = config or MultimodalDrawdownMonitorCoreLogicConfig()
        # Store an empty dictionary (lookup table) in this object's `state` attribute.
        self.state    : Dict = {}
        # Store an empty list in this object's `history` attribute.
        self.history  : List[MarketSnapshot] = []
        # Store an empty dictionary (lookup table) in this object's `metrics` attribute.
        self.metrics  : Dict[str, float] = {}
        # Store False (no) in this object's `_fitted` attribute.
        self._fitted  : bool = False
        # Write an information message to the log: `'Multimodal engine initialised — topic=%s',
        # TOPIC`.
        logger.info("Multimodal engine initialised — topic=%s", TOPIC)

    # ── Incremental update ───────────────────────────────────────────────────
    # Define a method (a function that belongs to this class) named `incremental_update` - purpose:
    # Apply one multimodal incremental update step. It takes: snap, and gives back `Dict[str,
    # float]`.
    def incremental_update(self, snap: MarketSnapshot) -> Dict[str, float]:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Apply one multimodal incremental update step."""
        # Add `snap` to the end of `self.history`.
        self.history.append(snap)
        # Check whether `len(self.history)` is greater than `self.config.lookback_window`; if so, do
        # the indented steps below.
        if len(self.history) > self.config.lookback_window:
            # Remove and return an item from `self.history`.
            self.history.pop(0)
        # Store the result of calling `self._compute_signals` (name meaning: compute signals) with
        # `snap` in the variable `results`.
        results = self._compute_signals(snap)
        # Call `self._update_state` (name meaning: update state) with `results`.
        self._update_state(results)
        # Call `self._track_performance` (name meaning: track performance) with `results`.
        self._track_performance(results)
        # Send back the value of `results` as the result of this function.
        return results

    # Define a method (a function that belongs to this class) named `_compute_signals` - purpose:
    # Generate multimodal alpha signals from market snapshot. It takes: snap, and gives back
    # `Dict[str, float]`.
    def _compute_signals(self, snap: MarketSnapshot) -> Dict[str, float]:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Generate multimodal alpha signals from market snapshot."""
        # Check whether `len(self.history)` is less than `2`; if so, do the indented steps below.
        if len(self.history) < 2:
            # Send back an empty dictionary (lookup table) as the result of this function.
            return {}
        # Store the result of calling `np.vstack` (name meaning: vstack) with `[s.returns for s in
        # self.history]` in the variable `ret_matrix`.
        ret_matrix = np.vstack([s.returns for s in self.history])
        # Store the average of `ret_matrix[-20:]` in the variable `momentum`.
        momentum   = ret_matrix[-20:].mean(axis=0)
        # Store the negative of `ret_matrix[-5:].mean(axis=0)` in the variable `reversion`.
        reversion  = -ret_matrix[-5:].mean(axis=0)
        # Store `1.0` divided by `ret_matrix.std(axis=0) + 1e-08` in the variable `vol_signal`.
        vol_signal = 1.0 / (ret_matrix.std(axis=0) + 1e-8)
        # Store `0.4 * momentum + 0.3 * reversion` plus `0.3 * vol_signal` in the variable
        # `composite`.
        composite  = 0.4*momentum + 0.3*reversion + 0.3*vol_signal
        # Send back a dictionary (lookup table) with 4 entries as the result of this function (this
        # instruction continues over the next 3 lines).
        return {'momentum': float(momentum.mean()),
                'reversion': float(reversion.mean()),
                'vol_signal': float(vol_signal.mean()),
                'composite': float(composite.mean())}

    # Define a method (a function that belongs to this class) named `_update_state` - purpose:
    # Exponential-forgetting state update (multimodal RLS). It takes: results, and gives back
    # `None`.
    def _update_state(self, results: Dict[str, float]) -> None:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Exponential-forgetting state update (multimodal RLS)."""
        # Store the value `self.config.forgetting_factor` in the variable `lam`.
        lam = self.config.forgetting_factor
        # Go through every key/value pair of `results` one item at a time; each item is called `(k,
        # v)`.
        for k, v in results.items():
            # Store the result of looking up `k, v` in `self.state` (without crashing if it is
            # missing) in the variable `prev`.
            prev = self.state.get(k, v)
            # Store `lam * prev` plus `(1 - lam) * v` in the entry `k` of `self.state`.
            self.state[k] = lam * prev + (1 - lam) * v

    # Define a method (a function that belongs to this class) named `_track_performance` - purpose:
    # Rolling Sharpe and hit-rate performance tracking. It takes: results, and gives back `None`.
    def _track_performance(self, results: Dict[str, float]) -> None:
        # A description (docstring) explaining what this part of the code does - Python stores it
        # but does not run it.
        """Rolling Sharpe and hit-rate performance tracking."""
        # Check whether `'composite'` is not in `results`; if so, do the indented steps below.
        if 'composite' not in results:
            # Stop this function here and send nothing back.
            return
        # Store a new list made by taking each `s` in `self.history` and computing
        # `s.signals.get('composite', 0)` in the variable `hist_vals`.
        hist_vals = [s.signals.get('composite', 0) for s in self.history]
        # Check whether `len(hist_vals)` is greater than `1`; if so, do the indented steps below.
        if len(hist_vals) > 1:
            # Store a NumPy array (fast number list) made from `hist_vals` in the variable `arr`.
            arr = np.array(hist_vals)
            # Store `arr.mean() / (arr.std() + 1e-08)` times `np.sqrt(252)` in the entry `'sharpe'`
            # of `self.metrics`.
            self.metrics['sharpe']   = arr.mean() / (arr.std() + 1e-8) * np.sqrt(252)