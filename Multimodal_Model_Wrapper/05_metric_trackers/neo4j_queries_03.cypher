// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_queries_03.cypher
//  2. Program Description        : A Neo4j Cypher script that asks questions (queries) of the
//                                  Neo4j graph database to read information back for the
//                                  'multimodal model wrapper' project (metric trackers area).
//                                  It is one small, separate piece so each language/part can
//                                  be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : Rows of results returned by each query.
//  8. Variables                  : - namespace = 'multimodal_03_03'
//                                  - batchSize = 128
//                                  - threshold = 0.264
//                                  - maxDepth = 10
//                                  - timeoutSeconds = 17
//                                  - region = 'us-east'
//                                  - epoch = 4
//                                  - version = '2.4.0'
//  9. Algorithm / Logic          : - Contains about 0 CREATE and 44 MATCH statements.
//                                  - CREATE adds new data; MATCH finds existing data; RETURN
//                                    shows the result.
//                                  - Node labels used: Multimodal.
// 10. Dependencies               : - Neo4j database (version 5 recommended).
//                                  - cypher-shell (comes with Neo4j).
// 11. Execution Instructions     : cypher-shell -u neo4j -p <password> -f
//                                  neo4j_queries_03.cypher
// 12. Assumptions and Limitations: - The required tools listed above are installed and on the
//                                    PATH.
//                                  - Limitation: results are only as good as the data given to
//                                    it.
// 13. Error Handling             : No special error handling. If a statement fails, Neo4j
//                                  stops and reports the error.
// =============================================================================================

