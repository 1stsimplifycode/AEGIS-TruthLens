# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal-bankruptcy-early-warning-system  >  engine.py
#  2. Program Description        : This file handles 'engine' for the 'multimodal bankruptcy
#                                  early warning system' part of the project. It exists so this
#                                  piece of work stays in its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : Engine is created with: seed.
#  7. Output                     : - Values returned by its functions to the code that calls
#                                    them.
#                                  - Class definitions (Engine) that other files can use.
#  8. Variables                  : No file-level variables; values are kept inside the
#                                  functions/classes.
#  9. Algorithm / Logic          : Class Engine: Linear forecaster with transparent per-feature
#                                  contributions (steps: _vec, explain).
# 10. Dependencies               : - External libraries (install with pip): numpy, sklearn.
#                                  - Built into Python (no install needed): math.
# 11. Execution Instructions     : - Whole app: pip install -r requirements.txt, then uvicorn
#                                    multimodal_bankruptcy_early_warning_system.main:app --port
#                                    8000 (or: docker compose up).
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Input data is numeric (numbers in arrays or tables) with
#                                    no missing rows.
#                                  - Some results use random numbers, so outputs can differ
#                                    slightly between runs.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : No special error handling. If something goes wrong, Python
#                                  stops and prints an error message explaining what failed.
# ==============================================================================================

# Switch on newer Python behaviour (here: type hints are not evaluated immediately, so they can
# mention classes defined later).
from __future__ import annotations

# Load math, Python's built-in maths functions.
import math

# Load NumPy, a library for fast maths on lists/tables of numbers, and call it `np` for short.
import numpy as np


# From `sklearn.linear_model` (part of scikit-learn, a machine-learning library), bring in `Ridge`
# so they can be used in this file.
from sklearn.linear_model import Ridge


# Define a class (a blueprint for creating objects) named `Engine`. Purpose: Linear forecaster with
# transparent per-feature contributions.
class Engine:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Linear forecaster with transparent per-feature contributions."""

    # Store a list of 6 items: `['lag1', 'lag5', 'trend', 'vol', 'macro', 'flow']` in the fixed
    # setting (constant) `FEATURES`.
    FEATURES = ["lag1", "lag5", "trend", "vol", "macro", "flow"]

    # Define the setup step (constructor) that runs automatically when a new object is created. It
    # takes: seed (default 13), and gives back `None`.
    def __init__(self, seed: int = 13) -> None:
        # Store a random-number generator (`seed`) in the variable `rng`.
        rng = np.random.default_rng(seed)
        # Store random numbers from a bell curve (`0, 1, size=(700, len(self.FEATURES))`) in the
        # variable `X`.
        X = rng.normal(0, 1, size=(700, len(self.FEATURES)))
        # Store a NumPy array (fast number list) made from `[0.5, 0.3, 0.4, -0.2, 0.25, 0.35]` in
        # the variable `w`.
        w = np.array([0.5, 0.3, 0.4, -0.2, 0.25, 0.35])
        # Store `X @ w` plus `rng.normal(0, 0.25, size=700)` in the variable `y`.
        y = X @ w + rng.normal(0, 0.25, size=700)
        # Store the result of calling `Ridge(alpha=0.5).fit` (name meaning: fit) with `X, y` in this
        # object's `model` attribute.
        self.model = Ridge(alpha=0.5).fit(X, y)
        # Store `self.model.intercept_` converted to a decimal number in this object's `bias`
        # attribute.
        self.bias = float(self.model.intercept_)

    # Define a method (a function that belongs to this class) named `_vec` (name meaning: vec). It
    # takes: features, and gives back `np.ndarray`.
    def _vec(self, features: dict) -> np.ndarray:
        # Send back a NumPy array (fast number list) made from `[float(features.get(f, 0.0)) for f
        # in self.FEATURES]` as the result of this function.
        return np.array([float(features.get(f, 0.0)) for f in self.FEATURES])

    # Define a method (a function that belongs to this class) named `explain` (name meaning:
    # explain). It takes: features, and gives back `dict`.
    def explain(self, features: dict) -> dict:
        # Store the result of calling `self._vec` (name meaning: vec) with `features` in the
        # variable `x`.
        x = self._vec(features)
        # Store `self.model.coef_` times `x` in the variable `contrib`.
        contrib = self.model.coef_ * x
        # Store `self.bias + contrib.sum()` converted to a decimal number in the variable `pred`.
        pred = float(self.bias + contrib.sum())
        # Store a new list made by taking each `i` in `range(len(self.FEATURES))` and computing
        # `{'feature': self.FEATURES[i], 'contri...` in the variable `attributions` (this
        # instruction continues over the next 2 lines).
        attributions = [{"feature": self.FEATURES[i],
                         "contribution": round(float(contrib[i]), 4)}
                        for i in range(len(self.FEATURES))]
        # Sort `attributions` in place.
        attributions.sort(key=lambda a: abs(a["contribution"]), reverse=True)
        # Send back a dictionary (lookup table) with 5 entries as the result of this function (this
        # instruction continues over the next 3 lines).
        return {"primitive": "forecast", "forecast": round(pred, 4),
                "baseline": round(self.bias, 4),
                "summary": f"Forecast {pred:+.3f}, led by {attributions[0]['feature']}.",
                "attributions": attributions}
