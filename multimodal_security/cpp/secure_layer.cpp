// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : multimodal_security  >  secure_layer.cpp
//  2. Program Description        : MULTIMODAL SECURITY — C++ MODULE Layer 3: Binary Encryption
//                                  Layer (Feistel + Checksum) XML Manifest Reader/Writer (no
//                                  JSON) Build: g++ -std=c++17 -O2 -o mmsec_cpp
//                                  secure_layer.cpp. In simple words, this file protects
//                                  files: it packs, checks or verifies data so it cannot be
//                                  changed unnoticed. It is one small, separate piece so each
//                                  language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : - Command-line arguments (argc / argv).
//                                  - Data read from files or the keyboard.
//  7. Output                     : - Text printed to the screen (std::cout).
//                                  - Files written to disk.
//                                  - Exit code 0 means success.
//  8. Variables                  : - MAGIC = [4] = {0x4D, 0x4D, 0x43, 0x2B}
//                                  - VERSION_BYTE = 0x03
//                                  - KEY_BYTES = 32
//                                  - BLOCK_SIZE = 8
//                                  - ROUNDS = 16
//                                  - SHA256_K = [64] = {
//                                  - uint8_t = * blk) {
//                                  - uint8_t = * data, size_t len) {
//                                  - std = ::array<uint8_t,32>& d) {
//                                  - std = ::string& passphrase) {
//  9. Algorithm / Logic          : - rotr(): rotr.
//                                  - ch(): ch.
//                                  - maj(): maj.
//                                  - ep0(): ep0.
//                                  - ep1(): ep1.
//                                  - sig0(): sig0.
//                                  - sig1(): sig1.
//                                  - compress(): compress.
//                                  - SHA256(): sha256.
//                                  - reset(): reset.
//                                  - Execution starts in main().
// 10. Dependencies               : - C++ standard headers: iostream, fstream, sstream, vector,
//                                    array, string, cstring, cstdint, ctime, cassert, cmath,
//                                    algorithm, iomanip, numeric, stdexcept, filesystem, chrono.
//                                  - A C++17 compiler such as g++ or clang++.
// 11. Execution Instructions     : - g++ -std=c++17 secure_layer.cpp -o secure_layer
//                                  - ./secure_layer   (on Windows: secure_layer.exe)
// 12. Assumptions and Limitations: - The required tools listed above are installed and on the
//                                    PATH.
//                                  - Limitation: results are only as good as the data given to
//                                    it.
// 13. Error Handling             : - Uses try/catch blocks to handle runtime problems.
//                                  - Returns a non-zero exit code when something fails.
// =============================================================================================

/*
 * =============================================================
 *  MULTIMODAL SECURITY — C++ MODULE
 *  Layer 3: Binary Encryption Layer (Feistel + Checksum)
 *           XML Manifest Reader/Writer (no JSON)
 * =============================================================
 *
 *  Build:
 *    g++ -std=c++17 -O2 -o mmsec_cpp secure_layer.cpp
 *
 *  Usage:
 *    ./mmsec_cpp encrypt  <input_file> <output_file> <key>
 *    ./mmsec_cpp decrypt  <input_file> <output_file> <key>
 *    ./mmsec_cpp analyse  <file>
 *    ./mmsec_cpp manifest <input_file> <xml_out>
 * =============================================================
 */

// Include `iostream`: the standard tools for printing to the screen and reading the keyboard.
#include <iostream>
// Include `fstream`: the standard tools for reading and writing files.
#include <fstream>
// Include `sstream`: the standard tools for building text in memory.
#include <sstream>
// Include `vector`: the standard tools for growable lists (std::vector).
#include <vector>
// Include `array`: the standard tools for fixed-size arrays.
#include <array>
// Include `string`: the standard tools for text (std::string).
#include <string>
// Include `cstring`: the standard tools for C-style text and memory functions.
#include <cstring>
// Include `cstdint`: the standard tools for fixed-size whole-number types.
#include <cstdint>
// Include `ctime`: the standard tools for date and time.
#include <ctime>
// Include `cassert` (the library <cassert>).
#include <cassert>
// Include `cmath`: the standard tools for maths functions.
#include <cmath>
// Include `algorithm`: the standard tools for ready-made algorithms (sort, find, ...).
#include <algorithm>
// Include `iomanip`: the standard tools for formatting of printed numbers.
#include <iomanip>
// Include `numeric`: the standard tools for number algorithms (sums, ...).
#include <numeric>
// Include `stdexcept`: the standard tools for standard error types.
#include <stdexcept>
// Include `filesystem`: the standard tools for files and folders.
#include <filesystem>
// Include `chrono`: the standard tools for clocks and time.
#include <chrono>

// Use the short name `fs` for `std::filesystem` to save typing.
namespace fs = std::filesystem;

// ─────────────────────────────────────────────
//  CONSTANTS
// ─────────────────────────────────────────────
// Create `MAGIC` of type `uint8_t`, an array (fixed list) with 4 slots, set to `{0x4D, 0x4D, 0x43,
// 0x2B}`.
static constexpr uint8_t  MAGIC[4]    = {0x4D, 0x4D, 0x43, 0x2B}; // "MMC+"
// Create a fixed value (constant) named `VERSION_BYTE` of type `uint8_t` and set it to `0x03`.
static constexpr uint8_t  VERSION_BYTE = 0x03;
// Create a fixed value (constant) named `KEY_BYTES` of type `size_t` and set it to `32`.
static constexpr size_t   KEY_BYTES   = 32;
// Create a fixed value (constant) named `BLOCK_SIZE` of type `size_t` and set it to `8`.
static constexpr size_t   BLOCK_SIZE  = 8;    // 64-bit Feistel block
// Create a fixed value (constant) named `ROUNDS` of type `int` and set it to `16`.
static constexpr int      ROUNDS      = 16;


// ─────────────────────────────────────────────
//  SHA-256 IMPLEMENTATION (pure C++, no openssl)
// ─────────────────────────────────────────────
// Create `SHA256_K` (type `uint32_t`) and fill it with the values listed below.
static const uint32_t SHA256_K[64] = {
    // Data values for the list above:
    // `0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x...`.
    0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,
    // Data values for the list above:
    // `0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x...`.
    0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,
    // Data values for the list above:
    // `0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0x...`.
    0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,
    // Data values for the list above:
    // `0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x...`.
    0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
    // Data values for the list above:
    // `0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0x...`.
    0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,
    // Data values for the list above:
    // `0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x...`.
    0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,
    // Data values for the list above:
    // `0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0x...`.
    0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,
    // Data values for the list above:
    // `0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x...`.
    0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
    // Data values for the list above:
    // `0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x...`.
    0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,
    // Data values for the list above:
    // `0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x...`.
    0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,
    // Data values for the list above: `0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2`.
    0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
// End of the list SHA256_K.
};

// Start defining a class (a blueprint for objects) named `SHA256`.
class SHA256 {
    // Create `state_` of type `std::array<uint32_t, 8>`, with every value starting at zero/empty.
    std::array<uint32_t, 8> state_{};
    // Create `buf_` of type `std::array<uint8_t, 64>`, with every value starting at zero/empty.
    std::array<uint8_t, 64> buf_{};
    // Create a variable named `bitcount_` of type `uint64_t` and set it to `0`.
    uint64_t bitcount_ = 0;
    // Create a variable named `buflen_` of type `size_t` and set it to `0`.
    size_t   buflen_   = 0;

