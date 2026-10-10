// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : multimodal_security  >  SecureZipManager.java
//  2. Program Description        : MULTIMODAL SECURITY — JAVA MODULE Layer 4: Final ZIP
//                                  Packaging + Digital Signature + XML Manifest No JSON — uses
//                                  XML and binary formats throughout. In simple words, this
//                                  file protects files: it packs, checks or verifies data so
//                                  it cannot be changed unnoticed. It is one small, separate
//                                  piece so each language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : - Command-line arguments (String[] args).
//                                  - Uses the arguments passed to main().
//  7. Output                     : - Text printed to the screen.
//                                  - Files written to disk.
//  8. Variables                  : - VERSION = "1.0.0"
//                                  - LAYER = "4"
//                                  - MAGIC = "MMSJ"
//                                  - PBKDF2_ITER = 310_000
//                                  - KEY_LEN_BITS = 256
//                                  - SALT_BYTES = 32
//                                  - IV_BYTES = 12
//                                  - GCM_TAG_BITS = 128
//                                  - KDF_ALGO = "PBKDF2WithHmacSHA256"
//                                  - CIPHER_ALGO = "AES/GCM/NoPadding"
//  9. Algorithm / Logic          : - Class SecureZipManager.
//                                  - Class EncResult.
//                                  - Method sha256hex(): sha256hex.
//                                  - Method sha256file(): sha256file.
//                                  - Method deriveKey(): derive key.
//                                  - Method encryptAESGCM(): encrypt aesgcm.
//                                  - Method decryptAESGCM(): decrypt aesgcm.
//                                  - Method hmacSHA256(): hmac sha256.
//                                  - Method createFinalZip(): create final zip.
//                                  - Method writeBinaryBlob(): write binary blob.
//                                  - Execution starts in main().
// 10. Dependencies               : - Java standard library: java.io, java.nio, java.security,
//                                    java.time, java.util, javax.crypto, javax.xml, org.w3c.
//                                  - Needs a Java Development Kit (JDK 11 or newer).
// 11. Execution Instructions     : - javac SecureZipManager.java
//                                  - java SecureZipManager
// 12. Assumptions and Limitations: - The required tools listed above are installed and on the
//                                    PATH.
//                                  - Limitation: results are only as good as the data given to
//                                    it.
// 13. Error Handling             : - Catches: AEADBadTagException.
//                                  - Raises: SecurityException.
// =============================================================================================

/*
 * =============================================================
 *  MULTIMODAL SECURITY — JAVA MODULE
 *  Layer 4: Final ZIP Packaging + Digital Signature + XML Manifest
 *  No JSON — uses XML and binary formats throughout
 * =============================================================
 *
 *  Compile : javac SecureZipManager.java
 *  Run     : java SecureZipManager [shared_dir]
 * =============================================================
 */

// Bring in `java.io.*` from the Java library (reading and writing files and data streams).
import java.io.*;
// Bring in `java.nio.file.*` from the Java library (modern file and byte handling).
import java.nio.file.*;
// Bring in `java.nio.charset.StandardCharsets` from the Java library (modern file and byte
// handling).
import java.nio.charset.StandardCharsets;
// Bring in `java.security.*` from the Java library (hashing, random numbers and security tools).
import java.security.*;
// Bring in `java.security.spec.*` from the Java library (hashing, random numbers and security
// tools).
import java.security.spec.*;
// Bring in `java.util.*` from the Java library (general helpers (lists, maps, arrays, dates)).
import java.util.*;
// Bring in `java.util.zip.*` from the Java library (creating and reading ZIP archives).
import java.util.zip.*;
// Bring in `java.util.stream.*` from the Java library (general helpers (lists, maps, arrays,
// dates)).
import java.util.stream.*;
// Bring in `java.time.*` from the Java library (dates and times).
import java.time.*;
// Bring in `java.time.format.*` from the Java library (dates and times).
import java.time.format.*;
// Bring in `javax.crypto.*` from the Java library (encryption and decryption).
import javax.crypto.*;
// Bring in `javax.crypto.spec.*` from the Java library (encryption and decryption).
import javax.crypto.spec.*;
// Bring in `javax.xml.parsers.*` from the Java library (creating and reading XML documents).
import javax.xml.parsers.*;
// Bring in `javax.xml.transform.*` from the Java library (creating and reading XML documents).
import javax.xml.transform.*;
// Bring in `javax.xml.transform.dom.*` from the Java library (creating and reading XML documents).
import javax.xml.transform.dom.*;
// Bring in `javax.xml.transform.stream.*` from the Java library (creating and reading XML
// documents).
import javax.xml.transform.stream.*;
// Bring in `org.w3c.dom.*` from the Java library (the structure of XML documents).
import org.w3c.dom.*;


// Start defining a class (a blueprint for objects) named `SecureZipManager`.
public class SecureZipManager {

    // ─────────────────────────────────────────────
    //  CONSTANTS
    // ─────────────────────────────────────────────
    // Create a fixed value (constant) named `VERSION` of type `String` and set it to `"1.0.0"`.
    private static final String VERSION      = "1.0.0";
    // Create a fixed value (constant) named `LAYER` of type `String` and set it to `"4"`.
    private static final String LAYER        = "4";
    // Create a fixed value (constant) named `MAGIC` of type `String` and set it to `"MMSJ"`.
    private static final String MAGIC        = "MMSJ";           // Java magic
    // Create a fixed value (constant) named `PBKDF2_ITER` of type `int` and set it to `310_000`.
    private static final int    PBKDF2_ITER  = 310_000;          // OWASP 2024 recommendation
    // Create a fixed value (constant) named `KEY_LEN_BITS` of type `int` and set it to `256`.
    private static final int    KEY_LEN_BITS = 256;
    // Create a fixed value (constant) named `SALT_BYTES` of type `int` and set it to `32`.
    private static final int    SALT_BYTES   = 32;
    // Create a fixed value (constant) named `IV_BYTES` of type `int` and set it to `12`.
    private static final int    IV_BYTES     = 12;               // GCM nonce
    // Create a fixed value (constant) named `GCM_TAG_BITS` of type `int` and set it to `128`.
    private static final int    GCM_TAG_BITS = 128;
    // Create a fixed value (constant) named `KDF_ALGO` of type `String` and set it to
    // `"PBKDF2WithHmacSHA256"`.
    private static final String KDF_ALGO     = "PBKDF2WithHmacSHA256";
    // Create a fixed value (constant) named `CIPHER_ALGO` of type `String` and set it to
    // `"AES/GCM/NoPadding"`.
    private static final String CIPHER_ALGO  = "AES/GCM/NoPadding";
    // Create a fixed value (constant) named `KEY_ALGO` of type `String` and set it to `"AES"`.
    private static final String KEY_ALGO     = "AES";

