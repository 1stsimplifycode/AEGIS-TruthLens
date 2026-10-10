# LINE-COMMENTS-ADDED
# ==============================================================================================
# FLOWERBOX-HEADER
# ==============================================================================================
#  1. Program Name               : multimodal_security  >  secure_zip_creator.py
#  2. Program Description        : MULTIMODAL SECURITY - PYTHON MODULE Layer 1: ZIP Creation +
#                                  AES-256 Encryption + SHA-256 Checksum Format: XML metadata
#                                  (no JSON). In simple words, this file protects files: it
#                                  packs, checks or verifies data so it cannot be changed
#                                  unnoticed. It exists so this piece of work stays in its own
#                                  small, easy-to-test file.
#  3. Author Name                : Adishree Gupta and Akshat
#  4. Date Created               : 2026-10-10
#  5. Version Number             : 1.0.0
#  6. Input                      : - Data read from files on disk.
#                                  - xor_bytes() receives: data, key.
#                                  - derive_key() receives: passphrase, salt.
#                                  - sha256_file() receives: filepath.
#                                  - sha256_bytes() receives: data.
#  7. Output                     : - Messages printed to the screen or written to the log.
#                                  - Files written to disk.
#                                  - Values returned by its functions to the code that calls
#                                    them.
#  8. Variables                  : - BLOCK_SIZE = 16
#                                  - KEY_SIZE = 32
#                                  - SALT_SIZE = 32
#                                  - ITERATIONS = 200000
#                                  - HMAC_ALGO = 'sha256'
#                                  - VERSION = '1.0.0'
#                                  - MAGIC_HEADER = b'MMSEC\x00'
#  9. Algorithm / Logic          : - xor_bytes(): XOR cipher applied over repeating key (no
#                                    external libs).
#                                  - derive_key(): PBKDF2-HMAC-SHA256 key derivation (stdlib
#                                    only). Returns a 32-byte key.
#                                  - sha256_file(): Compute SHA-256 hex digest of a file.
#                                  - sha256_bytes(): sha256 bytes.
#                                  - compute_hmac(): HMAC-SHA256 for integrity verification.
#                                  - pkcs7_pad(): PKCS#7 padding.
#                                  - pkcs7_unpad(): Remove PKCS#7 padding.
#                                  - stream_encrypt(): CTR-like stream cipher using HMAC-SHA256
#                                    as the keystream generator. Pure Pyt.
#                                  - ... plus 6 more helper functions.
#                                  - When run directly, the code under 'if __name__ ==
#                                    "__main__"' starts the work.
# 10. Dependencies               : Built into Python (no install needed): os, zipfile, hashlib,
#                                  hmac, secrets, struct, time, xml, pathlib.
# 11. Execution Instructions     : - Open a terminal in the main folder and run: python
#                                    multimodal_security/python/secure_zip_creator.py
#                                  - Python 3.9 or newer is required.
# 12. Assumptions and Limitations: - The required libraries listed above are installed.
#                                  - Limitation: results are only as good as the data given to
#                                    it.
# 13. Error Handling             : Deliberately raises these errors when something is wrong:
#                                  ValueError.
# ==============================================================================================

# A description (docstring) explaining what this part of the code does - Python stores it but does
# not run it.
"""
=============================================================
  MULTIMODAL SECURITY - PYTHON MODULE
  Layer 1: ZIP Creation + AES-256 Encryption + SHA-256 Checksum
  Format: XML metadata (no JSON)
=============================================================
"""

# Load os, Python's built-in tools for files, folders and system settings.
import os
# Load zipfile, Python's built-in tool for ZIP archives.
import zipfile
# Load hashlib, Python's built-in tools for making fingerprints (hashes) of data.
import hashlib
# Load hmac, Python's built-in tool for signing data with a secret key.
import hmac
# Load secrets, Python's built-in tool for secure random values.
import secrets
# Load struct, Python's built-in tool for packing data into bytes.
import struct
# Load time, Python's built-in clock and timing tools.
import time
# Load xml, Python's built-in tools for XML documents, and call it `ET` for short.
import xml.etree.ElementTree as ET
# From `xml.dom` (part of xml, Python's built-in tools for XML documents), bring in `minidom` so
# they can be used in this file.
from xml.dom import minidom
# From pathlib, Python's built-in tool for handling file paths, bring in `Path` so they can be used
# in this file.
from pathlib import Path