    // A small one-line function `rotr` (name meaning: rotr); takes `uint32_t x, int n` and does:
    // `return (x >> n) | (x << (32 - n));`.
    static uint32_t rotr(uint32_t x, int n) { return (x >> n) | (x << (32 - n)); }
    // A small one-line function `ch` (name meaning: ch); takes `uint32_t e, uint32_t f, uint32_t g`
    // and does: `return (e & f) ^ (~e & g);`.
    static uint32_t ch(uint32_t e, uint32_t f, uint32_t g)  { return (e & f) ^ (~e & g); }
    // A small one-line function `maj` (name meaning: maj); takes `uint32_t a, uint32_t b, uint32_t
    // c` and does: `return (a & b) ^ (a & c) ^ (b & c);`.
    static uint32_t maj(uint32_t a, uint32_t b, uint32_t c) { return (a & b) ^ (a & c) ^ (b & c); }
    // A small one-line function `ep0` (name meaning: ep0); takes `uint32_t a` and does: `return
    // rotr(a,2) ^ rotr(a,13) ^ rotr(a,22);`.
    static uint32_t ep0(uint32_t a) { return rotr(a,2) ^ rotr(a,13) ^ rotr(a,22); }
    // A small one-line function `ep1` (name meaning: ep1); takes `uint32_t e` and does: `return
    // rotr(e,6) ^ rotr(e,11) ^ rotr(e,25);`.
    static uint32_t ep1(uint32_t e) { return rotr(e,6) ^ rotr(e,11) ^ rotr(e,25); }
    // A small one-line function `sig0` (name meaning: sig0); takes `uint32_t x` and does: `return
    // rotr(x,7) ^ rotr(x,18) ^ (x>>3);`.
    static uint32_t sig0(uint32_t x){ return rotr(x,7) ^ rotr(x,18) ^ (x>>3); }
    // A small one-line function `sig1` (name meaning: sig1); takes `uint32_t x` and does: `return
    // rotr(x,17) ^ rotr(x,19) ^ (x>>10);`.
    static uint32_t sig1(uint32_t x){ return rotr(x,17) ^ rotr(x,19) ^ (x>>10); }

    // Start the function `compress` (name meaning: compress). It takes `const uint8_t* blk` and
    // gives back nothing.
    void compress(const uint8_t* blk) {
        // Create `w` of type `uint32_t`, an array (fixed list) with 64 slots.
        uint32_t w[64];
        // Repeat: start with `int i = 0`, keep going while `i < 16`, and after each round do `i++`.
        for (int i = 0; i < 16; i++) {
            // Set `w[i]` to `(uint32_t(blk[i*4]) << 24) | (uint32_t(blk[i*4+1]) << 16)`.
            w[i] = (uint32_t(blk[i*4])   << 24) | (uint32_t(blk[i*4+1]) << 16)
                 // ...continues the instruction from the line above: `| (uint32_t(blk[i*4+2]) << 8)
                 // | uint32_t(blk[i*4+3]);`.
                 | (uint32_t(blk[i*4+2]) <<  8) |  uint32_t(blk[i*4+3]);
        // End of the loop.
        }
        // Repeat: start with `int i = 16`, keep going while `i < 64`, and after each round do
        // `i++`.
        for (int i = 16; i < 64; i++)
            // ...continues the instruction from the line above: `w[i] = sig1(w[i-2]) + w[i-7] +
            // sig0(w[i-15]) + w[i-16];`.
            w[i] = sig1(w[i-2]) + w[i-7] + sig0(w[i-15]) + w[i-16];

        // Create a variable named `a` of type `uint32_t` and set it to
        // `state_[0],b=state_[1],c=state_[2],d=state_[3]`.
        uint32_t a=state_[0],b=state_[1],c=state_[2],d=state_[3];
        // Create a variable named `e` of type `uint32_t` and set it to
        // `state_[4],f=state_[5],g=state_[6],h=state_[7]`.
        uint32_t e=state_[4],f=state_[5],g=state_[6],h=state_[7];
        // Repeat: start with `int i = 0`, keep going while `i < 64`, and after each round do `i++`.
        for (int i = 0; i < 64; i++) {
            // Create a variable named `t1` of type `uint32_t` and set it to `h + ep1(e) + ch(e,f,g)
            // + SHA256_K[i] + w[i]`.
            uint32_t t1 = h + ep1(e) + ch(e,f,g) + SHA256_K[i] + w[i];
            // Create a variable named `t2` of type `uint32_t` and set it to `ep0(a) + maj(a,b,c)`.
            uint32_t t2 = ep0(a) + maj(a,b,c);
            // Do 8 small steps on this line, one after another: `h=g; g=f; f=e; e=d+t1; d=c; c=b;
            // b=a; a=t1+t2;`.
            h=g; g=f; f=e; e=d+t1; d=c; c=b; b=a; a=t1+t2;
        // End of the loop.
        }
        // Do 4 small steps on this line, one after another: `state_[0]+=a; state_[1]+=b;
        // state_[2]+=c; state_[3]+=d;`.
        state_[0]+=a; state_[1]+=b; state_[2]+=c; state_[3]+=d;
        // Do 4 small steps on this line, one after another: `state_[4]+=e; state_[5]+=f;
        // state_[6]+=g; state_[7]+=h;`.
        state_[4]+=e; state_[5]+=f; state_[6]+=g; state_[7]+=h;
    // End of the function compress.
    }

// Everything below can be used from outside this class.
public:
    // A small one-line constructor (setup code) `SHA256` (name meaning: sha256); takes no inputs
    // and does: `reset();`.
    SHA256() { reset(); }
    // Start the function `reset` (name meaning: reset). It takes no inputs and gives back nothing.
    void reset() {
        // Set `state_` to `{0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,`.
        state_ = {0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,
                  // ...continues the instruction from the line above:
                  // `0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19};`.
                  0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19};
        // Do 2 small steps on this line, one after another: `bitcount_ = 0; buflen_ = 0;`.
        bitcount_ = 0; buflen_ = 0;
    // End of the function reset.
    }
    // Start the function `update` (name meaning: update). It takes `const uint8_t* data, size_t
    // len` and gives back nothing.
    void update(const uint8_t* data, size_t len) {
        // Update `bitcount_` using `+=` with `uint64_t(len) * 8`.
        bitcount_ += uint64_t(len) * 8;
        // Keep repeating as long as `len > 0` is true.
        while (len > 0) {
            // Create a variable named `space` of type `size_t` and set it to `64 - buflen_`.
            size_t space = 64 - buflen_;
            // Create a variable named `copy` of type `size_t` and set it to `std::min(space, len)`.
            size_t copy  = std::min(space, len);
            // Call `std::memcpy` (name meaning: memcpy) with `buf_.data() + buflen_, data, copy`.
            std::memcpy(buf_.data() + buflen_, data, copy);
            // Do 3 small steps on this line, one after another: `buflen_ += copy; data += copy; len
            // -= copy;`.
            buflen_ += copy; data += copy; len -= copy;
            // Do 3 small steps on this line, one after another: `if (buflen_ == 64) {
            // compress(buf_.data()); buflen_ = 0; }`.
            if (buflen_ == 64) { compress(buf_.data()); buflen_ = 0; }
        // End of this block.
        }
    // End of the function update.
    }
    // Start the function `digest` (name meaning: digest). It takes no inputs and gives back `32>`.
    std::array<uint8_t, 32> digest() {
        // Create a variable named `tmp` of type `uint8_t` and set it to `0x80`.
        uint8_t tmp = 0x80;
        // Call `update` (name meaning: update) with `&tmp, 1`.
        update(&tmp, 1);
        // Do 3 small steps on this line, one after another: `while (buflen_ != 56) { tmp = 0;
        // update(&tmp, 1); }`.
        while (buflen_ != 56) { tmp = 0; update(&tmp, 1); }
        // Repeat: start with `int i = 7`, keep going while `i >= 0`, and after each round do `i--`.
        // Then do: `tmp = uint8_t(bitcount_ >> (i*8)); update(&tmp, 1);`.
        for (int i = 7; i >= 0; i--) { tmp = uint8_t(bitcount_ >> (i*8)); update(&tmp, 1); }
        // Create `out` of type `std::array<uint8_t, 32>`, with every value starting at zero/empty.
        std::array<uint8_t, 32> out{};
        // Repeat: start with `int i = 0`, keep going while `i < 8`, and after each round do `i++`.
        for (int i = 0; i < 8; i++) {
            // Do 2 small steps on this line, one after another: `out[i*4+0] = state_[i] >> 24;
            // out[i*4+1] = (state_[i] >> 16) & 0xFF;`.
            out[i*4+0] = state_[i] >> 24; out[i*4+1] = (state_[i] >> 16) & 0xFF;
            // Do 2 small steps on this line, one after another: `out[i*4+2] = (state_[i] >> 8) &
            // 0xFF; out[i*4+3] = state_[i] & 0xFF;`.
            out[i*4+2] = (state_[i] >> 8) & 0xFF; out[i*4+3] = state_[i] & 0xFF;
        // End of the loop.
        }
        // Send back `out` as the result.
        return out;
    // End of this block.
    }
    // Start the function `hex` (name meaning: hex). It takes `const std::array<uint8_t,32>& d` and
    // gives back `std::string`.
    static std::string hex(const std::array<uint8_t,32>& d) {
        // Create a variable named `oss` of type `std::ostringstream` (no starting value yet).
        std::ostringstream oss;
        // Go through every item of `d`; each one is called `b`. Then do: `oss << std::hex <<
        // std::setw(2) << std::setfill('0')...`.
        for (auto b : d) oss << std::hex << std::setw(2) << std::setfill('0') << int(b);
        // Send back `oss.str()` as the result.
        return oss.str();
    // End of the function hex.
    }
// End of this block.
};