    // ─────────────────────────────────────────────
    //  INNER: ENCRYPTION RESULT
    // ─────────────────────────────────────────────
    // Start defining a class (a blueprint for objects) named `EncResult`.
    static class EncResult {
        // Create the variables `salt`, `iv`, `ciphertext`, ``, `tag`, all of type `byte[]` (no
        // starting values yet).
        byte[] salt, iv, ciphertext, tag;
        // Create a variable named `sha256` of type `String` (no starting value yet).
        String sha256;
        // Create a variable named `originalSize` of type `long` (no starting value yet).
        long   originalSize;
    // End of the class EncResult.
    }


    // ─────────────────────────────────────────────
    //  SHA-256 UTILITY
    // ─────────────────────────────────────────────
    // Start the method `sha256hex` (name meaning: sha256hex). It takes `byte[] data` and gives back
    // `String`.
    static String sha256hex(byte[] data) throws NoSuchAlgorithmException {
        // Create a variable named `md` of type `MessageDigest` and set it to
        // `MessageDigest.getInstance("SHA-256")`.
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        // Create a variable named `d` of type `byte[]` and set it to `md.digest(data)`.
        byte[] d = md.digest(data);
        // Create a variable named `sb` of type `StringBuilder` and set it to `new StringBuilder()`.
        StringBuilder sb = new StringBuilder();
        // Go through every item of `d`; each one is called `b`. Then do:
        // `sb.append(String.format("%02x", b));`.
        for (byte b : d) sb.append(String.format("%02x", b));
        // Send back `sb.toString()` as the result.
        return sb.toString();
    // End of the method sha256hex.
    }

    // Start the method `sha256file` (name meaning: sha256file). It takes `Path p` and gives back
    // `String`.
    static String sha256file(Path p) throws Exception {
        // Send back `sha256hex(Files.readAllBytes(p))` as the result.
        return sha256hex(Files.readAllBytes(p));
    // End of the method sha256file.
    }


    // ─────────────────────────────────────────────
    //  KEY DERIVATION (PBKDF2-HMAC-SHA256)
    // ─────────────────────────────────────────────
    // Start the method `deriveKey` (name meaning: derive key). It takes `char[] passphrase, byte[]
    // salt` and gives back `SecretKey`.
    static SecretKey deriveKey(char[] passphrase, byte[] salt) throws Exception {
        // Create a variable named `spec` of type `PBEKeySpec` and set it to `new
        // PBEKeySpec(passphrase, salt, PBKDF2_ITER, KEY_LEN_BITS)`.
        PBEKeySpec spec = new PBEKeySpec(passphrase, salt, PBKDF2_ITER, KEY_LEN_BITS);
        // Create a variable named `skf` of type `SecretKeyFactory` and set it to
        // `SecretKeyFactory.getInstance(KDF_ALGO)`.
        SecretKeyFactory skf = SecretKeyFactory.getInstance(KDF_ALGO);
        // Create a variable named `keyBytes` of type `byte[]` and set it to
        // `skf.generateSecret(spec).getEncoded()`.
        byte[] keyBytes = skf.generateSecret(spec).getEncoded();
        // Call `spec.clearPassword` (name meaning: clear password).
        spec.clearPassword();
        // Send back `new SecretKeySpec(keyBytes, KEY_ALGO)` as the result.
        return new SecretKeySpec(keyBytes, KEY_ALGO);
    // End of the method deriveKey.
    }


    // ─────────────────────────────────────────────
    //  AES-256-GCM ENCRYPT
    // ─────────────────────────────────────────────
    // Start the method `encryptAESGCM` (name meaning: encrypt aesgcm). It takes `byte[] plaintext,
    // char[] passphrase` and gives back `EncResult`.
    static EncResult encryptAESGCM(byte[] plaintext, char[] passphrase) throws Exception {
        // Create a variable named `rng` of type `SecureRandom` and set it to `new SecureRandom()`.
        SecureRandom rng  = new SecureRandom();
        // Create a variable named `salt` of type `byte[]` and set it to `new byte[SALT_BYTES]`.
        byte[] salt = new byte[SALT_BYTES];
        // Create a variable named `iv` of type `byte[]` and set it to `new byte[IV_BYTES]`.
        byte[] iv   = new byte[IV_BYTES];
        // Call `rng.nextBytes` (name meaning: next bytes) with `salt`.
        rng.nextBytes(salt);
        // Call `rng.nextBytes` (name meaning: next bytes) with `iv`.
        rng.nextBytes(iv);

        // Create a variable named `key` of type `SecretKey` and set it to `deriveKey(passphrase,
        // salt)`.
        SecretKey key = deriveKey(passphrase, salt);
        // Create a variable named `cipher` of type `Cipher` and set it to
        // `Cipher.getInstance(CIPHER_ALGO)`.
        Cipher cipher = Cipher.getInstance(CIPHER_ALGO);
        // Create a variable named `gcmSpec` of type `GCMParameterSpec` and set it to `new
        // GCMParameterSpec(GCM_TAG_BITS, iv)`.
        GCMParameterSpec gcmSpec = new GCMParameterSpec(GCM_TAG_BITS, iv);
        // Call `cipher.init` (name meaning: init) with `Cipher.ENCRYPT_MODE, key, gcmSpec`.
        cipher.init(Cipher.ENCRYPT_MODE, key, gcmSpec);
        // Create a variable named `ct` of type `byte[]` and set it to `cipher.doFinal(plaintext)`.
        byte[] ct = cipher.doFinal(plaintext);   // last GCM_TAG_BITS/8 bytes = auth tag

        // Create a variable named `r` of type `EncResult` and set it to `new EncResult()`.
        EncResult r = new EncResult();
        // Set `r.salt` to `salt`.
        r.salt         = salt;
        // Set `r.iv` to `iv`.
        r.iv           = iv;
        // Set `r.ciphertext` to `Arrays.copyOf(ct, ct.length - 16)`.
        r.ciphertext   = Arrays.copyOf(ct, ct.length - 16);
        // Set `r.tag` to `Arrays.copyOfRange(ct, ct.length - 16, ct.length)`.
        r.tag          = Arrays.copyOfRange(ct, ct.length - 16, ct.length);
        // Set `r.sha256` to `sha256hex(ct)`.
        r.sha256       = sha256hex(ct);
        // Set `r.originalSize` to `plaintext.length`.
        r.originalSize = plaintext.length;
        // Send back `r` as the result.
        return r;
    // End of the method encryptAESGCM.
    }