# ─────────────────────────────────────────────
#  CONSTANTS & CONFIG
# ─────────────────────────────────────────────
# Store the number `16` in the fixed setting (constant) `BLOCK_SIZE`.
BLOCK_SIZE     = 16        # AES block size in bytes
# Store the number `32` in the fixed setting (constant) `KEY_SIZE`.
KEY_SIZE       = 32        # AES-256 key size
# Store the number `32` in the fixed setting (constant) `SALT_SIZE`.
SALT_SIZE      = 32        # Salt for PBKDF2
# Store the number `200000` in the fixed setting (constant) `ITERATIONS`.
ITERATIONS     = 200_000   # PBKDF2 iterations
# Store the text `'sha256'` in the fixed setting (constant) `HMAC_ALGO`.
HMAC_ALGO      = "sha256"
# Store the text `'1.0.0'` in the fixed setting (constant) `VERSION`.
VERSION        = "1.0.0"
# Store the bytes `b'MMSEC\x00'` in the fixed setting (constant) `MAGIC_HEADER`.
MAGIC_HEADER   = b"MMSEC\x00"  # 6-byte magic identifier


# ─────────────────────────────────────────────
#  UTILITY FUNCTIONS
# ─────────────────────────────────────────────

# Define a function (a reusable set of steps) named `xor_bytes` - purpose: XOR cipher applied over
# repeating key (no external libs). It takes: data, key, and gives back `bytes`.
def xor_bytes(data: bytes, key: bytes) -> bytes:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """XOR cipher applied over repeating key (no external libs)."""
    # Store the result of counting how many items are in `key` in the variable `key_len`.
    key_len = len(key)
    # Send back the result of the function `bytes` (name meaning: bytes) given `(b ^ key[i %
    # key_len] for i, b in enumerate(data))` as the result of this function.
    return bytes(b ^ key[i % key_len] for i, b in enumerate(data))


# Define a function (a reusable set of steps) named `derive_key` - purpose: PBKDF2-HMAC-SHA256 key
# derivation (stdlib only). It takes: passphrase, salt, and gives back `bytes`.
def derive_key(passphrase: str, salt: bytes) -> bytes:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    PBKDF2-HMAC-SHA256 key derivation (stdlib only).
    Returns a 32-byte key.
    """
    # Store the result of calling `hashlib.pbkdf2_hmac` (name meaning: pbkdf2 hmac) with
    # `hash_name=HMAC_ALGO, password=passphrase.encode('utf-8'),...` in the variable `dk` (this
    # instruction continues over the next 6 lines).
    dk = hashlib.pbkdf2_hmac(
        hash_name=HMAC_ALGO,
        password=passphrase.encode("utf-8"),
        salt=salt,
        iterations=ITERATIONS,
        dklen=KEY_SIZE,
    )
    # Send back the value of `dk` as the result of this function.
    return dk


# Define a function (a reusable set of steps) named `sha256_file` - purpose: Compute SHA-256 hex
# digest of a file. It takes: filepath, and gives back `str`.
def sha256_file(filepath: str) -> str:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Compute SHA-256 hex digest of a file."""
    # Store a SHA-256 fingerprint calculator for nothing in the variable `h`.
    h = hashlib.sha256()
    # Use the result of opening the file `filepath, 'rb'` (called `f`) for the indented steps below;
    # it is closed/cleaned up automatically afterwards.
    with open(filepath, "rb") as f:
        # Go through an iterator over `lambda: f.read(65536), b''` one item at a time; each item is
        # called `chunk`.
        for chunk in iter(lambda: f.read(65536), b""):
            # Update `h` with `chunk`.
            h.update(chunk)
    # Send back the fingerprint of `h` as hexadecimal text as the result of this function.
    return h.hexdigest()


# Define a function (a reusable set of steps) named `sha256_bytes` (name meaning: sha256 bytes). It
# takes: data, and gives back `str`.
def sha256_bytes(data: bytes) -> str:
    # Send back the fingerprint of `hashlib.sha256(data)` as hexadecimal text as the result of this
    # function.
    return hashlib.sha256(data).hexdigest()


# Define a function (a reusable set of steps) named `compute_hmac` - purpose: HMAC-SHA256 for
# integrity verification. It takes: key, data, and gives back `str`.
def compute_hmac(key: bytes, data: bytes) -> str:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """HMAC-SHA256 for integrity verification."""
    # Store the result of calling `hmac.new` (name meaning: new) with `key, data,
    # digestmod=hashlib.sha256` in the variable `mac`.
    mac = hmac.new(key, data, digestmod=hashlib.sha256)
    # Send back the fingerprint of `mac` as hexadecimal text as the result of this function.
    return mac.hexdigest()