// ─────────────────────────────────────────────
//  KEY SCHEDULE (derive 16 round sub-keys)
// ─────────────────────────────────────────────
// Start the function `derive_subkeys` (name meaning: derive subkeys). It takes `const std::string&
// passphrase` and gives back `ROUNDS>`.
static std::array<uint32_t, ROUNDS> derive_subkeys(const std::string& passphrase) {
    // Create a variable named `h` of type `SHA256` (no starting value yet).
    SHA256 h;
    // Call `h.update` (name meaning: update) with `reinterpret_cast<const
    // uint8_t*>(passphrase.data()), pass...`.
    h.update(reinterpret_cast<const uint8_t*>(passphrase.data()), passphrase.size());
    // Create a variable named `digest` of type `auto` and set it to `h.digest()`.
    auto digest = h.digest();

    // Create `skeys` of type `std::array<uint32_t, ROUNDS>`, with every value starting at
    // zero/empty.
    std::array<uint32_t, ROUNDS> skeys{};
    // Repeat: start with `int r = 0`, keep going while `r < ROUNDS`, and after each round do `r++`.
    for (int r = 0; r < ROUNDS; r++) {
        // Create a variable named `base` of type `int` and set it to `(r * 2) % 32`.
        int base = (r * 2) % 32;
        // Set `skeys[r]` to `(uint32_t(digest[base]) << 24)`.
        skeys[r] = (uint32_t(digest[base])   << 24)
                 // ...continues the instruction from the line above: `|
                 // (uint32_t(digest[(base+1)%32]) << 16)`.
                 | (uint32_t(digest[(base+1)%32]) << 16)
                 // ...continues the instruction from the line above: `|
                 // (uint32_t(digest[(base+2)%32]) << 8)`.
                 | (uint32_t(digest[(base+2)%32]) <<  8)
                 // ...continues the instruction from the line above: `|
                 // uint32_t(digest[(base+3)%32]);`.
                 |  uint32_t(digest[(base+3)%32]);
        // mix with round constant
        // Update `skeys[r]` using `^=` with `0xA5A5A5A5u ^ uint32_t(r * 0x9E3779B9u)`.
        skeys[r] ^= 0xA5A5A5A5u ^ uint32_t(r * 0x9E3779B9u);
    // End of the loop.
    }
    // Send back `skeys` as the result.
    return skeys;
// End of this block.
}


// ─────────────────────────────────────────────
//  FEISTEL CIPHER (64-bit block, 16 rounds)
// ─────────────────────────────────────────────
// Start the function `F` (name meaning: f). It takes `uint32_t x, uint32_t k` and gives back
// `uint32_t`.
static uint32_t F(uint32_t x, uint32_t k) {
    // Non-linear mixing function
    // Update `x` using `^=` with `k`.
    x ^= k;
    // Update `x` using `+=` with `(x << 6)`.
    x += (x << 6);
    // Update `x` using `^=` with `(x >> 11)`.
    x ^= (x >> 11);
    // Update `x` using `+=` with `(x << 22)`.
    x += (x << 22);
    // Update `x` using `^=` with `k`.
    x ^= k;
    // Send back `x` as the result.
    return x;
// End of the function F.
}

// Start the function `feistel_encrypt` (name meaning: feistel encrypt). It takes `uint64_t block,
// const std::array<uint32_t,ROUNDS>& skeys` and gives back `uint64_t`.
static uint64_t feistel_encrypt(uint64_t block, const std::array<uint32_t,ROUNDS>& skeys) {
    // Create a variable named `L` of type `uint32_t` and set it to `uint32_t(block >> 32)`.
    uint32_t L = uint32_t(block >> 32);
    // Create a variable named `R` of type `uint32_t` and set it to `uint32_t(block & 0xFFFFFFFF)`.
    uint32_t R = uint32_t(block & 0xFFFFFFFF);
    // Repeat: start with `int r = 0`, keep going while `r < ROUNDS`, and after each round do `r++`.
    for (int r = 0; r < ROUNDS; r++) {
        // Create a variable named `tmp` of type `uint32_t` and set it to `R ^ F(L, skeys[r])`.
        uint32_t tmp = R ^ F(L, skeys[r]);
        // Set `R` to `L`.
        R = L;
        // Set `L` to `tmp`.
        L = tmp;
    // End of the loop.
    }
    // Send back `(uint64_t(L) << 32) | R` as the result.
    return (uint64_t(L) << 32) | R;
// End of the function feistel_encrypt.
}

