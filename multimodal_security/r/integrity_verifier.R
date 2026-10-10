# ==============================================================================================
# FLOWERBOX-HEADER  |  LINE-COMMENTS-ADDED
# ==============================================================================================
#  1. Program Name               : multimodal_security  >  integrity_verifier.R
#  2. Program Description        : MULTIMODAL SECURITY — R MODULE Layer 2: Statistical
#                                  Integrity Verification + Entropy Analysis Format: XML
#                                  read/write via xml2 (no JSON). In simple words, this file
#                                  protects files: it packs, checks or verifies data so it
#                                  cannot be changed unnoticed. It is one small, separate piece
#                                  so each language/part can be tested on its own.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - No input.
#                                  - Data read from files.
#  7. Output                     : - Text printed to the console.
#                                  - Files written to disk.
#  8. Variables                  : - script_dir = normalizePath(dirname(sys.frame(1)$ofile),...
#                                  - base_dir = normalizePath(file.path(script_dir, ".."),...
#                                  - shared_dir = file.path(base_dir, "shared")
#                                  - manifest_in = file.path(shared_dir, "manifest_python.xml")
#                                  - report_out = file.path(shared_dir, "security_report_r.x...
#                                  - enc_file = file.path(shared_dir, "archive.mmsec")
#                                  - zip_file = file.path(shared_dir, "archive.zip")
#                                  - shannon_entropy = function(bytes_vec) {
#                                  - chi_squared_uniformity = function(bytes_vec, significance
#                                    = 0.05) {
#                                  - autocorr_check = function(bytes_vec, max_lag = 20) {
#  9. Algorithm / Logic          : - shannon_entropy(): shannon entropy.
#                                  - chi_squared_uniformity(): chi squared uniformity.
#                                  - autocorr_check(): autocorr check.
#                                  - runs_test(): runs test.
#                                  - analyse_file(): analyse file.
#                                  - read_python_manifest(): read python manifest.
#                                  - extract_tag(): extract tag.
#                                  - write_security_report(): write security report.
#                                  - main(): main.
# 10. Dependencies               : - R packages: tools, utils.
#                                  - R version 4.0 or newer.
# 11. Execution Instructions     : Rscript integrity_verifier.R
# 12. Assumptions and Limitations: - The required tools listed above are installed and on the
#                                    PATH.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : Uses tryCatch to handle problems without crashing.
# ==============================================================================================

# =============================================================
#  MULTIMODAL SECURITY — R MODULE
#  Layer 2: Statistical Integrity Verification + Entropy Analysis
#  Format: XML read/write via xml2 (no JSON)
# =============================================================

# ─────────────────────────────────────────────
#  LIBRARY LOADING (base R wherever possible)
# ─────────────────────────────────────────────
# Call `suppressPackageStartupMessages` (name meaning: suppress package startup messages) with `{`.
suppressPackageStartupMessages({
  # Load the R package `tools` so its functions can be used.
  library(tools)      # md5sum, file hashing
  # Load the R package `utils` so its functions can be used.
  library(utils)      # zip / unzip
# End of this block.
})

# Show `"=============================================================\n"` on the screen.
cat("=============================================================\n")
# Show `" MULTIMODAL SECURITY — R LAYER 2\n"` on the screen.
cat("  MULTIMODAL SECURITY — R LAYER 2\n")
# Show `" Statistical Integrity Verification & Entropy Analysis\n"` on the screen.
cat("  Statistical Integrity Verification & Entropy Analysis\n")
# Show `"=============================================================\n\n"` on the screen.
cat("=============================================================\n\n")


# ─────────────────────────────────────────────
#  PATHS
# ─────────────────────────────────────────────
# Store `normalizePath(dirname(sys.frame(1)$ofile), mustWork = FALSE)` in `script_dir`.
script_dir  <- normalizePath(dirname(sys.frame(1)$ofile), mustWork = FALSE)
# Store `normalizePath(file.path(script_dir, ".."), mustWork = FALSE)` in `base_dir`.
base_dir    <- normalizePath(file.path(script_dir, ".."), mustWork = FALSE)
# Store `file.path(base_dir, "shared")` in `shared_dir`.
shared_dir  <- file.path(base_dir, "shared")
# Store `file.path(shared_dir, "manifest_python.xml")` in `manifest_in`.
manifest_in <- file.path(shared_dir, "manifest_python.xml")
# Store `file.path(shared_dir, "security_report_r.xml")` in `report_out`.
report_out  <- file.path(shared_dir, "security_report_r.xml")
# Store `file.path(shared_dir, "archive.mmsec")` in `enc_file`.
enc_file    <- file.path(shared_dir, "archive.mmsec")
# Store `file.path(shared_dir, "archive.zip")` in `zip_file`.
zip_file    <- file.path(shared_dir, "archive.zip")