# Define a function (a reusable set of steps) named `pkcs7_pad` - purpose: PKCS#7 padding. It takes:
# data, block_size (default BLOCK_SIZE), and gives back `bytes`.
def pkcs7_pad(data: bytes, block_size: int = BLOCK_SIZE) -> bytes:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """PKCS#7 padding."""
    # Store `block_size` minus `len(data) % block_size` in the variable `pad_len`.
    pad_len = block_size - (len(data) % block_size)
    # Send back `data` plus `bytes([pad_len] * pad_len)` as the result of this function.
    return data + bytes([pad_len] * pad_len)


# Define a function (a reusable set of steps) named `pkcs7_unpad` - purpose: Remove PKCS#7 padding.
# It takes: data, and gives back `bytes`.
def pkcs7_unpad(data: bytes) -> bytes:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Remove PKCS#7 padding."""
    # Check whether `data` is empty / false / missing; if so, do the indented steps below.
    if not data:
        # Stop here and report an error of type `ValueError` with the message `'Empty data for
        # unpadding'`.
        raise ValueError("Empty data for unpadding")
    # Store the item `-1` from `data` in the variable `pad_len`.
    pad_len = data[-1]
    # Check whether `pad_len` equals `0` or `pad_len` is greater than `BLOCK_SIZE`; if so, do the
    # indented steps below.
    if pad_len == 0 or pad_len > BLOCK_SIZE:
        # Stop here and report an error of type `ValueError` with the message `f'Invalid padding
        # length: {pad_len}'`.
        raise ValueError(f"Invalid padding length: {pad_len}")
    # Send back a slice (part) of `data`: `:-pad_len` as the result of this function.
    return data[:-pad_len]


# ─────────────────────────────────────────────
#  XOR-STREAM ENCRYPTION (stdlib-only AES sim)
# ─────────────────────────────────────────────