// Set the parameter `namespace` to `'multimodal_03_03'`; later lines can use it as $namespace.
:param namespace => 'multimodal_03_03';
// Set the parameter `batchSize` to `128`; later lines can use it as $batchSize.
:param batchSize => 128;
// Set the parameter `threshold` to `0.264`; later lines can use it as $threshold.
:param threshold => 0.264;
// Set the parameter `maxDepth` to `10`; later lines can use it as $maxDepth.
:param maxDepth => 10;
// Set the parameter `timeoutSeconds` to `17`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 17;
// Set the parameter `region` to `'us-east'`; later lines can use it as $region.
:param region => 'us-east';
// Set the parameter `epoch` to `4`; later lines can use it as $epoch.
:param epoch => 4;
// Set the parameter `version` to `'2.4.0'`; later lines can use it as $version.
:param version => '2.4.0';

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'active'`.
WHERE n.status = 'active'
  // And also where `n.score >= 0.167`.
  AND n.score >= 0.167
  // And also where `n.priority <= 8`.
  AND n.priority <= 8
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_000, collect(m.identifier) AS
// targets_000`.
WITH n, count(r) AS degree_000, collect(m.identifier) AS targets_000
// Keep only results where `degree_000 > 3`.
WHERE degree_000 > 3
// Give back (show) these results: `n.identifier AS id_000`.
RETURN n.identifier AS id_000,
       // ...also include the value `n.status AS status_000` in the results.
       n.status AS status_000,
       // ...also include the value `n.score AS score_000` in the results.
       n.score AS score_000,
       // ...also include the value `degree_000` in the results.
       degree_000,
       // ...also include the value `targets_000` in the results.
       targets_000
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'pending'`.
WHERE n.status = 'pending'
  // And also where `n.score >= 0.567`.
  AND n.score >= 0.567
  // And also where `n.priority <= 9`.
  AND n.priority <= 9
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_001, collect(m.identifier) AS
// targets_001`.
WITH n, count(r) AS degree_001, collect(m.identifier) AS targets_001
// Keep only results where `degree_001 > 3`.
WHERE degree_001 > 3
// Give back (show) these results: `n.identifier AS id_001`.
RETURN n.identifier AS id_001,
       // ...also include the value `n.status AS status_001` in the results.
       n.status AS status_001,
       // ...also include the value `n.score AS score_001` in the results.
       n.score AS score_001,
       // ...also include the value `degree_001` in the results.
       degree_001,
       // ...also include the value `targets_001` in the results.
       targets_001
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'degraded'`.
WHERE n.status = 'degraded'
  // And also where `n.score >= 0.465`.
  AND n.score >= 0.465
  // And also where `n.priority <= 9`.
  AND n.priority <= 9
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_002, collect(m.identifier) AS
// targets_002`.
WITH n, count(r) AS degree_002, collect(m.identifier) AS targets_002
// Keep only results where `degree_002 > 0`.
WHERE degree_002 > 0
// Give back (show) these results: `n.identifier AS id_002`.
RETURN n.identifier AS id_002,
       // ...also include the value `n.status AS status_002` in the results.
       n.status AS status_002,
       // ...also include the value `n.score AS score_002` in the results.
       n.score AS score_002,
       // ...also include the value `degree_002` in the results.
       degree_002,
       // ...also include the value `targets_002` in the results.
       targets_002
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'pending'`.
WHERE n.status = 'pending'
  // And also where `n.score >= 0.301`.
  AND n.score >= 0.301
  // And also where `n.priority <= 9`.
  AND n.priority <= 9
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_003, collect(m.identifier) AS
// targets_003`.
WITH n, count(r) AS degree_003, collect(m.identifier) AS targets_003
// Keep only results where `degree_003 > 3`.
WHERE degree_003 > 3
// Give back (show) these results: `n.identifier AS id_003`.
RETURN n.identifier AS id_003,
       // ...also include the value `n.status AS status_003` in the results.
       n.status AS status_003,
       // ...also include the value `n.score AS score_003` in the results.
       n.score AS score_003,
       // ...also include the value `degree_003` in the results.
       degree_003,
       // ...also include the value `targets_003` in the results.
       targets_003
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 100 results.
LIMIT 100;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'failed'`.
WHERE n.status = 'failed'
  // And also where `n.score >= 0.43`.
  AND n.score >= 0.43
  // And also where `n.priority <= 10`.
  AND n.priority <= 10
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_004, collect(m.identifier) AS
// targets_004`.
WITH n, count(r) AS degree_004, collect(m.identifier) AS targets_004
// Keep only results where `degree_004 > 3`.
WHERE degree_004 > 3
// Give back (show) these results: `n.identifier AS id_004`.
RETURN n.identifier AS id_004,
       // ...also include the value `n.status AS status_004` in the results.
       n.status AS status_004,
       // ...also include the value `n.score AS score_004` in the results.
       n.score AS score_004,
       // ...also include the value `degree_004` in the results.
       degree_004,
       // ...also include the value `targets_004` in the results.
       targets_004
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'completed'`.
WHERE n.status = 'completed'
  // And also where `n.score >= 0.384`.
  AND n.score >= 0.384
  // And also where `n.priority <= 9`.
  AND n.priority <= 9
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_005, collect(m.identifier) AS
// targets_005`.
WITH n, count(r) AS degree_005, collect(m.identifier) AS targets_005
// Keep only results where `degree_005 > 0`.
WHERE degree_005 > 0
// Give back (show) these results: `n.identifier AS id_005`.
RETURN n.identifier AS id_005,
       // ...also include the value `n.status AS status_005` in the results.
       n.status AS status_005,
       // ...also include the value `n.score AS score_005` in the results.
       n.score AS score_005,
       // ...also include the value `degree_005` in the results.
       degree_005,
       // ...also include the value `targets_005` in the results.
       targets_005
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'completed'`.
WHERE n.status = 'completed'
  // And also where `n.score >= 0.236`.
  AND n.score >= 0.236
  // And also where `n.priority <= 5`.
  AND n.priority <= 5
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_006, collect(m.identifier) AS
// targets_006`.
WITH n, count(r) AS degree_006, collect(m.identifier) AS targets_006
// Keep only results where `degree_006 > 1`.
WHERE degree_006 > 1
// Give back (show) these results: `n.identifier AS id_006`.
RETURN n.identifier AS id_006,
       // ...also include the value `n.status AS status_006` in the results.
       n.status AS status_006,
       // ...also include the value `n.score AS score_006` in the results.
       n.score AS score_006,
       // ...also include the value `degree_006` in the results.
       degree_006,
       // ...also include the value `targets_006` in the results.
       targets_006
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 10 results.
LIMIT 10;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'degraded'`.
WHERE n.status = 'degraded'
  // And also where `n.score >= 0.375`.
  AND n.score >= 0.375
  // And also where `n.priority <= 8`.
  AND n.priority <= 8
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_007, collect(m.identifier) AS
// targets_007`.
WITH n, count(r) AS degree_007, collect(m.identifier) AS targets_007
// Keep only results where `degree_007 > 2`.
WHERE degree_007 > 2
// Give back (show) these results: `n.identifier AS id_007`.
RETURN n.identifier AS id_007,
       // ...also include the value `n.status AS status_007` in the results.
       n.status AS status_007,
       // ...also include the value `n.score AS score_007` in the results.
       n.score AS score_007,
       // ...also include the value `degree_007` in the results.
       degree_007,
       // ...also include the value `targets_007` in the results.
       targets_007
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'recovered'`.
WHERE n.status = 'recovered'
  // And also where `n.score >= 0.412`.
  AND n.score >= 0.412
  // And also where `n.priority <= 10`.
  AND n.priority <= 10
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_008, collect(m.identifier) AS
// targets_008`.
WITH n, count(r) AS degree_008, collect(m.identifier) AS targets_008
// Keep only results where `degree_008 > 4`.
WHERE degree_008 > 4
// Give back (show) these results: `n.identifier AS id_008`.
RETURN n.identifier AS id_008,
       // ...also include the value `n.status AS status_008` in the results.
       n.status AS status_008,
       // ...also include the value `n.score AS score_008` in the results.
       n.score AS score_008,
       // ...also include the value `degree_008` in the results.
       degree_008,
       // ...also include the value `targets_008` in the results.
       targets_008
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 50 results.
LIMIT 50;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'degraded'`.
WHERE n.status = 'degraded'
  // And also where `n.score >= 0.6`.
  AND n.score >= 0.6
  // And also where `n.priority <= 9`.
  AND n.priority <= 9
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_009, collect(m.identifier) AS
// targets_009`.
WITH n, count(r) AS degree_009, collect(m.identifier) AS targets_009
// Keep only results where `degree_009 > 1`.
WHERE degree_009 > 1
// Give back (show) these results: `n.identifier AS id_009`.
RETURN n.identifier AS id_009,
       // ...also include the value `n.status AS status_009` in the results.
       n.status AS status_009,
       // ...also include the value `n.score AS score_009` in the results.
       n.score AS score_009,
       // ...also include the value `degree_009` in the results.
       degree_009,
       // ...also include the value `targets_009` in the results.
       targets_009
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 100 results.
LIMIT 100;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'active'`.
WHERE n.status = 'active'
  // And also where `n.score >= 0.163`.
  AND n.score >= 0.163
  // And also where `n.priority <= 6`.
  AND n.priority <= 6
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_010, collect(m.identifier) AS
// targets_010`.
WITH n, count(r) AS degree_010, collect(m.identifier) AS targets_010
// Keep only results where `degree_010 > 0`.
WHERE degree_010 > 0
// Give back (show) these results: `n.identifier AS id_010`.
RETURN n.identifier AS id_010,
       // ...also include the value `n.status AS status_010` in the results.
       n.status AS status_010,
       // ...also include the value `n.score AS score_010` in the results.
       n.score AS score_010,
       // ...also include the value `degree_010` in the results.
       degree_010,
       // ...also include the value `targets_010` in the results.
       targets_010
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 100 results.
LIMIT 100;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'degraded'`.
WHERE n.status = 'degraded'
  // And also where `n.score >= 0.351`.
  AND n.score >= 0.351
  // And also where `n.priority <= 7`.
  AND n.priority <= 7
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_011, collect(m.identifier) AS
// targets_011`.
WITH n, count(r) AS degree_011, collect(m.identifier) AS targets_011
// Keep only results where `degree_011 > 3`.
WHERE degree_011 > 3
// Give back (show) these results: `n.identifier AS id_011`.
RETURN n.identifier AS id_011,
       // ...also include the value `n.status AS status_011` in the results.
       n.status AS status_011,
       // ...also include the value `n.score AS score_011` in the results.
       n.score AS score_011,
       // ...also include the value `degree_011` in the results.
       degree_011,
       // ...also include the value `targets_011` in the results.
       targets_011
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'pending'`.
WHERE n.status = 'pending'
  // And also where `n.score >= 0.578`.
  AND n.score >= 0.578
  // And also where `n.priority <= 8`.
  AND n.priority <= 8
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_012, collect(m.identifier) AS
// targets_012`.
WITH n, count(r) AS degree_012, collect(m.identifier) AS targets_012
// Keep only results where `degree_012 > 4`.
WHERE degree_012 > 4
// Give back (show) these results: `n.identifier AS id_012`.
RETURN n.identifier AS id_012,
       // ...also include the value `n.status AS status_012` in the results.
       n.status AS status_012,
       // ...also include the value `n.score AS score_012` in the results.
       n.score AS score_012,
       // ...also include the value `degree_012` in the results.
       degree_012,
       // ...also include the value `targets_012` in the results.
       targets_012
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 50 results.
LIMIT 50;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'pending'`.
WHERE n.status = 'pending'
  // And also where `n.score >= 0.254`.
  AND n.score >= 0.254
  // And also where `n.priority <= 10`.
  AND n.priority <= 10
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_013, collect(m.identifier) AS
// targets_013`.
WITH n, count(r) AS degree_013, collect(m.identifier) AS targets_013
// Keep only results where `degree_013 > 3`.
WHERE degree_013 > 3
// Give back (show) these results: `n.identifier AS id_013`.
RETURN n.identifier AS id_013,
       // ...also include the value `n.status AS status_013` in the results.
       n.status AS status_013,
       // ...also include the value `n.score AS score_013` in the results.
       n.score AS score_013,
       // ...also include the value `degree_013` in the results.
       degree_013,
       // ...also include the value `targets_013` in the results.
       targets_013
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 10 results.
LIMIT 10;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'pending'`.
WHERE n.status = 'pending'
  // And also where `n.score >= 0.614`.
  AND n.score >= 0.614
  // And also where `n.priority <= 10`.
  AND n.priority <= 10
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_014, collect(m.identifier) AS
// targets_014`.
WITH n, count(r) AS degree_014, collect(m.identifier) AS targets_014
// Keep only results where `degree_014 > 0`.
WHERE degree_014 > 0
// Give back (show) these results: `n.identifier AS id_014`.
RETURN n.identifier AS id_014,
       // ...also include the value `n.status AS status_014` in the results.
       n.status AS status_014,
       // ...also include the value `n.score AS score_014` in the results.
       n.score AS score_014,
       // ...also include the value `degree_014` in the results.
       degree_014,
       // ...also include the value `targets_014` in the results.
       targets_014
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 50 results.
LIMIT 50;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'degraded'`.
WHERE n.status = 'degraded'
  // And also where `n.score >= 0.268`.
  AND n.score >= 0.268
  // And also where `n.priority <= 8`.
  AND n.priority <= 8
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_015, collect(m.identifier) AS
// targets_015`.
WITH n, count(r) AS degree_015, collect(m.identifier) AS targets_015
// Keep only results where `degree_015 > 2`.
WHERE degree_015 > 2
// Give back (show) these results: `n.identifier AS id_015`.
RETURN n.identifier AS id_015,
       // ...also include the value `n.status AS status_015` in the results.
       n.status AS status_015,
       // ...also include the value `n.score AS score_015` in the results.
       n.score AS score_015,
       // ...also include the value `degree_015` in the results.
       degree_015,
       // ...also include the value `targets_015` in the results.
       targets_015
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 10 results.
LIMIT 10;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'failed'`.
WHERE n.status = 'failed'
  // And also where `n.score >= 0.259`.
  AND n.score >= 0.259
  // And also where `n.priority <= 5`.
  AND n.priority <= 5
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_016, collect(m.identifier) AS
// targets_016`.
WITH n, count(r) AS degree_016, collect(m.identifier) AS targets_016
// Keep only results where `degree_016 > 0`.
WHERE degree_016 > 0
// Give back (show) these results: `n.identifier AS id_016`.
RETURN n.identifier AS id_016,
       // ...also include the value `n.status AS status_016` in the results.
       n.status AS status_016,
       // ...also include the value `n.score AS score_016` in the results.
       n.score AS score_016,
       // ...also include the value `degree_016` in the results.
       degree_016,
       // ...also include the value `targets_016` in the results.
       targets_016
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'completed'`.
WHERE n.status = 'completed'
  // And also where `n.score >= 0.216`.
  AND n.score >= 0.216
  // And also where `n.priority <= 8`.
  AND n.priority <= 8
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_017, collect(m.identifier) AS
// targets_017`.
WITH n, count(r) AS degree_017, collect(m.identifier) AS targets_017
// Keep only results where `degree_017 > 0`.
WHERE degree_017 > 0
// Give back (show) these results: `n.identifier AS id_017`.
RETURN n.identifier AS id_017,
       // ...also include the value `n.status AS status_017` in the results.
       n.status AS status_017,
       // ...also include the value `n.score AS score_017` in the results.
       n.score AS score_017,
       // ...also include the value `degree_017` in the results.
       degree_017,
       // ...also include the value `targets_017` in the results.
       targets_017
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'active'`.
WHERE n.status = 'active'
  // And also where `n.score >= 0.321`.
  AND n.score >= 0.321
  // And also where `n.priority <= 5`.
  AND n.priority <= 5
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_018, collect(m.identifier) AS
// targets_018`.
WITH n, count(r) AS degree_018, collect(m.identifier) AS targets_018
// Keep only results where `degree_018 > 0`.
WHERE degree_018 > 0
// Give back (show) these results: `n.identifier AS id_018`.
RETURN n.identifier AS id_018,
       // ...also include the value `n.status AS status_018` in the results.
       n.status AS status_018,
       // ...also include the value `n.score AS score_018` in the results.
       n.score AS score_018,
       // ...also include the value `degree_018` in the results.
       degree_018,
       // ...also include the value `targets_018` in the results.
       targets_018
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 10 results.
LIMIT 10;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'completed'`.
WHERE n.status = 'completed'
  // And also where `n.score >= 0.521`.
  AND n.score >= 0.521
  // And also where `n.priority <= 6`.
  AND n.priority <= 6
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_019, collect(m.identifier) AS
// targets_019`.
WITH n, count(r) AS degree_019, collect(m.identifier) AS targets_019
// Keep only results where `degree_019 > 1`.
WHERE degree_019 > 1
// Give back (show) these results: `n.identifier AS id_019`.
RETURN n.identifier AS id_019,
       // ...also include the value `n.status AS status_019` in the results.
       n.status AS status_019,
       // ...also include the value `n.score AS score_019` in the results.
       n.score AS score_019,
       // ...also include the value `degree_019` in the results.
       degree_019,
       // ...also include the value `targets_019` in the results.
       targets_019
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 10 results.
LIMIT 10;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'pending'`.
WHERE n.status = 'pending'
  // And also where `n.score >= 0.677`.
  AND n.score >= 0.677
  // And also where `n.priority <= 10`.
  AND n.priority <= 10
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_020, collect(m.identifier) AS
// targets_020`.
WITH n, count(r) AS degree_020, collect(m.identifier) AS targets_020
// Keep only results where `degree_020 > 1`.
WHERE degree_020 > 1
// Give back (show) these results: `n.identifier AS id_020`.
RETURN n.identifier AS id_020,
       // ...also include the value `n.status AS status_020` in the results.
       n.status AS status_020,
       // ...also include the value `n.score AS score_020` in the results.
       n.score AS score_020,
       // ...also include the value `degree_020` in the results.
       degree_020,
       // ...also include the value `targets_020` in the results.
       targets_020
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 25 results.
LIMIT 25;