# ─────────────────────────────────────────────
#  UTILITY: SHANNON ENTROPY
# ─────────────────────────────────────────────
# Define a function named `shannon_entropy` (name meaning: shannon entropy). It takes: `bytes_vec`.
shannon_entropy <- function(bytes_vec) {
  # Compute byte-level Shannon entropy (bits per byte, max = 8)
  # Store `tabulate(bytes_vec + 1L, nbins = 256)` in `freq`.
  freq  <- tabulate(bytes_vec + 1L, nbins = 256)   # count each 0–255
  # Store `freq[freq > 0] / length(bytes_vec)` in `prob`.
  prob  <- freq[freq > 0] / length(bytes_vec)
  # Calculate `-sum(prob * log2(prob))` (in R, the last value worked out inside a function is what
  # it gives back).
  -sum(prob * log2(prob))
# End of the function shannon_entropy.
}


# ─────────────────────────────────────────────
#  UTILITY: CHI-SQUARED UNIFORMITY TEST
# ─────────────────────────────────────────────
# Define a function named `chi_squared_uniformity` (name meaning: chi squared uniformity). It takes:
# `bytes_vec, significance = 0.05`.
chi_squared_uniformity <- function(bytes_vec, significance = 0.05) {
  # A truly random (encrypted) byte stream should have ~uniform distribution
  # Store `tabulate(bytes_vec + 1L, nbins = 256)` in `observed`.
  observed <- tabulate(bytes_vec + 1L, nbins = 256)
  # Store `rep(length(bytes_vec) / 256, 256)` in `expected`.
  expected <- rep(length(bytes_vec) / 256, 256)
  # Store `sum((observed - expected)^2 / expected)` in `chi_stat`.
  chi_stat <- sum((observed - expected)^2 / expected)
  # Store `255L` in `df`.
  df       <- 255L
  # Store `pchisq(chi_stat, df = df, lower.tail = FALSE)` in `p_value`.
  p_value  <- pchisq(chi_stat, df = df, lower.tail = FALSE)
  # Build a named list (a bundle of labelled values) from the items below - if this is the last line
  # of a function, this list is its result.
  list(
    # Item `statistic` = `chi_stat`.
    statistic  = chi_stat,
    # Item `df` = `df`.
    df         = df,
    # Item `p_value` = `p_value`.
    p_value    = p_value,
    # Item `is_uniform` = `p_value > significance`.
    is_uniform = p_value > significance
  # End of the bracketed list / call started above.
  )
# End of the function chi_squared_uniformity.
}


