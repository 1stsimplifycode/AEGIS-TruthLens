# LINE-COMMENTS-ADDED
#!/usr/bin/env python3
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal_security  >  orchestrate.py
#  2. Program Description        : MULTIMODAL SECURITY SYSTEM — MASTER ORCHESTRATOR Coordinates
#                                  Python → R → C++ → Java security layers All metadata
#                                  exchanged via XML (no JSON). In simple words, this file
#                                  starts the other parts of the project one after another in
#                                  the right order. It exists so this piece of work stays in
#                                  its own small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Data fetched from the internet or from other programs.
#                                  - banner() receives: title.
#                                  - run_step() receives: label, cmd, cwd.
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : - BASE = Path(__file__).parent
#                                  - SHARED = BASE / 'shared'
#  9. Algorithm / Logic          : - banner(): banner.
#                                  - run_step(): run step.
#                                  - main(): main.
#                                  - When run directly, the code under 'if __name__ ==
#                                    "__main__"' starts the work.
# 10. Dependencies               : Built into Python (no install needed): subprocess, sys, os,
#                                  shutil, pathlib.
# 11. Execution Instructions     : - Open a terminal in the main folder and run: python
#                                    multimodal_security/orchestrate.py
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : No special error handling. If something goes wrong, Python
#                                  stops and prints an error message explaining what failed.
# ==============================================================================================

# A description (docstring) explaining what this part of the code does - Python stores it but does
# not run it.
"""
=============================================================
  MULTIMODAL SECURITY SYSTEM — MASTER ORCHESTRATOR
  Coordinates Python → R → C++ → Java security layers
  All metadata exchanged via XML (no JSON)
=============================================================
"""

# Load subprocess, Python's built-in tool for running other programs.
import subprocess
# Load sys, Python's built-in tools for the running program itself.
import sys
# Load os, Python's built-in tools for files, folders and system settings.
import os
# Load shutil, Python's built-in tools for copying/moving files.
import shutil
# From pathlib, Python's built-in tool for handling file paths, bring in `Path` so they can be used
# in this file.
from pathlib import Path

# Store the value `Path(__file__).parent` in the fixed setting (constant) `BASE`.
BASE = Path(__file__).parent
# Store `BASE` divided by `'shared'` in the fixed setting (constant) `SHARED`.
SHARED = BASE / "shared"
# Create the folder `SHARED`.
SHARED.mkdir(exist_ok=True)


# Define a function (a reusable set of steps) named `banner` (name meaning: banner). It takes:
# title.
def banner(title: str):
    # Show nothing on the screen.
    print()
    # Show `'=' * 62` on the screen.
    print("=" * 62)
    # Show `f' {title}'` on the screen.
    print(f"  {title}")
    # Show `'=' * 62` on the screen.
    print("=" * 62)


# Define a function (a reusable set of steps) named `run_step` (name meaning: run step). It takes:
# label, cmd, cwd (default None).
def run_step(label: str, cmd: list, cwd: Path = None):
    # Show `f'\n▶ {label}'` on the screen.
    print(f"\n▶ {label}")
    # Show `f" CMD: {' '.join((str(c) for c in cmd))}"` on the screen.
    print(f"  CMD: {' '.join(str(c) for c in cmd)}")
    # Store the result of running another program (`cmd, cwd=str(cwd or BASE), capture_output=False,
    # text=True`) and wait for it in the variable `result` (this instruction continues over the next
    # 3 lines).
    result = subprocess.run(
        cmd, cwd=str(cwd or BASE),
        capture_output=False, text=True
    )
    # Check whether `result.returncode` is not equal to `0`; if so, do the indented steps below.
    if result.returncode != 0:
        # Show `f' ⚠ Exit code {result.returncode}'` on the screen.
        print(f"  ⚠ Exit code {result.returncode}")
    # Send back whether `result.returncode` equals `0` as the result of this function.
    return result.returncode == 0