    // ─────────────────────────────────────────────
    //  AES-256-GCM DECRYPT
    // ─────────────────────────────────────────────
    // Start the method `decryptAESGCM` (name meaning: decrypt aesgcm). It takes `EncResult r,
    // char[] passphrase` and gives back `byte[]`.
    static byte[] decryptAESGCM(EncResult r, char[] passphrase) throws Exception {
        // Create a variable named `key` of type `SecretKey` and set it to `deriveKey(passphrase,
        // r.salt)`.
        SecretKey key = deriveKey(passphrase, r.salt);
        // Create a variable named `cipher` of type `Cipher` and set it to
        // `Cipher.getInstance(CIPHER_ALGO)`.
        Cipher cipher = Cipher.getInstance(CIPHER_ALGO);
        // Create a variable named `gcmSpec` of type `GCMParameterSpec` and set it to `new
        // GCMParameterSpec(GCM_TAG_BITS, r.iv)`.
        GCMParameterSpec gcmSpec = new GCMParameterSpec(GCM_TAG_BITS, r.iv);
        // Call `cipher.init` (name meaning: init) with `Cipher.DECRYPT_MODE, key, gcmSpec`.
        cipher.init(Cipher.DECRYPT_MODE, key, gcmSpec);

        // Reassemble ciphertext + tag
        // Create a variable named `combined` of type `byte[]` and set it to `new
        // byte[r.ciphertext.length + r.tag.length]`.
        byte[] combined = new byte[r.ciphertext.length + r.tag.length];
        // Call `System.arraycopy` (name meaning: arraycopy) with `r.ciphertext, 0, combined, 0,
        // r.ciphertext.length`.
        System.arraycopy(r.ciphertext, 0, combined, 0, r.ciphertext.length);
        // Call `System.arraycopy` (name meaning: arraycopy) with `r.tag, 0, combined,
        // r.ciphertext.length, r.tag.length`.
        System.arraycopy(r.tag, 0, combined, r.ciphertext.length, r.tag.length);

        // Send back `cipher.doFinal(combined)` as the result.
        return cipher.doFinal(combined);   // throws AEADBadTagException if tampered
    // End of the method decryptAESGCM.
    }


    // ─────────────────────────────────────────────
    //  HMAC-SHA256
    // ─────────────────────────────────────────────
    // Start the method `hmacSHA256` (name meaning: hmac sha256). It takes `byte[] key, byte[] data`
    // and gives back `String`.
    static String hmacSHA256(byte[] key, byte[] data) throws Exception {
        // Create a variable named `mac` of type `Mac` and set it to
        // `Mac.getInstance("HmacSHA256")`.
        Mac mac = Mac.getInstance("HmacSHA256");
        // Call `mac.init` (name meaning: init) with `new SecretKeySpec(key, "HmacSHA256")`.
        mac.init(new SecretKeySpec(key, "HmacSHA256"));
        // Create a variable named `sig` of type `byte[]` and set it to `mac.doFinal(data)`.
        byte[] sig = mac.doFinal(data);
        // Create a variable named `sb` of type `StringBuilder` and set it to `new StringBuilder()`.
        StringBuilder sb = new StringBuilder();
        // Go through every item of `sig`; each one is called `b`. Then do:
        // `sb.append(String.format("%02x", b));`.
        for (byte b : sig) sb.append(String.format("%02x", b));
        // Send back `sb.toString()` as the result.
        return sb.toString();
    // End of the method hmacSHA256.
    }