# ─────────────────────────────────────────────
#  UTILITY: AUTOCORRELATION RANDOMNESS CHECK
# ─────────────────────────────────────────────
# Define a function named `autocorr_check` (name meaning: autocorr check). It takes: `bytes_vec,
# max_lag = 20`.
autocorr_check <- function(bytes_vec, max_lag = 20) {
  # Encrypted data should show no significant autocorrelation
  # Store `as.numeric(bytes_vec)` in `x`.
  x   <- as.numeric(bytes_vec)
  # Store `length(x)` in `n`.
  n   <- length(x)
  # Store `mean(x)` in `mn`.
  mn  <- mean(x)
  # Store `var(x)` in `var`.
  var <- var(x)
  # Check whether `var == 0) return(list(max_acf = NA, is_random = FALSE)`; if true, run what
  # follows.
  if (var == 0) return(list(max_acf = NA, is_random = FALSE))
  # Store `sapply(1:max_lag, function(lag) {` in `acf_vals`.
  acf_vals <- sapply(1:max_lag, function(lag) {
    # Call `sum` (name meaning: sum) with `(x[1:(n-lag)] - mn) * (x[(lag+1):n] - mn)) / ((n - lag)
    # *...`.
    sum((x[1:(n-lag)] - mn) * (x[(lag+1):n] - mn)) / ((n - lag) * var)
  # End of the block.
  })
  # Store `max(abs(acf_vals))` in `max_acf`.
  max_acf  <- max(abs(acf_vals))
  # Store `2 / sqrt(n)` in `threshold`.
  threshold <- 2 / sqrt(n)   # 95% confidence band
  # Build a named list (a bundle of labelled values) from the items below - if this is the last line
  # of a function, this list is its result.
  list(
    # Item `max_acf` = `max_acf`.
    max_acf   = max_acf,
    # Item `threshold` = `threshold`.
    threshold = threshold,
    # Item `is_random` = `max_acf < threshold`.
    is_random = max_acf < threshold,
    # Item `lags` = `seq_along(acf_vals)`.
    lags      = seq_along(acf_vals),
    # Item `acf_vals` = `acf_vals`.
    acf_vals  = acf_vals
  # End of the bracketed list / call started above.
  )
# End of the function autocorr_check.
}


# ─────────────────────────────────────────────
#  UTILITY: RUNS TEST (Wald-Wolfowitz)
# ─────────────────────────────────────────────
# Define a function named `runs_test` (name meaning: runs test). It takes: `bytes_vec`.
runs_test <- function(bytes_vec) {
  # Binary runs test: above/below median
  # Store `median(bytes_vec)` in `med`.
  med    <- median(bytes_vec)
  # Store `ifelse(bytes_vec >= med, 1L, 0L)` in `signs`.
  signs  <- ifelse(bytes_vec >= med, 1L, 0L)
  # Store `rle(signs)$lengths` in `runs`.
  runs   <- rle(signs)$lengths
  # Store `length(runs)` in `n_runs`.
  n_runs <- length(runs)
  # Store `sum(signs == 1L)` in `n1`.
  n1     <- sum(signs == 1L)
  # Store `sum(signs == 0L)` in `n2`.
  n2     <- sum(signs == 0L)
  # Store `n1 + n2` in `n_total`.
  n_total <- n1 + n2
  # Check whether `n1 == 0 || n2 == 0) return(list(z_score = NA, is_random = FALSE)`; if true, run
  # what follows.
  if (n1 == 0 || n2 == 0) return(list(z_score = NA, is_random = FALSE))
  # Store `(2 * n1 * n2 / n_total) + 1` in `mu_r`.
  mu_r   <- (2 * n1 * n2 / n_total) + 1
  # Store `(2 * n1 * n2 * (2 * n1 * n2 - n_total)) /` in `sigma2`.
  sigma2 <- (2 * n1 * n2 * (2 * n1 * n2 - n_total)) /
            # ...continues the instruction from the line above: `(n_total^2 * (n_total - 1))`.
            (n_total^2 * (n_total - 1))
  # Store `(n_runs - mu_r) / sqrt(sigma2)` in `z`.
  z      <- (n_runs - mu_r) / sqrt(sigma2)
  # Store `2 * pnorm(abs(z), lower.tail = FALSE)` in `p_val`.
  p_val  <- 2 * pnorm(abs(z), lower.tail = FALSE)
  # Build a named list (a bundle of labelled values) from the items below - if this is the last line
  # of a function, this list is its result.
  list(
    # Item `n_runs` = `n_runs`.
    n_runs   = n_runs,
    # Item `z_score` = `z`.
    z_score  = z,
    # Item `p_value` = `p_val`.
    p_value  = p_val,
    # Item `is_random` = `p_val > 0.05`.
    is_random = p_val > 0.05
  # End of the bracketed list / call started above.
  )
# End of the function runs_test.
}