// Start the function `feistel_decrypt` (name meaning: feistel decrypt). It takes `uint64_t block,
// const std::array<uint32_t,ROUNDS>& skeys` and gives back `uint64_t`.
static uint64_t feistel_decrypt(uint64_t block, const std::array<uint32_t,ROUNDS>& skeys) {
    // Create a variable named `L` of type `uint32_t` and set it to `uint32_t(block >> 32)`.
    uint32_t L = uint32_t(block >> 32);
    // Create a variable named `R` of type `uint32_t` and set it to `uint32_t(block & 0xFFFFFFFF)`.
    uint32_t R = uint32_t(block & 0xFFFFFFFF);
    // Each encrypt round: L_new = R ^ F(L, k), R_new = L
    // Inverse:            L_old = R_new, R_old = L_new ^ F(R_new, k)
    // Repeat: start with `int r = ROUNDS - 1`, keep going while `r >= 0`, and after each round do
    // `r--`.
    for (int r = ROUNDS - 1; r >= 0; r--) {
        // Create a variable named `tmp` of type `uint32_t` and set it to `R`.
        uint32_t tmp = R;           // R_new = L_old
        // Set `R` to `L ^ F(R, skeys[r])`.
        R = L ^ F(R, skeys[r]);     // R_old = L_new ^ F(R_new, k)
        // Set `L` to `tmp`.
        L = tmp;                    // L_old
    // End of the loop.
    }
    // Send back `(uint64_t(L) << 32) | R` as the result.
    return (uint64_t(L) << 32) | R;
// End of the function feistel_decrypt.
}


// ─────────────────────────────────────────────
//  CBC-LIKE ENCRYPT / DECRYPT
// ─────────────────────────────────────────────
// Start the function `encrypt_data` (name meaning: encrypt data). It takes no inputs and gives back
// `std::vector<uint8_t>`.
static std::vector<uint8_t> encrypt_data(
    // ...continues the instruction from the line above: `const std::vector<uint8_t>& plaintext,`.
    const std::vector<uint8_t>& plaintext,
    // ...continues the instruction from the line above: `const std::string& passphrase)`.
    const std::string& passphrase)
// ...continues the instruction from the line above: `{`.
{
    // Create a variable named `skeys` of type `auto` and set it to `derive_subkeys(passphrase)`.
    auto skeys = derive_subkeys(passphrase);

    // Pad to block boundary
    // Create a variable named `padded` of type `std::vector<uint8_t>` and set it to `plaintext`.
    std::vector<uint8_t> padded = plaintext;
    // Create a variable named `pad` of type `size_t` and set it to `BLOCK_SIZE - (padded.size() %
    // BLOCK_SIZE)`.
    size_t pad = BLOCK_SIZE - (padded.size() % BLOCK_SIZE);
    // Call `padded.insert` (name meaning: insert) with `padded.end(), pad, uint8_t(pad)`.
    padded.insert(padded.end(), pad, uint8_t(pad));

    // IV = time-seeded
    // Create a variable named `iv` of type `uint64_t` and set it to `uint64_t(std::time(nullptr)) ^
    // 0xDEADBEEFCAFEBABEull`.
    uint64_t iv = uint64_t(std::time(nullptr)) ^ 0xDEADBEEFCAFEBABEull;

    // Create a variable named `cipher` of type `std::vector<uint8_t>` (no starting value yet).
    std::vector<uint8_t> cipher;
    // Prepend IV
    // Repeat: start with `int i = 7`, keep going while `i >= 0`, and after each round do `i--`.
    // Then do: `cipher.push_back(uint8_t(iv >> (i*8)));`.
    for (int i = 7; i >= 0; i--) cipher.push_back(uint8_t(iv >> (i*8)));

    // Create a variable named `prev` of type `uint64_t` and set it to `iv`.
    uint64_t prev = iv;
    // Repeat: start with `size_t i = 0`, keep going while `i < padded.size()`, and after each round
    // do `i += BLOCK_SIZE`.
    for (size_t i = 0; i < padded.size(); i += BLOCK_SIZE) {
        // Create a variable named `block` of type `uint64_t` and set it to `0`.
        uint64_t block = 0;
        // Repeat: start with `int j = 0`, keep going while `j < 8`, and after each round do `j++`.
        for (int j = 0; j < 8; j++)
            // Item `block` = `(block << 8) | padded[i + j];`.
            block = (block << 8) | padded[i + j];
        // Update `block` using `^=` with `prev`.
        block ^= prev;                          // CBC XOR
        // Set `block` to `feistel_encrypt(block, skeys)`.
        block = feistel_encrypt(block, skeys);
        // Set `prev` to `block`.
        prev  = block;
        // Repeat: start with `int j = 7`, keep going while `j >= 0`, and after each round do `j--`.
        // Then do: `cipher.push_back(uint8_t(block >> (j*8)));`.
        for (int j = 7; j >= 0; j--) cipher.push_back(uint8_t(block >> (j*8)));
    // End of the loop.
    }

    // Send back `cipher` as the result.
    return cipher;
// End of this block.
}

// Start the function `decrypt_data` (name meaning: decrypt data). It takes no inputs and gives back
// `std::vector<uint8_t>`.
static std::vector<uint8_t> decrypt_data(
    // ...continues the instruction from the line above: `const std::vector<uint8_t>& ciphertext,`.
    const std::vector<uint8_t>& ciphertext,
    // ...continues the instruction from the line above: `const std::string& passphrase)`.
    const std::string& passphrase)
// ...continues the instruction from the line above: `{`.
{
    // Check whether `ciphertext.size() < BLOCK_SIZE + BLOCK_SIZE`; if true, run what follows.
    if (ciphertext.size() < BLOCK_SIZE + BLOCK_SIZE)
        // ...continues the instruction from the line above: `throw std::runtime_error("Ciphertext
        // too short");`.
        throw std::runtime_error("Ciphertext too short");

    // Create a variable named `skeys` of type `auto` and set it to `derive_subkeys(passphrase)`.
    auto skeys = derive_subkeys(passphrase);

    // Extract IV
    // Create a variable named `prev` of type `uint64_t` and set it to `0`.
    uint64_t prev = 0;
    // Repeat: start with `int i = 0`, keep going while `i < 8`, and after each round do `i++`. Then
    // do: `prev = (prev << 8) | ciphertext[i];`.
    for (int i = 0; i < 8; i++) prev = (prev << 8) | ciphertext[i];

    // Create a variable named `plain` of type `std::vector<uint8_t>` (no starting value yet).
    std::vector<uint8_t> plain;
    // Repeat: start with `size_t i = BLOCK_SIZE`, keep going while `i < ciphertext.size()`, and
    // after each round do `i += BLOCK_SIZE`.
    for (size_t i = BLOCK_SIZE; i < ciphertext.size(); i += BLOCK_SIZE) {
        // Create a variable named `block` of type `uint64_t` and set it to `0`.
        uint64_t block = 0;
        // Repeat: start with `int j = 0`, keep going while `j < 8`, and after each round do `j++`.
        // Then do: `block = (block << 8) | ciphertext[i + j];`.
        for (int j = 0; j < 8; j++) block = (block << 8) | ciphertext[i + j];
        // Create a variable named `dec` of type `uint64_t` and set it to `feistel_decrypt(block,
        // skeys) ^ prev`.
        uint64_t dec = feistel_decrypt(block, skeys) ^ prev;
        // Set `prev` to `block`.
        prev = block;
        // Repeat: start with `int j = 7`, keep going while `j >= 0`, and after each round do `j--`.
        // Then do: `plain.push_back(uint8_t(dec >> (j*8)));`.
        for (int j = 7; j >= 0; j--) plain.push_back(uint8_t(dec >> (j*8)));
    // End of the loop.
    }

    // Remove padding
    // Check whether `!plain.empty()`; if true, run what follows.
    if (!plain.empty()) {
        // Create a variable named `pad` of type `uint8_t` and set it to `plain.back()`.
        uint8_t pad = plain.back();
        // Check whether `pad > 0 && pad <= uint8_t(BLOCK_SIZE)`; if true, run what follows.
        if (pad > 0 && pad <= uint8_t(BLOCK_SIZE))
            // ...continues the instruction from the line above: `plain.resize(plain.size() -
            // pad);`.
            plain.resize(plain.size() - pad);
    // End of the 'if' block.
    }

    // Send back `plain` as the result.
    return plain;
// End of this block.
}