    // ─────────────────────────────────────────────
    //  CREATE SECURE ZIP (Layer 4 final packaging)
    // ─────────────────────────────────────────────
    // Start the method `createFinalZip` (name meaning: create final zip). It takes no inputs and
    // gives back `String>`.
    static Map<String, String> createFinalZip(
            // ...continues the instruction from the line above: `List<Path> files, Path outputZip)
            // throws Exception {`.
            List<Path> files, Path outputZip) throws Exception {

        // Create a variable named `hashes` of type `Map<String, String>` and set it to `new
        // LinkedHashMap<>()`.
        Map<String, String> hashes = new LinkedHashMap<>();
        // Call `try` (name meaning: try) with `ZipOutputStream zos = new ZipOutputStream()` (this
        // instruction continues on the next lines).
        try (ZipOutputStream zos = new ZipOutputStream(
                // ...continues the instruction from the line above: `new
                // BufferedOutputStream(Files.newOutputStream(outputZip)))) {`.
                new BufferedOutputStream(Files.newOutputStream(outputZip)))) {

            // Call `zos.setLevel` (name meaning: set level) with `Deflater.BEST_COMPRESSION`.
            zos.setLevel(Deflater.BEST_COMPRESSION);
            // Call `zos.setMethod` (name meaning: set method) with `ZipOutputStream.DEFLATED`.
            zos.setMethod(ZipOutputStream.DEFLATED);

            // Go through every item of `files`; each one is called `p`.
            for (Path p : files) {
                // Check whether `!Files.exists(p)`; if true, run what follows. Then do:
                // `continue;`.
                if (!Files.exists(p)) continue;
                // Create a variable named `data` of type `byte[]` and set it to
                // `Files.readAllBytes(p)`.
                byte[] data = Files.readAllBytes(p);
                // Create a variable named `hash` of type `String` and set it to `sha256hex(data)`.
                String hash = sha256hex(data);
                // Call `hashes.put` (name meaning: put) with `p.getFileName().toString(), hash`.
                hashes.put(p.getFileName().toString(), hash);

                // Create a variable named `entry` of type `ZipEntry` and set it to `new
                // ZipEntry(p.getFileName().toString())`.
                ZipEntry entry = new ZipEntry(p.getFileName().toString());
                // Call `entry.setSize` (name meaning: set size) with `data.length`.
                entry.setSize(data.length);
                // Call `entry.setComment` (name meaning: set comment) with `"SHA256=" + hash`.
                entry.setComment("SHA256=" + hash);
                // Call `zos.putNextEntry` (name meaning: put next entry) with `entry`.
                zos.putNextEntry(entry);
                // Call `zos.write` (name meaning: write) with `data`.
                zos.write(data);
                // Call `zos.closeEntry` (name meaning: close entry).
                zos.closeEntry();
                // Print `" [ZIP] %-30s SHA256=%s…%n"` to the screen (this instruction continues on
                // the next lines).
                System.out.printf("  [ZIP] %-30s SHA256=%s…%n",
                    // ...continues the instruction from the line above: `p.getFileName(),
                    // hash.substring(0, 16));`.
                    p.getFileName(), hash.substring(0, 16));
            // End of the loop.
            }
        // End of the method BufferedOutputStream.
        }
        // Send back `hashes` as the result.
        return hashes;
    // End of this block.
    }


    // ─────────────────────────────────────────────
    //  WRITE BINARY SECURE BLOB
    //  Format: [MAGIC 4B][SALT 32B][IV 12B][TAG 16B][ORIG_LEN 8B][CIPHERTEXT…]
    // ─────────────────────────────────────────────
    // Start the method `writeBinaryBlob` (name meaning: write binary blob). It takes `Path output,
    // EncResult r` and gives back nothing.
    static void writeBinaryBlob(Path output, EncResult r) throws Exception {
        // Call `try` (name meaning: try) with `DataOutputStream dos = new DataOutputStream()` (this
        // instruction continues on the next lines).
        try (DataOutputStream dos = new DataOutputStream(
                // ...continues the instruction from the line above: `new
                // BufferedOutputStream(Files.newOutputStream(output)))) {`.
                new BufferedOutputStream(Files.newOutputStream(output)))) {
            // Call `dos.write` (name meaning: write) with
            // `MAGIC.getBytes(StandardCharsets.US_ASCII)`.
            dos.write(MAGIC.getBytes(StandardCharsets.US_ASCII));  // 4 bytes
            // Call `dos.write` (name meaning: write) with `r.salt`.
            dos.write(r.salt);       // 32 bytes
            // Call `dos.write` (name meaning: write) with `r.iv`.
            dos.write(r.iv);         // 12 bytes
            // Call `dos.write` (name meaning: write) with `r.tag`.
            dos.write(r.tag);        // 16 bytes
            // Call `dos.writeLong` (name meaning: write long) with `r.originalSize`.
            dos.writeLong(r.originalSize);  // 8 bytes
            // Call `dos.write` (name meaning: write) with `r.ciphertext`.
            dos.write(r.ciphertext);
        // End of the method BufferedOutputStream.
        }
    // End of the method writeBinaryBlob.
    }

    // Start the method `readBinaryBlob` (name meaning: read binary blob). It takes `Path input` and
    // gives back `EncResult`.
    static EncResult readBinaryBlob(Path input) throws Exception {
        // Call `try` (name meaning: try) with `DataInputStream dis = new DataInputStream()` (this
        // instruction continues on the next lines).
        try (DataInputStream dis = new DataInputStream(
                // ...continues the instruction from the line above: `new
                // BufferedInputStream(Files.newInputStream(input)))) {`.
                new BufferedInputStream(Files.newInputStream(input)))) {
            // Create a variable named `magic` of type `byte[]` and set it to `dis.readNBytes(4)`.
            byte[] magic = dis.readNBytes(4);
            // Check whether `!new String(magic, StandardCharsets.US_ASCII).equals(MAGIC)`; if true,
            // run what follows.
            if (!new String(magic, StandardCharsets.US_ASCII).equals(MAGIC))
                // ...continues the instruction from the line above: `throw new
                // SecurityException("Invalid magic header in blob");`.
                throw new SecurityException("Invalid magic header in blob");

            // Create a variable named `r` of type `EncResult` and set it to `new EncResult()`.
            EncResult r = new EncResult();
            // Set `r.salt` to `dis.readNBytes(SALT_BYTES)`.
            r.salt         = dis.readNBytes(SALT_BYTES);
            // Set `r.iv` to `dis.readNBytes(IV_BYTES)`.
            r.iv           = dis.readNBytes(IV_BYTES);
            // Set `r.tag` to `dis.readNBytes(16)`.
            r.tag          = dis.readNBytes(16);
            // Set `r.originalSize` to `dis.readLong()`.
            r.originalSize = dis.readLong();
            // Set `r.ciphertext` to `dis.readAllBytes()`.
            r.ciphertext   = dis.readAllBytes();
            // Send back `r` as the result.
            return r;
        // End of the method BufferedInputStream.
        }
    // End of the method readBinaryBlob.
    }