# ─────────────────────────────────────────────
#  CORE: ANALYSE A BINARY FILE
# ─────────────────────────────────────────────
# Define a function named `analyse_file` (name meaning: analyse file). It takes: `filepath, label =
# "File"`.
analyse_file <- function(filepath, label = "File") {
  # Show `sprintf("\n[ANALYSE] %s: %s\n", label, basename(filepath))` on the screen.
  cat(sprintf("\n[ANALYSE] %s: %s\n", label, basename(filepath)))

  # Check whether `!file.exists(filepath)`; if true, run what follows.
  if (!file.exists(filepath)) {
    # Show `" ERROR: File not found!\n"` on the screen.
    cat("  ERROR: File not found!\n")
    # Send back `NULL` as the result.
    return(NULL)
  # End of the 'if' block.
  }

  # Store `readBin(filepath, what = "raw", n = file.info(filepath)$s...` in `raw_bytes`.
  raw_bytes <- readBin(filepath, what = "raw", n = file.info(filepath)$size)
  # Store `as.integer(raw_bytes)` in `byte_vals`.
  byte_vals <- as.integer(raw_bytes)
  # Store `length(byte_vals)` in `n_bytes`.
  n_bytes   <- length(byte_vals)
  # Show `sprintf(" Size: %d bytes\n", n_bytes)` on the screen.
  cat(sprintf("  Size: %d bytes\n", n_bytes))

  # --- Entropy ---
  # Store `shannon_entropy(byte_vals)` in `entropy`.
  entropy <- shannon_entropy(byte_vals)
  # Show `sprintf(" Shannon Entropy : %.4f bits/byte (max=8.0)\n", entropy)` on the screen.
  cat(sprintf("  Shannon Entropy  : %.4f bits/byte  (max=8.0)\n", entropy))

  # --- Chi-squared ---
  # Store `chi_squared_uniformity(byte_vals)` in `chi`.
  chi   <- chi_squared_uniformity(byte_vals)
  # Call `cat` (name meaning: cat) with `sprintf(" Chi² Statistic : %.2f (df=255, p=%.4f)
  # Uniform=...`.
  cat(sprintf("  Chi² Statistic   : %.2f  (df=255, p=%.4f) Uniform=%s\n",
              # ...continues the instruction from the line above: `chi$statistic, chi$p_value,`.
              chi$statistic, chi$p_value,
              # ...continues the instruction from the line above: `ifelse(chi$is_uniform, "YES ✓",
              # "NO ✗")))`.
              ifelse(chi$is_uniform, "YES ✓", "NO ✗")))

  # --- Autocorrelation ---
  # Store `min(n_bytes, 10000L)` in `sample_size`.
  sample_size <- min(n_bytes, 10000L)
  # Store `autocorr_check(byte_vals[seq_len(sample_size)])` in `acr`.
  acr   <- autocorr_check(byte_vals[seq_len(sample_size)])
  # Call `cat` (name meaning: cat) with `sprintf(" Max |ACF| (lag≤20): %.4f (threshold=%.4f)
  # Rando...`.
  cat(sprintf("  Max |ACF| (lag≤20): %.4f  (threshold=%.4f) Random=%s\n",
              # ...continues the instruction from the line above: `acr$max_acf, acr$threshold,`.
              acr$max_acf, acr$threshold,
              # ...continues the instruction from the line above: `ifelse(acr$is_random, "YES ✓",
              # "NO ✗")))`.
              ifelse(acr$is_random, "YES ✓", "NO ✗")))

  # --- Runs test ---
  # Store `runs_test(byte_vals[seq_len(sample_size)])` in `rt`.
  rt    <- runs_test(byte_vals[seq_len(sample_size)])
  # Call `cat` (name meaning: cat) with `sprintf(" Runs Test z-score: %.4f (p=%.4f) Random=%s\n",`.
  cat(sprintf("  Runs Test z-score: %.4f  (p=%.4f) Random=%s\n",
              # ...continues the instruction from the line above: `rt$z_score, rt$p_value,`.
              rt$z_score, rt$p_value,
              # ...continues the instruction from the line above: `ifelse(rt$is_random, "YES ✓", "NO
              # ✗")))`.
              ifelse(rt$is_random, "YES ✓", "NO ✗")))

  # --- MD5 (for cross-language check) ---
  # Store `tools::md5sum(filepath)` in `md5_val`.
  md5_val <- tools::md5sum(filepath)
  # Show `sprintf(" MD5 : %s\n", md5_val)` on the screen.
  cat(sprintf("  MD5              : %s\n", md5_val))

  # Build a named list (a bundle of labelled values) from the items below - if this is the last line
  # of a function, this list is its result.
  list(
    # Item `filepath` = `filepath`.
    filepath    = filepath,
    # Item `label` = `label`.
    label       = label,
    # Item `size_bytes` = `n_bytes`.
    size_bytes  = n_bytes,
    # Item `entropy` = `entropy`.
    entropy     = entropy,
    # Item `chi_stat` = `chi$statistic`.
    chi_stat    = chi$statistic,
    # Item `chi_p` = `chi$p_value`.
    chi_p       = chi$p_value,
    # Item `chi_uniform` = `chi$is_uniform`.
    chi_uniform = chi$is_uniform,
    # Item `acf_max` = `acr$max_acf`.
    acf_max     = acr$max_acf,
    # Item `acf_random` = `acr$is_random`.
    acf_random  = acr$is_random,
    # Item `runs_z` = `rt$z_score`.
    runs_z      = rt$z_score,
    # Item `runs_random` = `rt$is_random`.
    runs_random = rt$is_random,
    # Item `md5` = `md5_val[[1]]`.
    md5         = md5_val[[1]]
  # End of the bracketed list / call started above.
  )
# End of the function analyse_file.
}