// ─────────────────────────────────────────────
//  CRC-32 CHECKSUM
// ─────────────────────────────────────────────
// Start the function `crc32` (name meaning: crc32). It takes `const std::vector<uint8_t>& data` and
// gives back `uint32_t`.
static uint32_t crc32(const std::vector<uint8_t>& data) {
    // Run the instruction `static const auto table = [](){`.
    static const auto table = [](){
        // Create `t` of type `std::array<uint32_t,256>`, with every value starting at zero/empty.
        std::array<uint32_t,256> t{};
        // Repeat: start with `uint32_t i = 0`, keep going while `i < 256`, and after each round do
        // `i++`.
        for (uint32_t i = 0; i < 256; i++) {
            // Create a variable named `c` of type `uint32_t` and set it to `i`.
            uint32_t c = i;
            // Repeat: start with `int j = 0`, keep going while `j < 8`, and after each round do
            // `j++`. Then do: `c = (c & 1) ? (0xEDB88320u ^ (c >> 1)) : (c >> 1);`.
            for (int j = 0; j < 8; j++) c = (c & 1) ? (0xEDB88320u ^ (c >> 1)) : (c >> 1);
            // Set `t[i]` to `c`.
            t[i] = c;
        // End of the loop.
        }
        // Send back `t` as the result.
        return t;
    // Run the instruction `}();`.
    }();
    // Create a variable named `crc` of type `uint32_t` and set it to `0xFFFFFFFFu`.
    uint32_t crc = 0xFFFFFFFFu;
    // Go through every item of `data`; each one is called `b`. Then do: `crc = table[(crc ^ b) &
    // 0xFF] ^ (crc >> 8);`.
    for (auto b : data) crc = table[(crc ^ b) & 0xFF] ^ (crc >> 8);
    // Send back `crc ^ 0xFFFFFFFFu` as the result.
    return crc ^ 0xFFFFFFFFu;
// End of the function crc32.
}


// ─────────────────────────────────────────────
//  BINARY ENTROPY
// ─────────────────────────────────────────────
// Start the function `entropy` (name meaning: entropy). It takes `const std::vector<uint8_t>& data`
// and gives back `double`.
static double entropy(const std::vector<uint8_t>& data) {
    // Check whether `data.empty()`; if true, run what follows. Then do: `return 0.0;`.
    if (data.empty()) return 0.0;
    // Create `freq` of type `std::array<size_t,256>`, with every value starting at zero/empty.
    std::array<size_t,256> freq{};
    // Go through every item of `data`; each one is called `b`. Then do: `freq[b]++;`.
    for (auto b : data) freq[b]++;
    // Create a variable named `H` of type `double` and set it to `0.0`.
    double H = 0.0;
    // Create a variable named `n` of type `double` and set it to `double(data.size())`.
    double n = double(data.size());
    // Go through every item of `freq`; each one is called `f`.
    for (auto f : freq) {
        // Check whether `f > 0`; if true, run what follows.
        if (f > 0) {
            // Create a variable named `p` of type `double` and set it to `f / n`.
            double p = f / n;
            // Update `H` using `-=` with `p * std::log2(p)`.
            H -= p * std::log2(p);
        // End of the 'if' block.
        }
    // End of the loop.
    }
    // Send back `H` as the result.
    return H;
// End of this block.
}


// ─────────────────────────────────────────────
//  FILE I/O HELPERS
// ─────────────────────────────────────────────
// Start the function `read_file` (name meaning: read file). It takes `const std::string& path` and
// gives back `std::vector<uint8_t>`.
static std::vector<uint8_t> read_file(const std::string& path) {
    // Run the instruction `std::ifstream f(path, std::ios::binary);`.
    std::ifstream f(path, std::ios::binary);
    // Check whether `!f`; if true, run what follows. Then do: `throw std::runtime_error("Cannot
    // open: " + path);`.
    if (!f) throw std::runtime_error("Cannot open: " + path);
    // Send back `{std::istreambuf_iterator<char>(f), {}}` as the result.
    return {std::istreambuf_iterator<char>(f), {}};
// End of this block.
}

// Start the function `write_file` (name meaning: write file). It takes `const std::string& path,
// const std::vector<uint8_t>& data` and gives back nothing.
static void write_file(const std::string& path, const std::vector<uint8_t>& data) {
    // Run the instruction `std::ofstream f(path, std::ios::binary);`.
    std::ofstream f(path, std::ios::binary);
    // Check whether `!f`; if true, run what follows. Then do: `throw std::runtime_error("Cannot
    // write: " + path);`.
    if (!f) throw std::runtime_error("Cannot write: " + path);
    // Call `f.write` (name meaning: write) with `reinterpret_cast<const char*>(data.data()),
    // data.size()`.
    f.write(reinterpret_cast<const char*>(data.data()), data.size());
// End of the function write_file.
}

// Start the function `sha256_file` (name meaning: sha256 file). It takes `const std::string& path`
// and gives back `std::string`.
static std::string sha256_file(const std::string& path) {
    // Create a variable named `data` of type `auto` and set it to `read_file(path)`.
    auto data = read_file(path);
    // Create a variable named `h` of type `SHA256` (no starting value yet).
    SHA256 h;
    // Call `h.update` (name meaning: update) with `data.data(), data.size()`.
    h.update(data.data(), data.size());
    // Send back `SHA256::hex(h.digest())` as the result.
    return SHA256::hex(h.digest());
// End of the function sha256_file.
}

// Start the function `hex_str` (name meaning: hex str). It takes `uint32_t v` and gives back
// `std::string`.
static std::string hex_str(uint32_t v) {
    // Create a variable named `oss` of type `std::ostringstream` (no starting value yet).
    std::ostringstream oss;
    // Run the instruction `oss << std::hex << std::setw(8) << std::setfill('0') << v;`.
    oss << std::hex << std::setw(8) << std::setfill('0') << v;
    // Send back `oss.str()` as the result.
    return oss.str();
// End of the function hex_str.
}


// ─────────────────────────────────────────────
//  XML MANIFEST WRITER
// ─────────────────────────────────────────────
// Start the function `write_xml_manifest` (name meaning: write xml manifest). It takes no inputs
// and gives back nothing.
static void write_xml_manifest(
    // ...continues the instruction from the line above: `const std::string& input_path,`.
    const std::string& input_path,
    // ...continues the instruction from the line above: `const std::string& xml_path,`.
    const std::string& xml_path,
    // ...continues the instruction from the line above: `const std::string& sha256_val,`.
    const std::string& sha256_val,
    // Data values for the list above: `uint32_t crc_val,`.
    uint32_t           crc_val,
    // Data values for the list above: `double ent,`.
    double             ent,
    // ...continues the instruction from the line above: `size_t file_size)`.
    size_t             file_size)