    // ─────────────────────────────────────────────
    //  XML MANIFEST WRITER (no JSON)
    // ─────────────────────────────────────────────
    // Start the method `writeXMLManifest` (name meaning: write xmlmanifest). It takes no inputs and
    // gives back nothing.
    static void writeXMLManifest(
            // Data values for the list above: `Path xmlPath,`.
            Path xmlPath,
            // ...continues the instruction from the line above: `Map<String, String> fileHashes,`.
            Map<String, String> fileHashes,
            // Data values for the list above: `EncResult enc,`.
            EncResult enc,
            // Data values for the list above: `String zipSHA256,`.
            String zipSHA256,
            // Data values for the list above: `String blobSHA256,`.
            String blobSHA256,
            // ...continues the instruction from the line above: `String hmacSig) throws Exception
            // {`.
            String hmacSig) throws Exception {

        // Create a variable named `dbf` of type `DocumentBuilderFactory` and set it to
        // `DocumentBuilderFactory.newInstance()`.
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // Create a variable named `db` of type `DocumentBuilder` and set it to
        // `dbf.newDocumentBuilder()`.
        DocumentBuilder db = dbf.newDocumentBuilder();
        // Create a variable named `doc` of type `Document` and set it to `db.newDocument()`.
        Document doc = db.newDocument();

        // Root
        // Create a variable named `root` of type `Element` and set it to
        // `doc.createElement("MultimodalSecurityManifest")`.
        Element root = doc.createElement("MultimodalSecurityManifest");
        // Call `root.setAttribute` (name meaning: set attribute) with `"language", "Java"`.
        root.setAttribute("language", "Java");
        // Call `root.setAttribute` (name meaning: set attribute) with `"layer", LAYER`.
        root.setAttribute("layer", LAYER);
        // Call `root.setAttribute` (name meaning: set attribute) with `"version", VERSION`.
        root.setAttribute("version", VERSION);
        // Call `root.setAttribute` (name meaning: set attribute) with `"timestamp"` (this
        // instruction continues on the next lines).
        root.setAttribute("timestamp",
            // ...continues the instruction from the line above:
            // `DateTimeFormatter.ISO_INSTANT.format(Instant.now()));`.
            DateTimeFormatter.ISO_INSTANT.format(Instant.now()));
        // Call `doc.appendChild` (name meaning: append child) with `root`.
        doc.appendChild(root);

        // Header
        // Create a variable named `header` of type `Element` and set it to
        // `doc.createElement("Header")`.
        Element header = doc.createElement("Header");
        // Call `addText` (name meaning: add text) with `doc, header, "Description"` (this
        // instruction continues on the next lines).
        addText(doc, header, "Description",
            // ...continues the instruction from the line above: `"AES-256-GCM encrypted ZIP with
            // PBKDF2 key derivation and HMAC-SHA2...`.
            "AES-256-GCM encrypted ZIP with PBKDF2 key derivation and HMAC-SHA256 signing");
        // Call `addText` (name meaning: add text) with `doc, header, "KDFAlgorithm", KDF_ALGO`.
        addText(doc, header, "KDFAlgorithm", KDF_ALGO);
        // Call `addText` (name meaning: add text) with `doc, header, "KDFIterations",
        // String.valueOf(PBKDF2_ITER)`.
        addText(doc, header, "KDFIterations", String.valueOf(PBKDF2_ITER));
        // Call `addText` (name meaning: add text) with `doc, header, "CipherAlgorithm",
        // CIPHER_ALGO`.
        addText(doc, header, "CipherAlgorithm", CIPHER_ALGO);
        // Call `addText` (name meaning: add text) with `doc, header, "TagLengthBits",
        // String.valueOf(GCM_TAG_BITS)`.
        addText(doc, header, "TagLengthBits", String.valueOf(GCM_TAG_BITS));
        // Call `root.appendChild` (name meaning: append child) with `header`.
        root.appendChild(header);

        // Encryption params
        // Create a variable named `encEl` of type `Element` and set it to
        // `doc.createElement("EncryptionParams")`.
        Element encEl = doc.createElement("EncryptionParams");
        // Call `addText` (name meaning: add text) with `doc, encEl, "Salt", bytesToHex(enc.salt)`.
        addText(doc, encEl, "Salt",    bytesToHex(enc.salt));
        // Call `addText` (name meaning: add text) with `doc, encEl, "IV", bytesToHex(enc.iv)`.
        addText(doc, encEl, "IV",      bytesToHex(enc.iv));
        // Call `addText` (name meaning: add text) with `doc, encEl, "AuthTag",
        // bytesToHex(enc.tag)`.
        addText(doc, encEl, "AuthTag", bytesToHex(enc.tag));
        // Call `addText` (name meaning: add text) with `doc, encEl, "OriginalSizeBytes",
        // String.valueOf(enc.origi...`.
        addText(doc, encEl, "OriginalSizeBytes", String.valueOf(enc.originalSize));
        // Call `root.appendChild` (name meaning: append child) with `encEl`.
        root.appendChild(encEl);

        // Hashes
        // Create a variable named `hashes` of type `Element` and set it to
        // `doc.createElement("Hashes")`.
        Element hashes = doc.createElement("Hashes");
        // Call `addText` (name meaning: add text) with `doc, hashes, "ZipSHA256", zipSHA256`.
        addText(doc, hashes, "ZipSHA256",  zipSHA256);
        // Call `addText` (name meaning: add text) with `doc, hashes, "BlobSHA256", blobSHA256`.
        addText(doc, hashes, "BlobSHA256", blobSHA256);
        // Call `addText` (name meaning: add text) with `doc, hashes, "HMACSHA256", hmacSig`.
        addText(doc, hashes, "HMACSHA256", hmacSig);
        // Call `root.appendChild` (name meaning: append child) with `hashes`.
        root.appendChild(hashes);

        // File inventory
        // Create a variable named `inventory` of type `Element` and set it to
        // `doc.createElement("FileInventory")`.
        Element inventory = doc.createElement("FileInventory");
        // Go through every item of `fileHashes.entrySet()`; each one is called `e`.
        for (Map.Entry<String, String> e : fileHashes.entrySet()) {
            // Create a variable named `file` of type `Element` and set it to
            // `doc.createElement("File")`.
            Element file = doc.createElement("File");
            // Call `file.setAttribute` (name meaning: set attribute) with `"name", e.getKey()`.
            file.setAttribute("name", e.getKey());
            // Call `file.setAttribute` (name meaning: set attribute) with `"sha256", e.getValue()`.
            file.setAttribute("sha256", e.getValue());
            // Call `inventory.appendChild` (name meaning: append child) with `file`.
            inventory.appendChild(file);
        // End of the loop.
        }
        // Call `root.appendChild` (name meaning: append child) with `inventory`.
        root.appendChild(inventory);

        // Security profile
        // Create a variable named `profile` of type `Element` and set it to
        // `doc.createElement("SecurityProfile")`.
        Element profile = doc.createElement("SecurityProfile");
        // Call `addText` (name meaning: add text) with `doc, profile, "ConfidentialityLayer",
        // "AES-256-GCM"`.
        addText(doc, profile, "ConfidentialityLayer", "AES-256-GCM");
        // Call `addText` (name meaning: add text) with `doc, profile, "IntegrityLayer",
        // "GCM-AuthTag + HMAC-SHA256"`.
        addText(doc, profile, "IntegrityLayer",       "GCM-AuthTag + HMAC-SHA256");
        // Call `addText` (name meaning: add text) with `doc, profile, "AuthenticationLayer",
        // "PBKDF2-HMAC-SHA256"`.
        addText(doc, profile, "AuthenticationLayer",  "PBKDF2-HMAC-SHA256");
        // Call `addText` (name meaning: add text) with `doc, profile, "MagicHeader", MAGIC`.
        addText(doc, profile, "MagicHeader",          MAGIC);
        // Call `addText` (name meaning: add text) with `doc, profile, "Language", "Java"`.
        addText(doc, profile, "Language",             "Java");
        // Call `addText` (name meaning: add text) with `doc, profile, "NoJSONUsed", "true"`.
        addText(doc, profile, "NoJSONUsed",           "true");
        // Call `root.appendChild` (name meaning: append child) with `profile`.
        root.appendChild(profile);

        // Serialise with pretty-print
        // Create a variable named `tf` of type `Transformer` and set it to
        // `TransformerFactory.newInstance().newTransformer()`.
        Transformer tf = TransformerFactory.newInstance().newTransformer();
        // Call `tf.setOutputProperty` (name meaning: set output property) with `OutputKeys.INDENT,
        // "yes"`.
        tf.setOutputProperty(OutputKeys.INDENT, "yes");
        // Call `tf.setOutputProperty` (name meaning: set output property) with
        // `"{http://xml.apache.org/xslt}indent-amount", "2"`.
        tf.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
        // Call `tf.setOutputProperty` (name meaning: set output property) with
        // `OutputKeys.ENCODING, "UTF-8"`.
        tf.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        // Call `tf.setOutputProperty` (name meaning: set output property) with
        // `OutputKeys.STANDALONE, "yes"`.
        tf.setOutputProperty(OutputKeys.STANDALONE, "yes");
        // Call `tf.transform` (name meaning: transform) with `new DOMSource(doc), new
        // StreamResult(xmlPath.toFile())`.
        tf.transform(new DOMSource(doc), new StreamResult(xmlPath.toFile()));

        // Print `" [XML] Manifest written → " + xmlPath.getFileName()` to the screen.
        System.out.println("  [XML] Manifest written → " + xmlPath.getFileName());
    // End of this block.
    }