// Find the parts of the graph that match the pattern `(n:Multimodal)`.
MATCH (n:Multimodal)
// Keep only results where `n.status = 'active'`.
WHERE n.status = 'active'
  // And also where `n.score >= 0.241`.
  AND n.score >= 0.241
  // And also where `n.priority <= 6`.
  AND n.priority <= 6
// Find the parts of the graph that match the pattern `(n)-[r]->(m:Multimodal)` (optional: keep the
// result even if nothing is found).
OPTIONAL MATCH (n)-[r]->(m:Multimodal)
// Pass these values on to the next step: `n, count(r) AS degree_021, collect(m.identifier) AS
// targets_021`.
WITH n, count(r) AS degree_021, collect(m.identifier) AS targets_021
// Keep only results where `degree_021 > 1`.
WHERE degree_021 > 1
// Give back (show) these results: `n.identifier AS id_021`.
RETURN n.identifier AS id_021,
       // ...also include the value `n.status AS status_021` in the results.
       n.status AS status_021,
       // ...also include the value `n.score AS score_021` in the results.
       n.score AS score_021,
       // ...also include the value `degree_021` in the results.
       degree_021,
       // ...also include the value `targets_021` in the results.
       targets_021
// Sort the results by `n.score DESC` (highest first).
ORDER BY n.score DESC
// Return at most 50 results.
LIMIT 50;