// ...continues the instruction from the line above: `{`.
{
    // Create a variable named `now` of type `auto` and set it to
    // `std::chrono::system_clock::now()`.
    auto now   = std::chrono::system_clock::now();
    // Create a variable named `epoch` of type `auto` and set it to
    // `std::chrono::duration_cast<std::chrono::seconds>()` (this instruction continues on the next
    // lines).
    auto epoch = std::chrono::duration_cast<std::chrono::seconds>(
                     // ...continues the instruction from the line above:
                     // `now.time_since_epoch()).count();`.
                     now.time_since_epoch()).count();

    // Run the instruction `std::ofstream xml(xml_path);`.
    std::ofstream xml(xml_path);
    // Check whether `!xml`; if true, run what follows. Then do: `throw std::runtime_error("Cannot
    // write XML: " + xml_...`.
    if (!xml) throw std::runtime_error("Cannot write XML: " + xml_path);

    // Run the instruction `xml << R"(<?xml version="1.0" encoding="UTF-8"?>)" << "\n"`.
    xml << R"(<?xml version="1.0" encoding="UTF-8"?>)" << "\n"
        // ...continues the instruction from the line above: `<< R"(<MultimodalSecurityManifest
        // language="C++" layer="3">)" << "\n"`.
        << R"(<MultimodalSecurityManifest language="C++" layer="3">)" << "\n"
        // ...continues the instruction from the line above: `<< " <Timestamp>" << epoch <<
        // "</Timestamp>\n"`.
        << "  <Timestamp>" << epoch << "</Timestamp>\n"
        // ...continues the instruction from the line above: `<< " <Description>Feistel-cipher
        // encryption with CRC-32 and SHA-256...`.
        << "  <Description>Feistel-cipher encryption with CRC-32 and SHA-256 verification</Description>\n"
        // ...continues the instruction from the line above: `<< "\n"`.
        << "\n"
        // ...continues the instruction from the line above: `<< " <Encryption>\n"`.
        << "  <Encryption>\n"
        // ...continues the instruction from the line above: `<< "
        // <Algorithm>Feistel-CBC-16rounds</Algorithm>\n"`.
        << "    <Algorithm>Feistel-CBC-16rounds</Algorithm>\n"
        // ...continues the instruction from the line above: `<< "
        // <BlockSizeBits>64</BlockSizeBits>\n"`.
        << "    <BlockSizeBits>64</BlockSizeBits>\n"
        // ...continues the instruction from the line above: `<< " <Rounds>16</Rounds>\n"`.
        << "    <Rounds>16</Rounds>\n"
        // ...continues the instruction from the line above: `<< " <KeyDerivation>SHA256-based
        // schedule</KeyDerivation>\n"`.
        << "    <KeyDerivation>SHA256-based schedule</KeyDerivation>\n"
        // ...continues the instruction from the line above: `<< " <Padding>PKCS7</Padding>\n"`.
        << "    <Padding>PKCS7</Padding>\n"
        // ...continues the instruction from the line above: `<< " </Encryption>\n"`.
        << "  </Encryption>\n"
        // ...continues the instruction from the line above: `<< "\n"`.
        << "\n"
        // ...continues the instruction from the line above: `<< " <FileInfo>\n"`.
        << "  <FileInfo>\n"
        // ...continues the instruction from the line above: `<< " <Filename>" <<
        // fs::path(input_path).filename().string() << "</...`.
        << "    <Filename>" << fs::path(input_path).filename().string() << "</Filename>\n"
        // ...continues the instruction from the line above: `<< " <SizeBytes>" << file_size <<
        // "</SizeBytes>\n"`.
        << "    <SizeBytes>" << file_size << "</SizeBytes>\n"
        // ...continues the instruction from the line above: `<< " <SHA256>" << sha256_val <<
        // "</SHA256>\n"`.
        << "    <SHA256>" << sha256_val << "</SHA256>\n"
        // ...continues the instruction from the line above: `<< " <CRC32>" << hex_str(crc_val) <<
        // "</CRC32>\n"`.
        << "    <CRC32>" << hex_str(crc_val) << "</CRC32>\n"
        // ...continues the instruction from the line above: `<< " <Entropy>" << std::fixed <<
        // std::setprecision(6) << ent << "</...`.
        << "    <Entropy>" << std::fixed << std::setprecision(6) << ent << "</Entropy>\n"
        // ...continues the instruction from the line above: `<< " </FileInfo>\n"`.
        << "  </FileInfo>\n"
        // ...continues the instruction from the line above: `<< "\n"`.
        << "\n"
        // ...continues the instruction from the line above: `<< " <SecurityChecks>\n"`.
        << "  <SecurityChecks>\n"
        // ...continues the instruction from the line above: `<< "
        // <MagicHeader>4D4D432B</MagicHeader>\n"`.
        << "    <MagicHeader>4D4D432B</MagicHeader>\n"
        // ...continues the instruction from the line above: `<< "
        // <VersionByte>03</VersionByte>\n"`.
        << "    <VersionByte>03</VersionByte>\n"
        // ...continues the instruction from the line above: `<< " <IntegrityAlgo>CRC32 +
        // SHA256</IntegrityAlgo>\n"`.
        << "    <IntegrityAlgo>CRC32 + SHA256</IntegrityAlgo>\n"
        // ...continues the instruction from the line above: `<< " <CipherMode>CBC</CipherMode>\n"`.
        << "    <CipherMode>CBC</CipherMode>\n"
        // ...continues the instruction from the line above: `<< " </SecurityChecks>\n"`.
        << "  </SecurityChecks>\n"
        // ...continues the instruction from the line above: `<<
        // "</MultimodalSecurityManifest>\n";`.
        << "</MultimodalSecurityManifest>\n";

    // Call `xml.close` (name meaning: close).
    xml.close();
    // Print `" [XML] Manifest written → " << fs::path(xml_path).filename() << "\n"` to the screen.
    std::cout << "  [XML] Manifest written → " << fs::path(xml_path).filename() << "\n";
// End of this block.
}


// ─────────────────────────────────────────────
//  ENCRYPT COMMAND
// ─────────────────────────────────────────────
// Start the function `cmd_encrypt` (name meaning: cmd encrypt). It takes `const std::string& in,
// const std::string& out, const std:...` and gives back nothing.
static void cmd_encrypt(const std::string& in, const std::string& out, const std::string& key) {
    // Print `"\n[ENCRYPT] " << in << " → " << out << "\n"` to the screen.
    std::cout << "\n[ENCRYPT] " << in << " → " << out << "\n";
    // Create a variable named `plain` of type `auto` and set it to `read_file(in)`.
    auto plain  = read_file(in);
    // Create a variable named `cipher` of type `auto` and set it to `encrypt_data(plain, key)`.
    auto cipher = encrypt_data(plain, key);

    // Create a variable named `crc_plain` of type `uint32_t` and set it to `crc32(plain)`.
    uint32_t crc_plain  = crc32(plain);
    // Create a variable named `crc_cipher` of type `uint32_t` and set it to `crc32(cipher)`.
    uint32_t crc_cipher = crc32(cipher);

    // Write header: MAGIC(4) + VERSION(1) + CRC_PLAIN(4) + data
    // Create a variable named `blob` of type `std::vector<uint8_t>` (no starting value yet).
    std::vector<uint8_t> blob;
    // Call `blob.insert` (name meaning: insert) with `blob.end(), MAGIC, MAGIC + 4`.
    blob.insert(blob.end(), MAGIC, MAGIC + 4);
    // Call `blob.push_back` (name meaning: push back) with `VERSION_BYTE`.
    blob.push_back(VERSION_BYTE);
    // Call `blob.push_back` (name meaning: push back) with `uint8_t(crc_plain >> 24)`.
    blob.push_back(uint8_t(crc_plain >> 24));
    // Call `blob.push_back` (name meaning: push back) with `uint8_t(crc_plain >> 16)`.
    blob.push_back(uint8_t(crc_plain >> 16));
    // Call `blob.push_back` (name meaning: push back) with `uint8_t(crc_plain >> 8)`.
    blob.push_back(uint8_t(crc_plain >>  8));
    // Call `blob.push_back` (name meaning: push back) with `uint8_t(crc_plain)`.
    blob.push_back(uint8_t(crc_plain));
    // Call `blob.insert` (name meaning: insert) with `blob.end(), cipher.begin(), cipher.end()`.
    blob.insert(blob.end(), cipher.begin(), cipher.end());
    // Call `write_file` (name meaning: write file) with `out, blob`.
    write_file(out, blob);

    // Create a variable named `h` of type `SHA256` (no starting value yet).
    SHA256 h;
    // Call `h.update` (name meaning: update) with `blob.data(), blob.size()`.
    h.update(blob.data(), blob.size());
    // Create a variable named `dig` of type `auto` and set it to `h.digest()`.
    auto dig = h.digest();

    // Print `" Input size : " << plain.size() << " bytes\n"` to the screen.
    std::cout << "  Input size   : " << plain.size()  << " bytes\n";
    // Print `" Output size : " << blob.size() << " bytes\n"` to the screen.
    std::cout << "  Output size  : " << blob.size()   << " bytes\n";
    // Print `" CRC32 plain : " << hex_str(crc_plain) << "\n"` to the screen.
    std::cout << "  CRC32 plain  : " << hex_str(crc_plain)  << "\n";
    // Print `" CRC32 cipher : " << hex_str(crc_cipher) << "\n"` to the screen.
    std::cout << "  CRC32 cipher : " << hex_str(crc_cipher) << "\n";
    // Print `" SHA256 : " << SHA256::hex(dig) << "\n"` to the screen.
    std::cout << "  SHA256       : " << SHA256::hex(dig) << "\n";
// End of the function cmd_encrypt.
}