    // Start the method `addText` (name meaning: add text). It takes `Document doc, Element parent,
    // String tag, String text` and gives back nothing.
    private static void addText(Document doc, Element parent, String tag, String text) {
        // Create a variable named `el` of type `Element` and set it to `doc.createElement(tag)`.
        Element el = doc.createElement(tag);
        // Call `el.setTextContent` (name meaning: set text content) with `text`.
        el.setTextContent(text);
        // Call `parent.appendChild` (name meaning: append child) with `el`.
        parent.appendChild(el);
    // End of the method addText.
    }

    // Start the method `bytesToHex` (name meaning: bytes to hex). It takes `byte[] bytes` and gives
    // back `String`.
    private static String bytesToHex(byte[] bytes) {
        // Create a variable named `sb` of type `StringBuilder` and set it to `new StringBuilder()`.
        StringBuilder sb = new StringBuilder();
        // Go through every item of `bytes`; each one is called `b`. Then do:
        // `sb.append(String.format("%02x", b));`.
        for (byte b : bytes) sb.append(String.format("%02x", b));
        // Send back `sb.toString()` as the result.
        return sb.toString();
    // End of the method bytesToHex.
    }


    // ─────────────────────────────────────────────
    //  VERIFY ROUND-TRIP
    // ─────────────────────────────────────────────
    // Start the method `verifyRoundTrip` (name meaning: verify round trip). It takes no inputs and
    // gives back `boolean`.
    static boolean verifyRoundTrip(
            // Data values for the list above: `Path blobPath, Path verifyZip,`.
            Path blobPath, Path verifyZip,
            // ...continues the instruction from the line above: `char[] passphrase, String
            // expectedSHA256) throws Exception {`.
            char[] passphrase, String expectedSHA256) throws Exception {

        // Create a variable named `r` of type `EncResult` and set it to `readBinaryBlob(blobPath)`.
        EncResult r = readBinaryBlob(blobPath);
        // Create a variable named `plain` of type `byte[]` (no starting value yet).
        byte[] plain;
        // Try the following steps; if an error happens, jump to the 'catch' part.
        try {
            // Set `plain` to `decryptAESGCM(r, passphrase)`.
            plain = decryptAESGCM(r, passphrase);
        // If an error (`AEADBadTagException e`) happened in the 'try' part, run this block instead
        // of crashing.
        } catch (AEADBadTagException e) {
            // Print `" [VFY] ✗ GCM authentication tag FAILED — tampered or wrong key!"` to the
            // screen.
            System.out.println("  [VFY] ✗ GCM authentication tag FAILED — tampered or wrong key!");
            // Send back `false` as the result.
            return false;
        // End of the error-handling (catch) block.
        }
        // Call `Files.write` (name meaning: write) with `verifyZip, plain`.
        Files.write(verifyZip, plain);
        // Create a variable named `actualSHA` of type `String` and set it to `sha256hex(plain)`.
        String actualSHA = sha256hex(plain);
        // Create a variable named `match` of type `boolean` and set it to
        // `actualSHA.equals(expectedSHA256)`.
        boolean match = actualSHA.equals(expectedSHA256);
        // Print `" [VFY] Expected SHA256: %s%n", expectedSHA256` to the screen.
        System.out.printf("  [VFY] Expected SHA256: %s%n", expectedSHA256);
        // Print `" [VFY] Actual SHA256: %s%n", actualSHA` to the screen.
        System.out.printf("  [VFY] Actual   SHA256: %s%n", actualSHA);
        // Print `" [VFY] Match: " + (match ? "✓ YES" : "✗ NO")` to the screen.
        System.out.println("  [VFY] Match: " + (match ? "✓ YES" : "✗ NO"));
        // Send back `match` as the result.
        return match;
    // End of this block.
    }