# ─────────────────────────────────────────────
#  XML PARSING: READ PYTHON MANIFEST
# ─────────────────────────────────────────────
# Define a function named `read_python_manifest` (name meaning: read python manifest). It takes:
# `xml_path`.
read_python_manifest <- function(xml_path) {
  # Show `sprintf("\n[XML] Reading Python manifest: %s\n", basename(xml_path))` on the screen.
  cat(sprintf("\n[XML] Reading Python manifest: %s\n", basename(xml_path)))
  # Check whether `!file.exists(xml_path)`; if true, run what follows.
  if (!file.exists(xml_path)) {
    # Show `" WARNING: manifest not found — skipping\n"` on the screen.
    cat("  WARNING: manifest not found — skipping\n")
    # Send back `NULL` as the result.
    return(NULL)
  # End of the 'if' block.
  }

  # Store `xmlParse(xml_path)` in `doc`.
  doc   <- xmlParse(xml_path)   # base XML parser fallback
  # Use manual line-parse if xmlParse unavailable (pure base R):
  # Store `readLines(xml_path)` in `lines`.
  lines <- readLines(xml_path)

  # Define a function named `extract_tag` (name meaning: extract tag). It takes: `tag`.
  extract_tag <- function(tag) {
    # Store `sprintf("<%s>(.*?)</%s>", tag, tag)` in `pattern`.
    pattern <- sprintf("<%s>(.*?)</%s>", tag, tag)
    # Store `regmatches(lines, regexpr(pattern, lines, perl = TRUE))` in `hits`.
    hits    <- regmatches(lines, regexpr(pattern, lines, perl = TRUE))
    # Check whether `length(hits) == 0) return(NA_character_`; if true, run what follows.
    if (length(hits) == 0) return(NA_character_)
    # Call `sub` (name meaning: sub) with `sprintf(".*<%s>(.*?)</%s>.*", tag, tag), "\\1", hits[1],
    # ...`.
    sub(sprintf(".*<%s>(.*?)</%s>.*", tag, tag), "\\1", hits[1], perl = TRUE)
  # End of the function extract_tag.
  }

  # Build a named list (a bundle of labelled values) from the items below - if this is the last line
  # of a function, this list is its result.
  list(
    # Item `enc_sha256` = `extract_tag("EncryptedFileSHA256")`.
    enc_sha256   = extract_tag("EncryptedFileSHA256"),
    # Item `zip_sha256` = `extract_tag("OriginalZipSHA256")`.
    zip_sha256   = extract_tag("OriginalZipSHA256"),
    # Item `algorithm` = `extract_tag("Algorithm")`.
    algorithm    = extract_tag("Algorithm"),
    # Item `key_size` = `extract_tag("KeySizeBits")`.
    key_size     = extract_tag("KeySizeBits"),
    # Item `hmac_val` = `extract_tag("HMAC")`.
    hmac_val     = extract_tag("HMAC"),
    # Item `mac_header` = `extract_tag("MagicHeader")`.
    mac_header   = extract_tag("MagicHeader")
  # End of the bracketed list / call started above.
  )
# End of the function read_python_manifest.
}