// ─────────────────────────────────────────────
//  DECRYPT COMMAND
// ─────────────────────────────────────────────
// Start the function `cmd_decrypt` (name meaning: cmd decrypt). It takes `const std::string& in,
// const std::string& out, const std:...` and gives back nothing.
static void cmd_decrypt(const std::string& in, const std::string& out, const std::string& key) {
    // Print `"\n[DECRYPT] " << in << " → " << out << "\n"` to the screen.
    std::cout << "\n[DECRYPT] " << in << " → " << out << "\n";
    // Create a variable named `blob` of type `auto` and set it to `read_file(in)`.
    auto blob = read_file(in);

    // Verify magic
    // Check whether `blob.size() < 9 || std::memcmp(blob.data(), MAGIC, 4) != 0`; if true, run what
    // follows.
    if (blob.size() < 9 || std::memcmp(blob.data(), MAGIC, 4) != 0)
        // ...continues the instruction from the line above: `throw std::runtime_error("Invalid
        // magic header");`.
        throw std::runtime_error("Invalid magic header");
    // Check whether `blob[4] != VERSION_BYTE`; if true, run what follows.
    if (blob[4] != VERSION_BYTE)
        // ...continues the instruction from the line above: `throw std::runtime_error("Unsupported
        // version byte");`.
        throw std::runtime_error("Unsupported version byte");

    // Run the instruction `uint32_t stored_crc = (uint32_t(blob[5]) << 24) | (uint32_t(blob[6]...`.
    uint32_t stored_crc = (uint32_t(blob[5]) << 24) | (uint32_t(blob[6]) << 16)
                        // ...continues the instruction from the line above: `| (uint32_t(blob[7])
                        // << 8) | uint32_t(blob[8]);`.
                        | (uint32_t(blob[7]) <<  8) |  uint32_t(blob[8]);

    // Run the instruction `std::vector<uint8_t> cipher(blob.begin() + 9, blob.end());`.
    std::vector<uint8_t> cipher(blob.begin() + 9, blob.end());
    // Create a variable named `plain` of type `auto` and set it to `decrypt_data(cipher, key)`.
    auto plain = decrypt_data(cipher, key);

    // Create a variable named `calc_crc` of type `uint32_t` and set it to `crc32(plain)`.
    uint32_t calc_crc = crc32(plain);
    // Create a variable named `ok` of type `bool` and set it to `(stored_crc == calc_crc)`.
    bool ok = (stored_crc == calc_crc);

    // Print `" Stored CRC32 : " << hex_str(stored_crc) << "\n"` to the screen.
    std::cout << "  Stored CRC32 : " << hex_str(stored_crc) << "\n";
    // Print `" Actual CRC32 : " << hex_str(calc_crc) << "\n"` to the screen.
    std::cout << "  Actual CRC32 : " << hex_str(calc_crc)   << "\n";
    // Print `" Integrity : " << (ok ? "✓ PASS" : "✗ FAIL") << "\n"` to the screen.
    std::cout << "  Integrity    : " << (ok ? "✓ PASS" : "✗ FAIL") << "\n";

    // Check whether `!ok`; if true, run what follows. Then do: `throw std::runtime_error("CRC32
    // mismatch — data tamp...`.
    if (!ok) throw std::runtime_error("CRC32 mismatch — data tampered or wrong key!");
    // Call `write_file` (name meaning: write file) with `out, plain`.
    write_file(out, plain);
    // Print `" Output size : " << plain.size() << " bytes\n"` to the screen.
    std::cout << "  Output size  : " << plain.size() << " bytes\n";
// End of the function cmd_decrypt.
}


// ─────────────────────────────────────────────
//  ANALYSE COMMAND
// ─────────────────────────────────────────────
// Start the function `cmd_analyse` (name meaning: cmd analyse). It takes `const std::string& in`
// and gives back nothing.
static void cmd_analyse(const std::string& in) {
    // Print `"\n[ANALYSE] " << in << "\n"` to the screen.
    std::cout << "\n[ANALYSE] " << in << "\n";
    // Create a variable named `data` of type `auto` and set it to `read_file(in)`.
    auto data = read_file(in);
    // Create a variable named `ent` of type `double` and set it to `entropy(data)`.
    double ent = entropy(data);
    // Create a variable named `crc` of type `uint32_t` and set it to `crc32(data)`.
    uint32_t crc = crc32(data);
    // Print `" Size : " << data.size() << " bytes\n"` to the screen.
    std::cout << "  Size    : " << data.size() << " bytes\n";
    // Print `" Entropy : " << std::fixed << std::setprecision(4) << ent << " bit...` to the screen.
    std::cout << "  Entropy : " << std::fixed << std::setprecision(4) << ent << " bits/byte\n";
    // Print `" CRC32 : " << hex_str(crc) << "\n"` to the screen.
    std::cout << "  CRC32   : " << hex_str(crc) << "\n";
    // Print `" SHA256 : " << sha256_file(in) << "\n"` to the screen.
    std::cout << "  SHA256  : " << sha256_file(in) << "\n";
    // Print `" Quality : " << (ent > 7.5 ? "HIGH ✓" : "LOW ✗") << "\n"` to the screen.
    std::cout << "  Quality : " << (ent > 7.5 ? "HIGH ✓" : "LOW ✗") << "\n";
// End of the function cmd_analyse.
}