# Define a function (a reusable set of steps) named `stream_encrypt` - purpose: CTR-like stream
# cipher using HMAC-SHA256 as the keystream generator. It takes: data, key, iv, and gives back
# `bytes`.
def stream_encrypt(data: bytes, key: bytes, iv: bytes) -> bytes:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    CTR-like stream cipher using HMAC-SHA256 as the keystream generator.
    Pure Python, no external dependencies.
    """
    # Store the result of the function `pkcs7_pad` (name meaning: pkcs7 pad) given `data` in the
    # variable `padded`.
    padded   = pkcs7_pad(data)
    # Store a new list made by taking each `i` in `range(0, len(padded), BLOCK_SIZE)` and computing
    # `padded[i:i + BLOCK_SIZE]` in the variable `blocks`.
    blocks   = [padded[i:i+BLOCK_SIZE] for i in range(0, len(padded), BLOCK_SIZE)]
    # Store the bytes `b''` in the variable `ciphertext`.
    ciphertext = b""

    # Go through `blocks` one item at a time, keeping its position: `(idx, block)`.
    for idx, block in enumerate(blocks):
        # Generate keystream block from key + iv + counter
        # Store the result of calling `struct.pack` (name meaning: pack) with `'>Q', idx` in the
        # variable `counter_bytes`.
        counter_bytes = struct.pack(">Q", idx)
        # Store `key + iv` plus `counter_bytes` in the variable `keystream_input`.
        keystream_input = key + iv + counter_bytes
        # Store a slice (part) of `hashlib.sha256(keystream_input).digest()`: `:BLOCK_SIZE` in the
        # variable `keystream`.
        keystream = hashlib.sha256(keystream_input).digest()[:BLOCK_SIZE]
        # Increase `ciphertext` by `xor_bytes(block, keystream)`.
        ciphertext += xor_bytes(block, keystream)

    # Send back the value of `ciphertext` as the result of this function.
    return ciphertext


# Define a function (a reusable set of steps) named `stream_decrypt` - purpose: Inverse of
# stream_encrypt (CTR is symmetric). It takes: ciphertext, key, iv, and gives back `bytes`.
def stream_decrypt(ciphertext: bytes, key: bytes, iv: bytes) -> bytes:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """Inverse of stream_encrypt (CTR is symmetric)."""
    # Store a new list made by taking each `i` in `range(0, len(ciphertext), BLOCK_...` and
    # computing `ciphertext[i:i + BLOCK_SIZE]` in the variable `blocks`.
    blocks   = [ciphertext[i:i+BLOCK_SIZE] for i in range(0, len(ciphertext), BLOCK_SIZE)]
    # Store the bytes `b''` in the variable `plaintext`.
    plaintext = b""

    # Go through `blocks` one item at a time, keeping its position: `(idx, block)`.
    for idx, block in enumerate(blocks):
        # Store the result of calling `struct.pack` (name meaning: pack) with `'>Q', idx` in the
        # variable `counter_bytes`.
        counter_bytes = struct.pack(">Q", idx)
        # Store `key + iv` plus `counter_bytes` in the variable `keystream_input`.
        keystream_input = key + iv + counter_bytes
        # Store a slice (part) of `hashlib.sha256(keystream_input).digest()`: `:BLOCK_SIZE` in the
        # variable `keystream`.
        keystream = hashlib.sha256(keystream_input).digest()[:BLOCK_SIZE]
        # Increase `plaintext` by `xor_bytes(block, keystream)`.
        plaintext += xor_bytes(block, keystream)

    # Send back the result of the function `pkcs7_unpad` (name meaning: pkcs7 unpad) given
    # `plaintext` as the result of this function.
    return pkcs7_unpad(plaintext)


# ─────────────────────────────────────────────
#  ZIP CREATION
# ─────────────────────────────────────────────

# Define a function (a reusable set of steps) named `create_secure_zip` - purpose: Create a standard
# ZIP archive from a list of file paths. It takes: source_files, output_zip, and gives back `dict`.
def create_secure_zip(source_files: list, output_zip: str) -> dict:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    Create a standard ZIP archive from a list of file paths.
    Returns metadata dict (file names + their SHA-256 digests).
    """
    # Store an empty dictionary (lookup table) in the variable `file_hashes`.
    file_hashes = {}

    # Use the result of calling `zipfile.ZipFile` (name meaning: zip file) with `output_zip, 'w',
    # compression=zipfile.ZIP_DEFLATED` (called `zf`) for the indented steps below; it is
    # closed/cleaned up automatically afterwards.
    with zipfile.ZipFile(output_zip, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        # Go through the value of `source_files` one item at a time; each item is called `fpath`.
        for fpath in source_files:
            # Store a file-path object for `fpath` in the variable `p`.
            p = Path(fpath)
            # Check whether `p` exists; if so, do the indented steps below.
            if p.exists():
                # Write `fpath, p.name` into `zf`.
                zf.write(fpath, p.name)
                # Store the result of the function `sha256_file` (name meaning: sha256 file) given
                # `fpath` in the entry `p.name` of `file_hashes`.
                file_hashes[p.name] = sha256_file(fpath)
                # Show `f' [ZIP] Added: {p.name} SHA256={file_hashes[p.name][:16]}…'` on the screen.
                print(f"  [ZIP] Added: {p.name}  SHA256={file_hashes[p.name][:16]}…")
            # Otherwise (when the check above was not true), do the following steps.
            else:
                # Show `f' [ZIP] SKIP (not found): {fpath}'` on the screen.
                print(f"  [ZIP] SKIP (not found): {fpath}")

    # Store the result of the function `sha256_file` (name meaning: sha256 file) given `output_zip`
    # in the variable `zip_hash`.
    zip_hash = sha256_file(output_zip)
    # Show `f' [ZIP] Archive SHA-256: {zip_hash}'` on the screen.
    print(f"  [ZIP] Archive SHA-256: {zip_hash}")
    # Send back a dictionary (lookup table) with 2 entries as the result of this function.
    return {"file_hashes": file_hashes, "zip_sha256": zip_hash}


# ─────────────────────────────────────────────
#  ENCRYPTION WRAPPER
# ─────────────────────────────────────────────

# Define a function (a reusable set of steps) named `encrypt_zip` - purpose: Read ZIP, encrypt its
# bytes, write encrypted blob. It takes: zip_path, passphrase, encrypted_path, and gives back
# `dict`.
def encrypt_zip(zip_path: str, passphrase: str, encrypted_path: str) -> dict:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    Read ZIP, encrypt its bytes, write encrypted blob.
    Binary format:
      [MAGIC 6B][SALT 32B][IV 16B][HMAC 32B][LEN 8B][CIPHERTEXT …]
    """
    # Store the result of calling `secrets.token_bytes` (name meaning: token bytes) with `SALT_SIZE`
    # in the variable `salt`.
    salt = secrets.token_bytes(SALT_SIZE)
    # Store the result of calling `secrets.token_bytes` (name meaning: token bytes) with
    # `BLOCK_SIZE` in the variable `iv`.
    iv   = secrets.token_bytes(BLOCK_SIZE)
    # Store the result of the function `derive_key` (name meaning: derive key) given `passphrase,
    # salt` in the variable `key`.
    key  = derive_key(passphrase, salt)

    # Use the result of opening the file `zip_path, 'rb'` (called `f`) for the indented steps below;
    # it is closed/cleaned up automatically afterwards.
    with open(zip_path, "rb") as f:
        # Store the result of reading the contents of `f` in the variable `plaintext`.
        plaintext = f.read()

    # Store the result of the function `stream_encrypt` (name meaning: stream encrypt) given
    # `plaintext, key, iv` in the variable `ciphertext`.
    ciphertext = stream_encrypt(plaintext, key, iv)
    # Store the fingerprint of `hmac.new(key, ciphertext, digestmod=h...` as bytes in the variable
    # `mac`.
    mac        = hmac.new(key, ciphertext, digestmod=hashlib.sha256).digest()
    # Store the result of calling `struct.pack` (name meaning: pack) with `'>Q', len(ciphertext)` in
    # the variable `ct_len`.
    ct_len     = struct.pack(">Q", len(ciphertext))

    # Use the result of opening the file `encrypted_path, 'wb'` (called `f`) for the indented steps
    # below; it is closed/cleaned up automatically afterwards.
    with open(encrypted_path, "wb") as f:
        # Write `MAGIC_HEADER` into `f`.
        f.write(MAGIC_HEADER)
        # Write `salt` into `f`.
        f.write(salt)
        # Write `iv` into `f`.
        f.write(iv)
        # Write `mac` into `f`.
        f.write(mac)
        # Write `ct_len` into `f`.
        f.write(ct_len)
        # Write `ciphertext` into `f`.
        f.write(ciphertext)

    # Store the result of the function `sha256_file` (name meaning: sha256 file) given
    # `encrypted_path` in the variable `enc_hash`.
    enc_hash = sha256_file(encrypted_path)
    # Show `f' [ENC] Encrypted → {encrypted_path}'` on the screen.
    print(f"  [ENC] Encrypted → {encrypted_path}")
    # Show `f' [ENC] SHA-256: {enc_hash}'` on the screen.
    print(f"  [ENC] SHA-256:    {enc_hash}")

    # Send back a dictionary (lookup table) with 5 entries as the result of this function (this
    # instruction continues over the next 6 lines).
    return {
        "salt_hex":  salt.hex(),
        "iv_hex":    iv.hex(),
        "mac_hex":   mac.hex(),
        "enc_sha256": enc_hash,
        "cipher_len": len(ciphertext),
    }


# Define a function (a reusable set of steps) named `decrypt_zip` - purpose: Decrypt an encrypted
# ZIP blob back to a standard ZIP file. It takes: encrypted_path, passphrase, output_zip, and gives
# back `bool`.
def decrypt_zip(encrypted_path: str, passphrase: str, output_zip: str) -> bool:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    Decrypt an encrypted ZIP blob back to a standard ZIP file.
    Returns True on success, False on HMAC failure.
    """
    # Use the result of opening the file `encrypted_path, 'rb'` (called `f`) for the indented steps
    # below; it is closed/cleaned up automatically afterwards.
    with open(encrypted_path, "rb") as f:
        # Store the result of reading the contents of `f` in the variable `magic`.
        magic      = f.read(6)
        # Check whether `magic` is not equal to `MAGIC_HEADER`; if so, do the indented steps below.
        if magic != MAGIC_HEADER:
            # Stop here and report an error of type `ValueError` with the message `'Invalid magic
            # header — not a MMSEC file'`.
            raise ValueError("Invalid magic header — not a MMSEC file")
        # Store the result of reading the contents of `f` in the variable `salt`.
        salt       = f.read(SALT_SIZE)
        # Store the result of reading the contents of `f` in the variable `iv`.
        iv         = f.read(BLOCK_SIZE)
        # Store the result of reading the contents of `f` in the variable `stored_mac`.
        stored_mac = f.read(32)
        # Store the item `0` from `struct.unpack('>Q', f.read(8))` in the variable `ct_len`.
        ct_len     = struct.unpack(">Q", f.read(8))[0]
        # Store the result of reading the contents of `f` in the variable `ciphertext`.
        ciphertext = f.read(ct_len)

    # Store the result of the function `derive_key` (name meaning: derive key) given `passphrase,
    # salt` in the variable `key`.
    key = derive_key(passphrase, salt)

    # Verify HMAC first (Encrypt-then-MAC)
    # Store the fingerprint of `hmac.new(key, ciphertext, digestmod=h...` as bytes in the variable
    # `calc_mac`.
    calc_mac = hmac.new(key, ciphertext, digestmod=hashlib.sha256).digest()
    # Check whether `hmac.compare_digest(stored_mac, calc_mac)` gives a false / empty result (it
    # failed or found nothing); if so, do the indented steps below.
    if not hmac.compare_digest(stored_mac, calc_mac):
        # Show `' [DEC] ✗ HMAC verification FAILED — file tampered or wro...` on the screen.
        print("  [DEC] ✗ HMAC verification FAILED — file tampered or wrong passphrase!")
        # Send back False (no) as the result of this function.
        return False

    # Store the result of the function `stream_decrypt` (name meaning: stream decrypt) given
    # `ciphertext, key, iv` in the variable `plaintext`.
    plaintext = stream_decrypt(ciphertext, key, iv)

    # Use the result of opening the file `output_zip, 'wb'` (called `f`) for the indented steps
    # below; it is closed/cleaned up automatically afterwards.
    with open(output_zip, "wb") as f:
        # Write `plaintext` into `f`.
        f.write(plaintext)

    # Show `f' [DEC] ✓ Decrypted → {output_zip}'` on the screen.
    print(f"  [DEC] ✓ Decrypted → {output_zip}")
    # Send back True (yes) as the result of this function.
    return True


# ─────────────────────────────────────────────
#  XML METADATA (no JSON)
# ─────────────────────────────────────────────

# Define a function (a reusable set of steps) named `write_xml_manifest` - purpose: Write security
# manifest as a well-formed XML file. It takes: metadata, xml_path, and gives back `None`.
def write_xml_manifest(metadata: dict, xml_path: str) -> None:
    # A description (docstring) explaining what this part of the code does - Python stores it but
    # does not run it.
    """
    Write security manifest as a well-formed XML file.
    Structure mirrors what JSON would provide — without JSON.
    """
    # Store the result of calling `ET.Element` (name meaning: element) with
    # `'MultimodalSecurityManifest'` in the variable `root`.
    root = ET.Element("MultimodalSecurityManifest")
    # Switch on `root`.
    root.set("version", VERSION)
    # Switch on `root`.
    root.set("timestamp", str(int(time.time())))

    # Header section
    # Store the result of calling `ET.SubElement` (name meaning: sub element) with `root, 'Header'`
    # in the variable `header`.
    header = ET.SubElement(root, "Header")
    # Store the text `'Python'` in the variable `ET.SubElement(header, 'Language').text`.
    ET.SubElement(header, "Language").text    = "Python"
    # Store the text `'1'` in the variable `ET.SubElement(header, 'Layer').text`.
    ET.SubElement(header, "Layer").text       = "1"
    # Store the text `'ZIP creation and AES-like stream encryption'` in the variable
    # `ET.SubElement(header, 'Description').text`.
    ET.SubElement(header, "Description").text = "ZIP creation and AES-like stream encryption"
    # Store a piece of text built from values: `f'PBKDF2-HMAC-SHA256 iterations={ITERATIONS}'` in
    # the variable `ET.SubElement(header, 'PassphraseKDF').text`.
    ET.SubElement(header, "PassphraseKDF").text = f"PBKDF2-HMAC-SHA256 iterations={ITERATIONS}"

    # Encryption section
    # Store the result of calling `ET.SubElement` (name meaning: sub element) with `root,
    # 'Encryption'` in the variable `enc`.
    enc = ET.SubElement(root, "Encryption")
    # Store the text `'CTR-Stream-HMACSHA256'` in the variable `ET.SubElement(enc,
    # 'Algorithm').text`.
    ET.SubElement(enc, "Algorithm").text = "CTR-Stream-HMACSHA256"
    # Store `KEY_SIZE * 8` converted to text in the variable `ET.SubElement(enc,
    # 'KeySizeBits').text`.
    ET.SubElement(enc, "KeySizeBits").text = str(KEY_SIZE * 8)
    # Store `BLOCK_SIZE` converted to text in the variable `ET.SubElement(enc,
    # 'BlockSizeBytes').text`.
    ET.SubElement(enc, "BlockSizeBytes").text = str(BLOCK_SIZE)
    # Store the result of looking up `'salt_hex', ''` in `metadata` (without crashing if it is
    # missing) in the variable `ET.SubElement(enc, 'Salt').text`.
    ET.SubElement(enc, "Salt").text = metadata.get("salt_hex", "")
    # Store the result of looking up `'iv_hex', ''` in `metadata` (without crashing if it is
    # missing) in the variable `ET.SubElement(enc, 'IV').text`.
    ET.SubElement(enc, "IV").text   = metadata.get("iv_hex", "")
    # Store the result of looking up `'mac_hex', ''` in `metadata` (without crashing if it is
    # missing) in the variable `ET.SubElement(enc, 'HMAC').text`.
    ET.SubElement(enc, "HMAC").text = metadata.get("mac_hex", "")
    # Store `metadata.get('cipher_len', 0)` converted to text in the variable `ET.SubElement(enc,
    # 'CiphertextLength').text`.
    ET.SubElement(enc, "CiphertextLength").text = str(metadata.get("cipher_len", 0))

    # Hashes section
    # Store the result of calling `ET.SubElement` (name meaning: sub element) with `root, 'Hashes'`
    # in the variable `hashes`.
    hashes = ET.SubElement(root, "Hashes")
    # Store the result of looking up `'enc_sha256', ''` in `metadata` (without crashing if it is
    # missing) in the variable `ET.SubElement(hashes, 'EncryptedFileSHA256').text`.
    ET.SubElement(hashes, "EncryptedFileSHA256").text = metadata.get("enc_sha256", "")
    # Store the result of looking up `'zip_sha256', ''` in `metadata` (without crashing if it is
    # missing) in the variable `ET.SubElement(hashes, 'OriginalZipSHA256').text`.
    ET.SubElement(hashes, "OriginalZipSHA256").text   = metadata.get("zip_sha256", "")

    # File inventory
    # Store the result of calling `ET.SubElement` (name meaning: sub element) with `root,
    # 'FileInventory'` in the variable `inventory`.
    inventory = ET.SubElement(root, "FileInventory")
    # Go through every key/value pair of `metadata.get('file_hashes', {})` one item at a time; each
    # item is called `(fname, fhash)`.
    for fname, fhash in metadata.get("file_hashes", {}).items():
        # Store the result of calling `ET.SubElement` (name meaning: sub element) with `inventory,
        # 'File'` in the variable `entry`.
        entry = ET.SubElement(inventory, "File")
        # Switch on `entry`.
        entry.set("name", fname)
        # Switch on `entry`.
        entry.set("sha256", fhash)

    # Security flags
    # Store the result of calling `ET.SubElement` (name meaning: sub element) with `root,
    # 'SecurityFlags'` in the variable `flags`.
    flags = ET.SubElement(root, "SecurityFlags")
    # Store the text `'HMAC-SHA256'` in the variable `ET.SubElement(flags, 'IntegrityCheck').text`.
    ET.SubElement(flags, "IntegrityCheck").text  = "HMAC-SHA256"
    # Store the text `'PKCS7'` in the variable `ET.SubElement(flags, 'Padding').text`.
    ET.SubElement(flags, "Padding").text         = "PKCS7"
    # Store the text `'true'` in the variable `ET.SubElement(flags, 'TimestampVerify').text`.
    ET.SubElement(flags, "TimestampVerify").text  = "true"
    # Store `MAGIC_HEADER` as hexadecimal text in the variable `ET.SubElement(flags,
    # 'MagicHeader').text`.
    ET.SubElement(flags, "MagicHeader").text      = MAGIC_HEADER.hex()

    # Pretty-print XML
    # Store the result of calling `ET.tostring` (name meaning: tostring) with `root,
    # encoding='unicode'` in the variable `raw_xml`.
    raw_xml = ET.tostring(root, encoding="unicode")
    # Store the result of calling `minidom.parseString(raw_xml).toprettyxml` (name meaning:
    # toprettyxml) with `indent=' '` in the variable `pretty`.
    pretty  = minidom.parseString(raw_xml).toprettyxml(indent="  ")
    # Use the result of opening the file `xml_path, 'w', encoding='utf-8'` (called `f`) for the
    # indented steps below; it is closed/cleaned up automatically afterwards.
    with open(xml_path, "w", encoding="utf-8") as f:
        # Write `pretty` into `f`.
        f.write(pretty)

    # Show `f' [XML] Manifest written → {xml_path}'` on the screen.
    print(f"  [XML] Manifest written → {xml_path}")


# ─────────────────────────────────────────────
#  MAIN
# ─────────────────────────────────────────────

# Define a function (a reusable set of steps) named `main` (name meaning: main). It takes no inputs.
def main():
    # Show `'=' * 60` on the screen.
    print("=" * 60)
    # Show `' MULTIMODAL SECURITY — PYTHON LAYER 1'` on the screen.
    print("  MULTIMODAL SECURITY — PYTHON LAYER 1")
    # Show `' ZIP Creation + Stream Encryption + XML Manifest'` on the screen.
    print("  ZIP Creation + Stream Encryption + XML Manifest")
    # Show `'=' * 60` on the screen.
    print("=" * 60)

    # Paths
    # Store the value `Path(__file__).parent.parent` in the variable `base`.
    base       = Path(__file__).parent.parent
    # Store `base` divided by `'shared'` in the variable `shared_dir`.
    shared_dir = base / "shared"
    # Create the folder `shared_dir`.
    shared_dir.mkdir(exist_ok=True)

    # Create sample files to zip
    # Store an empty list in the variable `samples`.
    samples = []
    # Store a dictionary (lookup table) with 3 entries in the variable `sample_data` (this
    # instruction continues over the next 4 lines).
    sample_data = {
        "secret_doc.txt":  "Classified: multimodal security demonstration\nLayer 1 — Python\n",
        "config.cfg":      "[security]\nmode=strict\nlayers=4\nalgorithm=CTR-HMAC-SHA256\n",
        "data.csv":        "id,value,checksum\n1,alpha,a1b2c3\n2,beta,d4e5f6\n3,gamma,g7h8i9\n",
    }
    # Go through every key/value pair of `sample_data` one item at a time; each item is called
    # `(fname, content)`.
    for fname, content in sample_data.items():
        # Store `shared_dir` divided by `fname` in the variable `fpath`.
        fpath = shared_dir / fname
        # Write `content` into the file `fpath`.
        fpath.write_text(content)
        # Add `str(fpath)` to the end of `samples`.
        samples.append(str(fpath))

    # Store the text `'Mult1m0d@lS3cur1ty#2025!'` in the variable `passphrase`.
    passphrase  = "Mult1m0d@lS3cur1ty#2025!"
    # Store `shared_dir / 'archive.zip'` converted to text in the variable `zip_path`.
    zip_path    = str(shared_dir / "archive.zip")
    # Store `shared_dir / 'archive.mmsec'` converted to text in the variable `enc_path`.
    enc_path    = str(shared_dir / "archive.mmsec")
    # Store `shared_dir / 'manifest_python.xml'` converted to text in the variable `xml_path`.
    xml_path    = str(shared_dir / "manifest_python.xml")

    # Show `'\n[STEP 1] Creating ZIP archive …'` on the screen.
    print("\n[STEP 1] Creating ZIP archive …")
    # Store the result of the function `create_secure_zip` (name meaning: create secure zip) given
    # `samples, zip_path` in the variable `zip_meta`.
    zip_meta = create_secure_zip(samples, zip_path)

    # Show `'\n[STEP 2] Encrypting archive …'` on the screen.
    print("\n[STEP 2] Encrypting archive …")
    # Store the result of the function `encrypt_zip` (name meaning: encrypt zip) given `zip_path,
    # passphrase, enc_path` in the variable `enc_meta`.
    enc_meta = encrypt_zip(zip_path, passphrase, enc_path)

    # Show `'\n[STEP 3] Writing XML manifest …'` on the screen.
    print("\n[STEP 3] Writing XML manifest …")
    # Store a dictionary (lookup table) with 2 entries in the variable `combined`.
    combined = {**zip_meta, **enc_meta}
    # Call the function `write_xml_manifest` (name meaning: write xml manifest) given `combined,
    # xml_path`.
    write_xml_manifest(combined, xml_path)

    # Show `'\n[STEP 4] Verifying round-trip decryption …'` on the screen.
    print("\n[STEP 4] Verifying round-trip decryption …")
    # Store `shared_dir / 'archive_verify.zip'` converted to text in the variable `verify_zip`.
    verify_zip = str(shared_dir / "archive_verify.zip")
    # Store the result of the function `decrypt_zip` (name meaning: decrypt zip) given `enc_path,
    # passphrase, verify_zip` in the variable `ok`.
    ok = decrypt_zip(enc_path, passphrase, verify_zip)
    # Check whether `ok` has a value / is true; if so, do the indented steps below.
    if ok:
        # Store the result of the function `sha256_file` (name meaning: sha256 file) given
        # `verify_zip` in the variable `restored_hash`.
        restored_hash = sha256_file(verify_zip)
        # Store the item `'zip_sha256'` from `zip_meta` in the variable `original_hash`.
        original_hash = zip_meta["zip_sha256"]
        # Store `'✓ MATCH'` if `restored_hash` equals `original_hash`, otherwise `'✗ MISMATCH'` in
        # the variable `match`.
        match = "✓ MATCH" if restored_hash == original_hash else "✗ MISMATCH"
        # Show `f' [VFY] Hash check: {match}'` on the screen.
        print(f"  [VFY] Hash check: {match}")
        # Show `f' Original: {original_hash}'` on the screen.
        print(f"        Original:  {original_hash}")
        # Show `f' Restored: {restored_hash}'` on the screen.
        print(f"        Restored:  {restored_hash}")

    # Show `'\n[DONE] Python layer complete.\n'` on the screen.
    print("\n[DONE] Python layer complete.\n")
    # Send back the value of `combined` as the result of this function.
    return combined


# Only when this file is started directly (not imported by another file), run the steps below.
if __name__ == "__main__":
    # Call the function `main` (name meaning: main).
    main()