# ─────────────────────────────────────────────
#  XML WRITING: SECURITY REPORT
# ─────────────────────────────────────────────
# Define a function named `write_security_report` (name meaning: write security report). It takes:
# `analyses, manifest, xml_path`.
write_security_report <- function(analyses, manifest, xml_path) {
  # Show `sprintf("\n[XML] Writing R security report → %s\n", basename(xml_pa...` on the screen.
  cat(sprintf("\n[XML] Writing R security report → %s\n", basename(xml_path)))

  # Store `format(Sys.time(), "%Y-%m-%dT%H:%M:%S")` in `ts`.
  ts   <- format(Sys.time(), "%Y-%m-%dT%H:%M:%S")
  # Store `c(` in `lines`.
  lines <- c(
    # ...continues the instruction from the line above: `'<?xml version="1.0" encoding="UTF-8"?>',`.
    '<?xml version="1.0" encoding="UTF-8"?>',
    # ...continues the instruction from the line above: `sprintf('<SecurityReport language="R"
    # layer="2" timestamp="%s">', ts),`.
    sprintf('<SecurityReport language="R" layer="2" timestamp="%s">', ts),
    # ...continues the instruction from the line above: `' <Description>Statistical integrity and
    # randomness analysis of enc...`.
    '  <Description>Statistical integrity and randomness analysis of encrypted ZIP</Description>',
    # ...continues the instruction from the line above: `'',`.
    '',
    # ...continues the instruction from the line above: `' <PythonManifest>'`.
    '  <PythonManifest>'
  # End of the bracketed list / call started above.
  )

  # Check whether `!is.null(manifest)`; if true, run what follows.
  if (!is.null(manifest)) {
    # Store `c(lines,` in `lines`.
    lines <- c(lines,
      # ...continues the instruction from the line above: `sprintf('
      # <EncryptedFileSHA256>%s</EncryptedFileSHA256>', manifest$...`.
      sprintf('    <EncryptedFileSHA256>%s</EncryptedFileSHA256>', manifest$enc_sha256 %||% ""),
      # ...continues the instruction from the line above: `sprintf('
      # <OriginalZipSHA256>%s</OriginalZipSHA256>', manifest$zip_...`.
      sprintf('    <OriginalZipSHA256>%s</OriginalZipSHA256>',   manifest$zip_sha256  %||% ""),
      # ...continues the instruction from the line above: `sprintf(' <Algorithm>%s</Algorithm>',
      # manifest$algorithm %||% ""),`.
      sprintf('    <Algorithm>%s</Algorithm>',                   manifest$algorithm   %||% ""),
      # ...continues the instruction from the line above: `sprintf(' <KeySizeBits>%s</KeySizeBits>',
      # manifest$key_size %||% ""),`.
      sprintf('    <KeySizeBits>%s</KeySizeBits>',               manifest$key_size    %||% ""),
      # ...continues the instruction from the line above: `sprintf(' <HMAC>%s</HMAC>',
      # manifest$hmac_val %||% "")`.
      sprintf('    <HMAC>%s</HMAC>',                             manifest$hmac_val    %||% "")
    # End of the bracketed list / call started above.
    )
  # End of the 'if' block.
  }

  # Store `c(lines, ' </PythonManifest>', '', ' <FileAnalyses>')` in `lines`.
  lines <- c(lines, '  </PythonManifest>', '', '  <FileAnalyses>')

  # Go through every item of `analyses`; each one is called `a`.
  for (a in analyses) {
    # Check whether `is.null(a)`; if true, run what follows.
    if (is.null(a)) next
    # Store `a$chi_uniform && a$acf_random && a$runs_random && a$entro...` in `overall_ok`.
    overall_ok <- a$chi_uniform && a$acf_random && a$runs_random && a$entropy > 7.0
    # Store `c(lines,` in `lines`.
    lines <- c(lines,
      # ...continues the instruction from the line above: `sprintf(' <FileAnalysis label="%s">',
      # a$label),`.
      sprintf('    <FileAnalysis label="%s">', a$label),
      # ...continues the instruction from the line above: `sprintf(' <Filepath>%s</Filepath>',
      # basename(a$filepath)),`.
      sprintf('      <Filepath>%s</Filepath>', basename(a$filepath)),
      # ...continues the instruction from the line above: `sprintf(' <SizeBytes>%d</SizeBytes>',
      # a$size_bytes),`.
      sprintf('      <SizeBytes>%d</SizeBytes>', a$size_bytes),
      # ...continues the instruction from the line above: `sprintf('
      # <ShannonEntropy>%.6f</ShannonEntropy>', a$entropy),`.
      sprintf('      <ShannonEntropy>%.6f</ShannonEntropy>', a$entropy),
      # ...continues the instruction from the line above: `sprintf('
      # <ChiSquaredStat>%.4f</ChiSquaredStat>', a$chi_stat),`.
      sprintf('      <ChiSquaredStat>%.4f</ChiSquaredStat>', a$chi_stat),
      # ...continues the instruction from the line above: `sprintf('
      # <ChiSquaredP>%.6f</ChiSquaredP>', a$chi_p),`.
      sprintf('      <ChiSquaredP>%.6f</ChiSquaredP>', a$chi_p),
      # ...continues the instruction from the line above: `sprintf(' <IsUniform>%s</IsUniform>',
      # tolower(a$chi_uniform)),`.
      sprintf('      <IsUniform>%s</IsUniform>', tolower(a$chi_uniform)),
      # ...continues the instruction from the line above: `sprintf(' <MaxACF>%.6f</MaxACF>',
      # a$acf_max),`.
      sprintf('      <MaxACF>%.6f</MaxACF>', a$acf_max),
      # ...continues the instruction from the line above: `sprintf(' <ACFRandom>%s</ACFRandom>',
      # tolower(a$acf_random)),`.
      sprintf('      <ACFRandom>%s</ACFRandom>', tolower(a$acf_random)),
      # ...continues the instruction from the line above: `sprintf(' <RunsZScore>%.4f</RunsZScore>',
      # a$runs_z),`.
      sprintf('      <RunsZScore>%.4f</RunsZScore>', a$runs_z),
      # ...continues the instruction from the line above: `sprintf(' <RunsRandom>%s</RunsRandom>',
      # tolower(a$runs_random)),`.
      sprintf('      <RunsRandom>%s</RunsRandom>', tolower(a$runs_random)),
      # ...continues the instruction from the line above: `sprintf(' <MD5>%s</MD5>', a$md5),`.
      sprintf('      <MD5>%s</MD5>', a$md5),
      # ...continues the instruction from the line above: `sprintf('
      # <OverallSecure>%s</OverallSecure>', tolower(overall_ok)),`.
      sprintf('      <OverallSecure>%s</OverallSecure>', tolower(overall_ok)),
      # ...continues the instruction from the line above: `' </FileAnalysis>'`.
      '    </FileAnalysis>'
    # End of the bracketed list / call started above.
    )
  # End of the loop.
  }

  # Store `c(lines,` in `lines`.
  lines <- c(lines,
    # ...continues the instruction from the line above: `' </FileAnalyses>',`.
    '  </FileAnalyses>',
    # ...continues the instruction from the line above: `'',`.
    '',
    # ...continues the instruction from the line above: `' <SecurityTests>',`.
    '  <SecurityTests>',
    # ...continues the instruction from the line above: `' <Test name="ShannonEntropy" threshold="gt
    # 7.0 bits/byte" />',`.
    '    <Test name="ShannonEntropy"  threshold="gt 7.0 bits/byte" />',
    # ...continues the instruction from the line above: `' <Test name="ChiSquared" threshold="p gt
    # 0.05 (uniform dist)" />',`.
    '    <Test name="ChiSquared"      threshold="p gt 0.05 (uniform dist)" />',
    # ...continues the instruction from the line above: `' <Test name="Autocorrelation"
    # threshold="max ACF within 95pct CI" ...`.
    '    <Test name="Autocorrelation" threshold="max ACF within 95pct CI" />',
    # ...continues the instruction from the line above: `' <Test name="RunsTest" threshold="p gt
    # 0.05 (Wald-Wolfowitz)" />',`.
    '    <Test name="RunsTest"        threshold="p gt 0.05 (Wald-Wolfowitz)" />',
    # ...continues the instruction from the line above: `' </SecurityTests>',`.
    '  </SecurityTests>',
    # ...continues the instruction from the line above: `'</SecurityReport>'`.
    '</SecurityReport>'
  # End of the bracketed list / call started above.
  )

  # Show `lines, con = xml_path, useBytes = FALSE` on the screen.
  writeLines(lines, con = xml_path, useBytes = FALSE)
  # Show `" [XML] Report written.\n"` on the screen.
  cat("  [XML] Report written.\n")
# End of the function write_security_report.
}