// ─────────────────────────────────────────────
//  MANIFEST COMMAND
// ─────────────────────────────────────────────
// Start the function `cmd_manifest` (name meaning: cmd manifest). It takes `const std::string& in,
// const std::string& xml_out` and gives back nothing.
static void cmd_manifest(const std::string& in, const std::string& xml_out) {
    // Create a variable named `data` of type `auto` and set it to `read_file(in)`.
    auto data  = read_file(in);
    // Create a variable named `ent` of type `double` and set it to `entropy(data)`.
    double ent = entropy(data);
    // Create a variable named `crc` of type `uint32_t` and set it to `crc32(data)`.
    uint32_t crc = crc32(data);
    // Create a variable named `h` of type `SHA256` (no starting value yet).
    SHA256 h;
    // Call `h.update` (name meaning: update) with `data.data(), data.size()`.
    h.update(data.data(), data.size());
    // Create a variable named `dig` of type `auto` and set it to `h.digest()`.
    auto dig = h.digest();
    // Call `write_xml_manifest` (name meaning: write xml manifest) with `in, xml_out,
    // SHA256::hex(dig), crc, ent, data.size()`.
    write_xml_manifest(in, xml_out, SHA256::hex(dig), crc, ent, data.size());
// End of the function cmd_manifest.
}


// ─────────────────────────────────────────────
//  SELF-TEST
// ─────────────────────────────────────────────
// Start the function `self_test` (name meaning: self test). It takes no inputs and gives back
// nothing.
static void self_test() {
    // Print `"\n[SELF-TEST] Running Feistel cipher round-trip …\n"` to the screen.
    std::cout << "\n[SELF-TEST] Running Feistel cipher round-trip …\n";
    // Create a variable named `key` of type `std::string` and set it to
    // `"TestKey#2025!MultimodalSecurity"`.
    std::string key = "TestKey#2025!MultimodalSecurity";
    // Run the instruction `std::vector<uint8_t> msg(64);`.
    std::vector<uint8_t> msg(64);
    // Repeat: start with `size_t i = 0`, keep going while `i < msg.size()`, and after each round do
    // `i++`. Then do: `msg[i] = uint8_t(i * 7 + 13);`.
    for (size_t i = 0; i < msg.size(); i++) msg[i] = uint8_t(i * 7 + 13);

    // Create a variable named `cipher` of type `auto` and set it to `encrypt_data(msg, key)`.
    auto cipher = encrypt_data(msg, key);
    // Create a variable named `plain2` of type `auto` and set it to `decrypt_data(cipher, key)`.
    auto plain2 = decrypt_data(cipher, key);

    // Create a variable named `ok` of type `bool` and set it to `(plain2 == msg)`.
    bool ok = (plain2 == msg);
    // Print `" Feistel round-trip: " << (ok ? "✓ PASS" : "✗ FAIL") << "\n"` to the screen.
    std::cout << "  Feistel round-trip: " << (ok ? "✓ PASS" : "✗ FAIL") << "\n";

    // CRC-32 sanity
    // Run the instruction `std::vector<uint8_t> zeros(256, 0);`.
    std::vector<uint8_t> zeros(256, 0);
    // Create a variable named `crc_z` of type `uint32_t` and set it to `crc32(zeros)`.
    uint32_t crc_z = crc32(zeros);
    // Print `" CRC-32 sanity: " << (crc_z != 0 ? "✓ PASS" : "✗ FAIL") << "\n"` to the screen.
    std::cout << "  CRC-32 sanity:      " << (crc_z != 0 ? "✓ PASS" : "✗ FAIL") << "\n";
// End of the function self_test.
}


// ─────────────────────────────────────────────
//  MAIN (standalone demo if no args)
// ─────────────────────────────────────────────
// The main function: the program starts running here.
int main(int argc, char* argv[]) {
    // Print `"============================================================\n"` to the screen.
    std::cout << "============================================================\n"
              // ...continues the instruction from the line above: `<< " MULTIMODAL SECURITY — C++
              // LAYER 3\n"`.
              << "  MULTIMODAL SECURITY — C++ LAYER 3\n"
              // ...continues the instruction from the line above: `<< " Feistel Cipher + CRC-32 +
              // SHA-256 + XML Manifest\n"`.
              << "  Feistel Cipher + CRC-32 + SHA-256 + XML Manifest\n"
              // ...continues the instruction from the line above: `<<
              // "============================================================\n";`.
              << "============================================================\n";

    // Self-test always runs
    // Call `self_test` (name meaning: self test).
    self_test();

    // Check whether `argc < 2`; if true, run what follows.
    if (argc < 2) {
        // Print `"\nUsage:\n"` to the screen.
        std::cout << "\nUsage:\n"
                  // ...continues the instruction from the line above: `<< " mmsec_cpp encrypt <in>
                  // <out> <key>\n"`.
                  << "  mmsec_cpp encrypt  <in> <out> <key>\n"
                  // ...continues the instruction from the line above: `<< " mmsec_cpp decrypt <in>
                  // <out> <key>\n"`.
                  << "  mmsec_cpp decrypt  <in> <out> <key>\n"
                  // ...continues the instruction from the line above: `<< " mmsec_cpp analyse
                  // <file>\n"`.
                  << "  mmsec_cpp analyse  <file>\n"
                  // ...continues the instruction from the line above: `<< " mmsec_cpp manifest
                  // <file> <xml_out>\n";`.
                  << "  mmsec_cpp manifest <file> <xml_out>\n";
        // Send back `0` as the result.
        return 0;
    // End of the 'if' block.
    }

    // Try the following steps; if an error happens, jump to the 'catch' part.
    try {
        // Create a variable named `cmd` of type `std::string` and set it to `argv[1]`.
        std::string cmd = argv[1];
        // Check whether `cmd == "encrypt" && argc == 5`; if true, run what follows.
        if (cmd == "encrypt" && argc == 5)
            // ...continues the instruction from the line above: `cmd_encrypt(argv[2], argv[3],
            // argv[4]);`.
            cmd_encrypt(argv[2], argv[3], argv[4]);
        // Otherwise, check whether `cmd == "decrypt" && argc == 5`; if true, run what follows.
        else if (cmd == "decrypt" && argc == 5)
            // ...continues the instruction from the line above: `cmd_decrypt(argv[2], argv[3],
            // argv[4]);`.
            cmd_decrypt(argv[2], argv[3], argv[4]);
        // Otherwise, check whether `cmd == "analyse" && argc == 3`; if true, run what follows.
        else if (cmd == "analyse" && argc == 3)
            // ...continues the instruction from the line above: `cmd_analyse(argv[2]);`.
            cmd_analyse(argv[2]);
        // Otherwise, check whether `cmd == "manifest" && argc == 4`; if true, run what follows.
        else if (cmd == "manifest" && argc == 4)
            // ...continues the instruction from the line above: `cmd_manifest(argv[2], argv[3]);`.
            cmd_manifest(argv[2], argv[3]);
        // Otherwise (if none of the checks above were true), run the block below.
        else {
            // Print `"Unknown command or wrong arg count.\n"` to the error output.
            std::cerr << "Unknown command or wrong arg count.\n";
            // End the program and report failure (a non-zero code means something went wrong).
            return 1;
        // End of the 'else' block.
        }
    // If an error (`const std::exception& ex`) happened in the 'try' part, run this block instead
    // of crashing.
    } catch (const std::exception& ex) {
        // Print `"[ERROR] " << ex.what() << "\n"` to the error output.
        std::cerr << "[ERROR] " << ex.what() << "\n";
        // End the program and report failure (a non-zero code means something went wrong).
        return 1;
    // End of the error-handling (catch) block.
    }

    // Print `"\n[DONE] C++ layer complete.\n"` to the screen.
    std::cout << "\n[DONE] C++ layer complete.\n";
    // End the program and report success (0 means everything went fine).
    return 0;
// End of the main function.
}