# Define a function (a reusable set of steps) named `main` (name meaning: main). It takes no inputs.
def main():
    # Call the function `banner` (name meaning: banner) given `'MULTIMODAL SECURITY SYSTEM — MASTER
    # ORCHESTRATOR'`.
    banner("MULTIMODAL SECURITY SYSTEM — MASTER ORCHESTRATOR")
    # Show `' Layers: Python → R → C++ → Java'` on the screen.
    print("  Layers:  Python → R → C++ → Java")
    # Show `' Format: XML (no JSON)'` on the screen.
    print("  Format:  XML (no JSON)")
    # Show `' Security: AES-GCM + Feistel + PBKDF2 + SHA-256 + HMAC'` on the screen.
    print("  Security: AES-GCM + Feistel + PBKDF2 + SHA-256 + HMAC")

    # ── LAYER 1: Python ──────────────────────────────────────
    # Call the function `banner` (name meaning: banner) given `'LAYER 1 — PYTHON: ZIP + Stream
    # Encryption + SHA-256'`.
    banner("LAYER 1 — PYTHON: ZIP + Stream Encryption + SHA-256")
    # Store `BASE / 'python'` divided by `'secure_zip_creator.py'` in the variable `py_script`.
    py_script = BASE / "python" / "secure_zip_creator.py"
    # Call the function `run_step` (name meaning: run step) given `'Python layer', [sys.executable,
    # str(py_script)]`.
    run_step("Python layer", [sys.executable, str(py_script)])

    # ── LAYER 2: R (if available) ────────────────────────────
    # Call the function `banner` (name meaning: banner) given `'LAYER 2 — R: Statistical Integrity
    # Analysis'`.
    banner("LAYER 2 — R: Statistical Integrity Analysis")
    # Store the result of calling `shutil.which` (name meaning: which) with `'Rscript'` in the
    # variable `r_exe`.
    r_exe = shutil.which("Rscript")
    # Check whether `r_exe` has a value / is true; if so, do the indented steps below.
    if r_exe:
        # Store `BASE / 'r'` divided by `'integrity_verifier.R'` in the variable `r_script`.
        r_script = BASE / "r" / "integrity_verifier.R"
        # Call the function `run_step` (name meaning: run step) given `'R layer', [r_exe,
        # str(r_script)]`.
        run_step("R layer", [r_exe, str(r_script)])
    # Otherwise (when the check above was not true), do the following steps.
    else:
        # Show `' ⚠ Rscript not found — skipping R layer (install R to en...` on the screen.
        print("  ⚠ Rscript not found — skipping R layer (install R to enable)")

    # ── LAYER 3: C++ (compile + run) ─────────────────────────
    # Call the function `banner` (name meaning: banner) given `'LAYER 3 — C++: Feistel Cipher +
    # CRC-32 + Binary Manifest'`.
    banner("LAYER 3 — C++: Feistel Cipher + CRC-32 + Binary Manifest")
    # Store `BASE / 'cpp'` divided by `'secure_layer.cpp'` in the variable `cpp_src`.
    cpp_src = BASE / "cpp" / "secure_layer.cpp"
    # Store `BASE / 'cpp'` divided by `'mmsec_cpp'` in the variable `cpp_bin`.
    cpp_bin = BASE / "cpp" / "mmsec_cpp"
    # Store the result of the function `run_step` (name meaning: run step) given `'Compile C++',
    # ['g++', '-std=c++17', '-O2', '-o', str(cpp...` in the variable `compiled` (this instruction
    # continues over the next 3 lines).
    compiled = run_step(
        "Compile C++",
        ["g++", "-std=c++17", "-O2", "-o", str(cpp_bin), str(cpp_src)]
    )
    # Check whether `compiled` has a value / is true; if so, do the indented steps below.
    if compiled:
        # Store `SHARED / 'archive.zip'` converted to text in the variable `enc_in`.
        enc_in  = str(SHARED / "archive.zip")
        # Store `SHARED / 'archive_cpp.mmsec'` converted to text in the variable `enc_out`.
        enc_out = str(SHARED / "archive_cpp.mmsec")
        # Store `SHARED / 'manifest_cpp.xml'` converted to text in the variable `xml_out`.
        xml_out = str(SHARED / "manifest_cpp.xml")
        # Check whether `SHARED / 'archive.zip'` exists; if so, do the indented steps below.
        if (SHARED / "archive.zip").exists():
            # Call the function `run_step` (name meaning: run step) given `'C++ encrypt',
            # [str(cpp_bin), 'encrypt', enc_in, enc_out,...`.
            run_step("C++ encrypt",  [str(cpp_bin), "encrypt",  enc_in, enc_out, "CppSecLayer#3!"])
            # Call the function `run_step` (name meaning: run step) given `'C++ analyse',
            # [str(cpp_bin), 'analyse', enc_out]`.
            run_step("C++ analyse",  [str(cpp_bin), "analyse",  enc_out])
            # Call the function `run_step` (name meaning: run step) given `'C++ manifest',
            # [str(cpp_bin), 'manifest', enc_out, xml_out]`.
            run_step("C++ manifest", [str(cpp_bin), "manifest", enc_out, xml_out])
        # Otherwise (when the check above was not true), do the following steps.
        else:
            # Call the function `run_step` (name meaning: run step) given `'C++ self-test',
            # [str(cpp_bin)]`.
            run_step("C++ self-test", [str(cpp_bin)])
    # Otherwise (when the check above was not true), do the following steps.
    else:
        # Show `' ⚠ C++ compilation failed — ensure g++ is installed'` on the screen.
        print("  ⚠ C++ compilation failed — ensure g++ is installed")

    # ── LAYER 4: Java ────────────────────────────────────────
    # Call the function `banner` (name meaning: banner) given `'LAYER 4 — JAVA: AES-256-GCM + PBKDF2
    # + XML Manifest'`.
    banner("LAYER 4 — JAVA: AES-256-GCM + PBKDF2 + XML Manifest")
    # Store `BASE / 'java'` divided by `'SecureZipManager.java'` in the variable `java_src`.
    java_src = BASE / "java" / "SecureZipManager.java"
    # Store `BASE` divided by `'java'` in the variable `java_dir`.
    java_dir = BASE / "java"
    # Store the result of calling `shutil.which` (name meaning: which) with `'javac'` in the
    # variable `javac`.
    javac = shutil.which("javac")
    # Store the result of calling `shutil.which` (name meaning: which) with `'java'` in the variable
    # `java`.
    java  = shutil.which("java")
    # Check whether `javac` has a value / is true and `java` has a value / is true; if so, do the
    # indented steps below.
    if javac and java:
        # Store the result of the function `run_step` (name meaning: run step) given `'Compile
        # Java', [javac, str(java_src)], cwd=java_dir` in the variable `compiled_j` (this
        # instruction continues over the next 3 lines).
        compiled_j = run_step(
            "Compile Java",
            [javac, str(java_src)], cwd=java_dir
        )
        # Check whether `compiled_j` has a value / is true; if so, do the indented steps below.
        if compiled_j:
            # Call the function `run_step` (name meaning: run step) given `'Run Java', [java, '-cp',
            # str(java_dir), 'SecureZipManage...` (this instruction continues over the next 3
            # lines).
            run_step(
                "Run Java",
                [java, "-cp", str(java_dir), "SecureZipManager", str(SHARED)]
            )
    # Otherwise (when the check above was not true), do the following steps.
    else:
        # Show `' ⚠ Java (javac/java) not found — skipping Java layer'` on the screen.
        print("  ⚠ Java (javac/java) not found — skipping Java layer")

    # ── SUMMARY ──────────────────────────────────────────────
    # Call the function `banner` (name meaning: banner) given `'FINAL SUMMARY'`.
    banner("FINAL SUMMARY")
    # Store a list made from `SHARED.iterdir()` in the variable `outputs`.
    outputs = list(SHARED.iterdir())
    # Store a new list made by taking each `f` in `outputs` (only when `f.suffix == '.xml'`) and
    # computing `f` in the variable `xml_files`.
    xml_files = [f for f in outputs if f.suffix == ".xml"]
    # Store a new list made by taking each `f` in `outputs` (only when `f.suffix in ('.mmsec',
    # '.zip')`) and computing `f` in the variable `sec_files`.
    sec_files = [f for f in outputs if f.suffix in (".mmsec", ".zip")]

    # Show `f'\n Shared artifacts in: {SHARED}'` on the screen.
    print(f"\n  Shared artifacts in: {SHARED}")
    # Show `f'\n Security blobs (.mmsec):'` on the screen.
    print(f"\n  Security blobs (.mmsec):")
    # Go through the value of `sec_files` one item at a time; each item is called `f`.
    for f in sec_files:
        # Store `f.stat().st_size` if `f` exists, otherwise `0` in the variable `sz`.
        sz = f.stat().st_size if f.exists() else 0
        # Show `f' {f.name:<35} {sz:>10,} bytes'` on the screen.
        print(f"    {f.name:<35} {sz:>10,} bytes")

    # Show `f'\n XML manifests:'` on the screen.
    print(f"\n  XML manifests:")
    # Go through the value of `xml_files` one item at a time; each item is called `f`.
    for f in xml_files:
        # Show `f' {f.name}'` on the screen.
        print(f"    {f.name}")

    # Show `'\n Security layers applied:'` on the screen.
    print("\n  Security layers applied:")
    # Show `' [1] Python — Stream cipher (CTR-HMAC-SHA256) + PBKDF2'` on the screen.
    print("    [1] Python  — Stream cipher (CTR-HMAC-SHA256) + PBKDF2")
    # Show `' [2] R — Statistical entropy / chi-sq / autocorrelation ...` on the screen.
    print("    [2] R       — Statistical entropy / chi-sq / autocorrelation analysis")
    # Show `' [3] C++ — Feistel cipher (CBC-16r) + CRC-32 + SHA-256 b...` on the screen.
    print("    [3] C++     — Feistel cipher (CBC-16r) + CRC-32 + SHA-256 binary check")
    # Show `' [4] Java — AES-256-GCM + PBKDF2 (310K iter) + HMAC-SHA2...` on the screen.
    print("    [4] Java    — AES-256-GCM + PBKDF2 (310K iter) + HMAC-SHA256 signing")
    # Show `'\n Data exchange format: XML (zero JSON)'` on the screen.
    print("\n  Data exchange format: XML (zero JSON)")
    # Show nothing on the screen.
    print()


# Only when this file is started directly (not imported by another file), run the steps below.
if __name__ == "__main__":
    # Call the function `main` (name meaning: main).
    main()