# Helper: null-coalescing operator
# Run the instruction ``%||%` <- function(x, y) if (is.na(x) || is.null(x)) y else x`.
`%||%` <- function(x, y) if (is.na(x) || is.null(x)) y else x


# ─────────────────────────────────────────────
#  MAIN
# ─────────────────────────────────────────────
# Define a function named `main` (name meaning: main). It takes: `no inputs`.
main <- function() {
  # Show `"[STEP 1] Analysing encrypted archive …\n"` on the screen.
  cat("[STEP 1] Analysing encrypted archive …\n")
  # Store `analyse_file(enc_file, label = "EncryptedArchive")` in `enc_analysis`.
  enc_analysis <- analyse_file(enc_file, label = "EncryptedArchive")

  # Show `"\n[STEP 2] Analysing original ZIP (if present) …\n"` on the screen.
  cat("\n[STEP 2] Analysing original ZIP (if present) …\n")
  # Store `analyse_file(zip_file, label = "OriginalZIP")` in `zip_analysis`.
  zip_analysis <- analyse_file(zip_file, label = "OriginalZIP")

  # Show `"\n[STEP 3] Reading Python XML manifest …\n"` on the screen.
  cat("\n[STEP 3] Reading Python XML manifest …\n")
  # Try the following steps; if an error happens, run the error handler instead of crashing.
  manifest <- tryCatch(
    # ...continues the instruction from the line above: `read_python_manifest(manifest_in),`.
    read_python_manifest(manifest_in),
    # Item `error` = `function(e) { cat(" WARN:", conditionMessage(e), "\n"); N...`.
    error = function(e) { cat("  WARN:", conditionMessage(e), "\n"); NULL }
  # End of the bracketed list / call started above.
  )

  # Show `"\n[STEP 4] Writing R security report …\n"` on the screen.
  cat("\n[STEP 4] Writing R security report …\n")
  # Call `write_security_report` (name meaning: write security report).
  write_security_report(
    # Item `analyses` = `list(enc_analysis, zip_analysis)`.
    analyses = list(enc_analysis, zip_analysis),
    # Item `manifest` = `manifest`.
    manifest = manifest,
    # Item `xml_path` = `report_out`.
    xml_path = report_out
  # End of the bracketed list / call started above.
  )

  # Show `"\n[STEP 5] Summary\n"` on the screen.
  cat("\n[STEP 5] Summary\n")
  # Show `"─────────────────────────────────────────────\n"` on the screen.
  cat("─────────────────────────────────────────────\n")
  # Check whether `!is.null(enc_analysis)`; if true, run what follows.
  if (!is.null(enc_analysis)) {
    # Show `sprintf(" Encrypted file entropy : %.4f / 8.0\n", enc_analysis$entr...` on the screen.
    cat(sprintf("  Encrypted file entropy : %.4f / 8.0\n", enc_analysis$entropy))
    # Store `enc_analysis$entropy > 7.5` in `enc_secure`.
    enc_secure <- enc_analysis$entropy > 7.5
    # Call `cat` (name meaning: cat) with `sprintf(" Encryption quality : %s\n",`.
    cat(sprintf("  Encryption quality     : %s\n",
                # ...continues the instruction from the line above: `ifelse(enc_secure, "HIGH ✓
                # (entropy > 7.5)", "LOW ✗")))`.
                ifelse(enc_secure, "HIGH ✓ (entropy > 7.5)", "LOW ✗")))
  # End of the 'if' block.
  }
  # Show `"─────────────────────────────────────────────\n"` on the screen.
  cat("─────────────────────────────────────────────\n")
  # Show `"\n[DONE] R layer complete.\n"` on the screen.
  cat("\n[DONE] R layer complete.\n")
# End of the error handler.
}

# Call `main` (name meaning: main).
main()