    // ─────────────────────────────────────────────
    //  MAIN
    // ─────────────────────────────────────────────
    // The main method: the program starts running here. 'args' holds any words typed after the
    // program name.
    public static void main(String[] args) throws Exception {
        // Print `"============================================================"` to the screen.
        System.out.println("============================================================");
        // Print `" MULTIMODAL SECURITY — JAVA LAYER 4"` to the screen.
        System.out.println("  MULTIMODAL SECURITY — JAVA LAYER 4");
        // Print `" AES-256-GCM + PBKDF2 + HMAC-SHA256 + XML Manifest"` to the screen.
        System.out.println("  AES-256-GCM + PBKDF2 + HMAC-SHA256 + XML Manifest");
        // Print `"============================================================"` to the screen.
        System.out.println("============================================================");

        // Resolve shared directory
        // Create a variable named `sharedDir` of type `Path` (no starting value yet).
        Path sharedDir;
        // Check whether `args.length > 0`; if true, run what follows.
        if (args.length > 0) {
            // Set `sharedDir` to `Paths.get(args[0]).toAbsolutePath()`.
            sharedDir = Paths.get(args[0]).toAbsolutePath();
        // Otherwise (if none of the checks above were true), run the block below.
        } else {
            // Set `sharedDir` to `Paths.get(System.getProperty("user.dir"))`.
            sharedDir = Paths.get(System.getProperty("user.dir"))
                             // ...continues the instruction from the line above:
                             // `.getParent().resolve("shared");`.
                             .getParent().resolve("shared");
        // End of the 'else' block.
        }
        // Call `Files.createDirectories` (name meaning: create directories) with `sharedDir`.
        Files.createDirectories(sharedDir);

        // Create a variable named `passphrase` of type `char[]` and set it to
        // `"Mult1m0d@lS3cur1ty#2025!".toCharArray()`.
        char[] passphrase = "Mult1m0d@lS3cur1ty#2025!".toCharArray();

        // Create sample files if shared dir is empty of .txt/.cfg/.csv
        // Create a variable named `sourceFiles` of type `List<Path>` and set it to `new
        // ArrayList<>()`.
        List<Path> sourceFiles = new ArrayList<>();
        // Create `samples` (type `String[][]`) and fill it with the values listed below.
        String[][] samples = {
            // Run the instruction `{"layer4_doc.txt", "Java Layer 4 — AES-256-GCM encryption
            // demonstra...`.
            {"layer4_doc.txt",  "Java Layer 4 — AES-256-GCM encryption demonstration\n"},
            // ...continues the instruction from the line above: `{"layer4_meta.cfg",
            // "[layer]\nid=4\nlang=Java\nalgo=AES-256-GCM\nkd...`.
            {"layer4_meta.cfg", "[layer]\nid=4\nlang=Java\nalgo=AES-256-GCM\nkdf=PBKDF2\n"},
            // ...continues the instruction from the line above: `{"layer4_data.csv",
            // "field,value,hash\nalpha,001,aa11\nbeta,002,bb2...`.
            {"layer4_data.csv", "field,value,hash\nalpha,001,aa11\nbeta,002,bb22\ngamma,003,cc33\n"},
        // End of this block.
        };
        // Go through every item of `samples`; each one is called `s`.
        for (String[] s : samples) {
            // Create a variable named `p` of type `Path` and set it to `sharedDir.resolve(s[0])`.
            Path p = sharedDir.resolve(s[0]);
            // Check whether `!Files.exists(p)`; if true, run what follows. Then do:
            // `Files.writeString(p, s[1]);`.
            if (!Files.exists(p)) Files.writeString(p, s[1]);
            // Call `sourceFiles.add` (name meaning: add) with `p`.
            sourceFiles.add(p);
        // End of the loop.
        }
        // Include cross-language files if present
        // Go through every item of `new String[]{"secret_doc.txt", "config.cfg", "data.csv"}`; each
        // one is called `name`.
        for (String name : new String[]{"secret_doc.txt", "config.cfg", "data.csv"}) {
            // Create a variable named `p` of type `Path` and set it to `sharedDir.resolve(name)`.
            Path p = sharedDir.resolve(name);
            // Check whether `Files.exists(p)`; if true, run what follows. Then do:
            // `sourceFiles.add(p);`.
            if (Files.exists(p)) sourceFiles.add(p);
        // End of the loop.
        }

        // Create a variable named `zipPath` of type `Path` and set it to
        // `sharedDir.resolve("archive_java.zip")`.
        Path zipPath    = sharedDir.resolve("archive_java.zip");
        // Create a variable named `blobPath` of type `Path` and set it to
        // `sharedDir.resolve("archive_java.mmsec")`.
        Path blobPath   = sharedDir.resolve("archive_java.mmsec");
        // Create a variable named `verifyZip` of type `Path` and set it to
        // `sharedDir.resolve("archive_java_verify.zip")`.
        Path verifyZip  = sharedDir.resolve("archive_java_verify.zip");
        // Create a variable named `xmlPath` of type `Path` and set it to
        // `sharedDir.resolve("manifest_java.xml")`.
        Path xmlPath    = sharedDir.resolve("manifest_java.xml");

        // Print `"\n[STEP 1] Creating ZIP archive …"` to the screen.
        System.out.println("\n[STEP 1] Creating ZIP archive …");
        // Create a variable named `fileHashes` of type `Map<String, String>` and set it to
        // `createFinalZip(sourceFiles, zipPath)`.
        Map<String, String> fileHashes = createFinalZip(sourceFiles, zipPath);

        // Print `"\n[STEP 2] Reading ZIP bytes …"` to the screen.
        System.out.println("\n[STEP 2] Reading ZIP bytes …");
        // Create a variable named `zipBytes` of type `byte[]` and set it to
        // `Files.readAllBytes(zipPath)`.
        byte[] zipBytes  = Files.readAllBytes(zipPath);
        // Create a variable named `zipSHA256` of type `String` and set it to `sha256hex(zipBytes)`.
        String zipSHA256 = sha256hex(zipBytes);
        // Print `" ZIP SHA-256: " + zipSHA256` to the screen.
        System.out.println("  ZIP SHA-256: " + zipSHA256);

        // Print `"\n[STEP 3] AES-256-GCM encrypting …"` to the screen.
        System.out.println("\n[STEP 3] AES-256-GCM encrypting …");
        // Create a variable named `enc` of type `EncResult` and set it to `encryptAESGCM(zipBytes,
        // passphrase)`.
        EncResult enc = encryptAESGCM(zipBytes, passphrase);
        // Print `" Salt: " + bytesToHex(enc.salt).substring(0, 16) + "…"` to the screen.
        System.out.println("  Salt:    " + bytesToHex(enc.salt).substring(0, 16) + "…");
        // Print `" IV: " + bytesToHex(enc.iv)` to the screen.
        System.out.println("  IV:      " + bytesToHex(enc.iv));
        // Print `" AuthTag: " + bytesToHex(enc.tag)` to the screen.
        System.out.println("  AuthTag: " + bytesToHex(enc.tag));
        // Print `" Enc SHA256: " + enc.sha256` to the screen.
        System.out.println("  Enc SHA256: " + enc.sha256);

        // Print `"\n[STEP 4] Writing binary blob …"` to the screen.
        System.out.println("\n[STEP 4] Writing binary blob …");
        // Call `writeBinaryBlob` (name meaning: write binary blob) with `blobPath, enc`.
        writeBinaryBlob(blobPath, enc);
        // Create a variable named `blobSHA256` of type `String` and set it to
        // `sha256file(blobPath)`.
        String blobSHA256 = sha256file(blobPath);
        // Print `" Blob SHA-256: " + blobSHA256` to the screen.
        System.out.println("  Blob SHA-256: " + blobSHA256);

        // Print `"\n[STEP 5] Computing HMAC-SHA256 signature …"` to the screen.
        System.out.println("\n[STEP 5] Computing HMAC-SHA256 signature …");
        // Create a variable named `hmacKey` of type `byte[]` and set it to `Arrays.copyOf(enc.salt,
        // 32)`.
        byte[] hmacKey   = Arrays.copyOf(enc.salt, 32);
        // Create a variable named `hmacSig` of type `String` and set it to `hmacSHA256(hmacKey,
        // Files.readAllBytes(blobPath))`.
        String hmacSig   = hmacSHA256(hmacKey, Files.readAllBytes(blobPath));
        // Print `" HMAC: " + hmacSig.substring(0, 32) + "…"` to the screen.
        System.out.println("  HMAC: " + hmacSig.substring(0, 32) + "…");

        // Print `"\n[STEP 6] Writing XML manifest …"` to the screen.
        System.out.println("\n[STEP 6] Writing XML manifest …");
        // Call `writeXMLManifest` (name meaning: write xmlmanifest) with `xmlPath, fileHashes, enc,
        // zipSHA256, blobSHA256, hmacSig`.
        writeXMLManifest(xmlPath, fileHashes, enc, zipSHA256, blobSHA256, hmacSig);

        // Print `"\n[STEP 7] Verifying round-trip decryption …"` to the screen.
        System.out.println("\n[STEP 7] Verifying round-trip decryption …");
        // Create a variable named `ok` of type `boolean` and set it to `verifyRoundTrip(blobPath,
        // verifyZip, passphrase, zipSHA256)`.
        boolean ok = verifyRoundTrip(blobPath, verifyZip, passphrase, zipSHA256);

        // Print `"\n[SUMMARY]"` to the screen.
        System.out.println("\n[SUMMARY]");
        // Print `"─────────────────────────────────────────────────────"` to the screen.
        System.out.println("─────────────────────────────────────────────────────");
        // Print `" Files packed : %d%n", sourceFiles.size()` to the screen.
        System.out.printf("  Files packed    : %d%n", sourceFiles.size());
        // Print `" ZIP size : %d bytes%n", Files.size(zipPath)` to the screen.
        System.out.printf("  ZIP size        : %d bytes%n", Files.size(zipPath));
        // Print `" Blob size : %d bytes%n", Files.size(blobPath)` to the screen.
        System.out.printf("  Blob size       : %d bytes%n", Files.size(blobPath));
        // Print `" Integrity check : %s%n", ok ? "✓ PASSED" : "✗ FAILED"` to the screen.
        System.out.printf("  Integrity check : %s%n", ok ? "✓ PASSED" : "✗ FAILED");
        // Print `" Cipher : AES-256-GCM (authenticated)%n"` to the screen.
        System.out.printf("  Cipher          : AES-256-GCM (authenticated)%n");
        // Print `" KDF : PBKDF2-HMAC-SHA256 (%,d iter)%n", PBKDF2_ITER` to the screen.
        System.out.printf("  KDF             : PBKDF2-HMAC-SHA256 (%,d iter)%n", PBKDF2_ITER);
        // Print `"─────────────────────────────────────────────────────"` to the screen.
        System.out.println("─────────────────────────────────────────────────────");
        // Print `"\n[DONE] Java layer complete."` to the screen.
        System.out.println("\n[DONE] Java layer complete.");
    // End of the loop.
    }
// End of the class SecureZipManager.
}
