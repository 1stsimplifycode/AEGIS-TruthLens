// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project
//                                  (utility helpers area). It is one small, separate piece so
//                                  each language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New relationships stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_02_02'
//                                  - batchSize = 256
//                                  - threshold = 0.211
//                                  - maxDepth = 7
//                                  - timeoutSeconds = 86
//                                  - region = 'us-west'
//                                  - epoch = 29
//                                  - version = '3.2.8'
//  9. Algorithm / Logic          : - Contains about 0 CREATE and 30 MATCH statements.
//                                  - CREATE adds new data; MATCH finds existing data; RETURN
//                                    shows the result.
//                                  - Node labels used: Multimodal.
// 10. Dependencies               : - Neo4j database (version 5 recommended).
//                                  - cypher-shell (comes with Neo4j).
// 11. Execution Instructions     : cypher-shell -u neo4j -p <password> -f
//                                  neo4j_relationships_02.cypher
// 12. Assumptions and Limitations: - The required tools listed above are installed and on the
//                                    PATH.
//                                  - Limitation: results are only as good as the data given to
//                                    it.
// 13. Error Handling             : No special error handling. If a statement fails, Neo4j
//                                  stops and reports the error.
// =============================================================================================

// Set the parameter `namespace` to `'multimodal_02_02'`; later lines can use it as $namespace.
:param namespace => 'multimodal_02_02';
// Set the parameter `batchSize` to `256`; later lines can use it as $batchSize.
:param batchSize => 256;
// Set the parameter `threshold` to `0.211`; later lines can use it as $threshold.
:param threshold => 0.211;
// Set the parameter `maxDepth` to `7`; later lines can use it as $maxDepth.
:param maxDepth => 7;
// Set the parameter `timeoutSeconds` to `86`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 86;
// Set the parameter `region` to `'us-west'`; later lines can use it as $region.
:param region => 'us-west';
// Set the parameter `epoch` to `29`; later lines can use it as $epoch.
:param epoch => 29;
// Set the parameter `version` to `'3.2.8'`; later lines can use it as $version.
:param version => '3.2.8';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_000' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_001'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_001' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:ROUTES_TO {
  // Property / setting `strength` = `0.0922`.
  strength: 0.0922,
  // Property / setting `latency` = `119`.
  latency: 119,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `9720`.
  bandwidth: 9720,
  // Property / setting `confidence` = `0.5309`.
  confidence: 0.5309,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_001' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_002'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_002' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:ROUTES_TO {
  // Property / setting `strength` = `0.1025`.
  strength: 0.1025,
  // Property / setting `latency` = `177`.
  latency: 177,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `2197`.
  bandwidth: 2197,
  // Property / setting `confidence` = `0.551`.
  confidence: 0.551,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_002' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_003'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_003' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:PRODUCES {
  // Property / setting `strength` = `0.1669`.
  strength: 0.1669,
  // Property / setting `latency` = `99`.
  latency: 99,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `3667`.
  bandwidth: 3667,
  // Property / setting `confidence` = `0.0322`.
  confidence: 0.0322,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_003' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_004'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_004' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:MONITORS {
  // Property / setting `strength` = `0.6835`.
  strength: 0.6835,
  // Property / setting `latency` = `73`.
  latency: 73,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `4001`.
  bandwidth: 4001,
  // Property / setting `confidence` = `0.0048`.
  confidence: 0.0048,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_004' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_005'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_005' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:MONITORS {
  // Property / setting `strength` = `0.7038`.
  strength: 0.7038,
  // Property / setting `latency` = `205`.
  latency: 205,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `9762`.
  bandwidth: 9762,
  // Property / setting `confidence` = `0.8321`.
  confidence: 0.8321,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_005' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_006'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_006' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:ROUTES_TO {
  // Property / setting `strength` = `0.5283`.
  strength: 0.5283,
  // Property / setting `latency` = `219`.
  latency: 219,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `6282`.
  bandwidth: 6282,
  // Property / setting `confidence` = `0.3034`.
  confidence: 0.3034,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_006' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_007'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_007' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:ROUTES_TO {
  // Property / setting `strength` = `0.0897`.
  strength: 0.0897,
  // Property / setting `latency` = `220`.
  latency: 220,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `8294`.
  bandwidth: 8294,
  // Property / setting `confidence` = `0.792`.
  confidence: 0.792,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_007' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_008'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_008' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:ROUTES_TO {
  // Property / setting `strength` = `0.9284`.
  strength: 0.9284,
  // Property / setting `latency` = `160`.
  latency: 160,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `1618`.
  bandwidth: 1618,
  // Property / setting `confidence` = `0.9131`.
  confidence: 0.9131,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_008' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_009'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_009' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:TRIGGERS {
  // Property / setting `strength` = `0.2439`.
  strength: 0.2439,
  // Property / setting `latency` = `45`.
  latency: 45,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `9014`.
  bandwidth: 9014,
  // Property / setting `confidence` = `0.8989`.
  confidence: 0.8989,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_009' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_010'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_010' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:DEPENDS_ON {
  // Property / setting `strength` = `0.5867`.
  strength: 0.5867,
  // Property / setting `latency` = `83`.
  latency: 83,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `3462`.
  bandwidth: 3462,
  // Property / setting `confidence` = `0.8183`.
  confidence: 0.8183,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_010' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_011'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_011' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:ROUTES_TO {
  // Property / setting `strength` = `0.8722`.
  strength: 0.8722,
  // Property / setting `latency` = `161`.
  latency: 161,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `7157`.
  bandwidth: 7157,
  // Property / setting `confidence` = `0.4896`.
  confidence: 0.4896,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_011' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_012'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_012' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:OBSERVES {
  // Property / setting `strength` = `0.0987`.
  strength: 0.0987,
  // Property / setting `latency` = `246`.
  latency: 246,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `7095`.
  bandwidth: 7095,
  // Property / setting `confidence` = `0.0522`.
  confidence: 0.0522,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_012' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_013'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_013' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:OBSERVES {
  // Property / setting `strength` = `0.7984`.
  strength: 0.7984,
  // Property / setting `latency` = `100`.
  latency: 100,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `6325`.
  bandwidth: 6325,
  // Property / setting `confidence` = `0.6482`.
  confidence: 0.6482,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_013' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_014'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_014' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:ROUTES_TO {
  // Property / setting `strength` = `0.2231`.
  strength: 0.2231,
  // Property / setting `latency` = `97`.
  latency: 97,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `8495`.
  bandwidth: 8495,
  // Property / setting `confidence` = `0.4405`.
  confidence: 0.4405,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_014' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_015'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_015' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:PRODUCES {
  // Property / setting `strength` = `0.1162`.
  strength: 0.1162,
  // Property / setting `latency` = `236`.
  latency: 236,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `7558`.
  bandwidth: 7558,
  // Property / setting `confidence` = `0.3599`.
  confidence: 0.3599,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_015' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_016'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_016' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:CALIBRATES {
  // Property / setting `strength` = `0.6917`.
  strength: 0.6917,
  // Property / setting `latency` = `65`.
  latency: 65,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `5963`.
  bandwidth: 5963,
  // Property / setting `confidence` = `0.8612`.
  confidence: 0.8612,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_016' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_017'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_017' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:VALIDATES {
  // Property / setting `strength` = `0.6825`.
  strength: 0.6825,
  // Property / setting `latency` = `174`.
  latency: 174,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `201`.
  bandwidth: 201,
  // Property / setting `confidence` = `0.2696`.
  confidence: 0.2696,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_017' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_018'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_018' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:OBSERVES {
  // Property / setting `strength` = `0.2633`.
  strength: 0.2633,
  // Property / setting `latency` = `128`.
  latency: 128,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `7066`.
  bandwidth: 7066,
  // Property / setting `confidence` = `0.5525`.
  confidence: 0.5525,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_018' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_019'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_019' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:DEPENDS_ON {
  // Property / setting `strength` = `0.6438`.
  strength: 0.6438,
  // Property / setting `latency` = `193`.
  latency: 193,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `3232`.
  bandwidth: 3232,
  // Property / setting `confidence` = `0.4501`.
  confidence: 0.4501,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_019' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_020'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_020' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:DEPENDS_ON {
  // Property / setting `strength` = `0.5223`.
  strength: 0.5223,
  // Property / setting `latency` = `8`.
  latency: 8,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `5194`.
  bandwidth: 5194,
  // Property / setting `confidence` = `0.4584`.
  confidence: 0.4584,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_020' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_021'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_021' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:MONITORS {
  // Property / setting `strength` = `0.6908`.
  strength: 0.6908,
  // Property / setting `latency` = `25`.
  latency: 25,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `4252`.
  bandwidth: 4252,
  // Property / setting `confidence` = `0.4519`.
  confidence: 0.4519,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_021' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_022'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_022' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:VALIDATES {
  // Property / setting `strength` = `0.2265`.
  strength: 0.2265,
  // Property / setting `latency` = `12`.
  latency: 12,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `3441`.
  bandwidth: 3441,
  // Property / setting `confidence` = `0.9569`.
  confidence: 0.9569,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_022' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_023'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_023' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:VALIDATES {
  // Property / setting `strength` = `0.2874`.
  strength: 0.2874,
  // Property / setting `latency` = `197`.
  latency: 197,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `9388`.
  bandwidth: 9388,
  // Property / setting `confidence` = `0.1391`.
  confidence: 0.1391,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_023' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_024'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_024' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:OBSERVES {
  // Property / setting `strength` = `0.2809`.
  strength: 0.2809,
  // Property / setting `latency` = `74`.
  latency: 74,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `5733`.
  bandwidth: 5733,
  // Property / setting `confidence` = `0.9106`.
  confidence: 0.9106,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_024' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_025'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_025' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:DEPENDS_ON {
  // Property / setting `strength` = `0.329`.
  strength: 0.329,
  // Property / setting `latency` = `16`.
  latency: 16,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `2291`.
  bandwidth: 2291,
  // Property / setting `confidence` = `0.4363`.
  confidence: 0.4363,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_025' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_026'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_026' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:PRODUCES {
  // Property / setting `strength` = `0.3205`.
  strength: 0.3205,
  // Property / setting `latency` = `110`.
  latency: 110,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `9945`.
  bandwidth: 9945,
  // Property / setting `confidence` = `0.8421`.
  confidence: 0.8421,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_026' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_027'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_027' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:VALIDATES {
  // Property / setting `strength` = `0.1884`.
  strength: 0.1884,
  // Property / setting `latency` = `122`.
  latency: 122,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `7876`.
  bandwidth: 7876,
  // Property / setting `confidence` = `0.8917`.
  confidence: 0.8917,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_027' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_028'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_028' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:CALIBRATES {
  // Property / setting `strength` = `0.3139`.
  strength: 0.3139,
  // Property / setting `latency` = `56`.
  latency: 56,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `4574`.
  bandwidth: 4574,
  // Property / setting `confidence` = `0.4398`.
  confidence: 0.4398,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_028' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_029'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_029' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:MONITORS {
  // Property / setting `strength` = `0.1231`.
  strength: 0.1231,
  // Property / setting `latency` = `172`.
  latency: 172,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `987`.
  bandwidth: 987,
  // Property / setting `confidence` = `0.2067`.
  confidence: 0.2067,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_10_utility_helpers_2_029' })`.
MATCH (a:Multimodal { identifier: 'multimodal_10_utility_helpers_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_10_utility_helpers_2_000'`.
      (b:Multimodal { identifier: 'multimodal_10_utility_helpers_2_000' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:DEPENDS_ON {
  // Property / setting `strength` = `0.1397`.
  strength: 0.1397,
  // Property / setting `latency` = `52`.
  latency: 52,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `4534`.
  bandwidth: 4534,
  // Property / setting `confidence` = `0.4553`.
  confidence: 0.4553,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
