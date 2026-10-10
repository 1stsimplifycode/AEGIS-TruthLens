// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project (metric
//                                  trackers area). It is one small, separate piece so each
//                                  language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New relationships stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_02_02'
//                                  - batchSize = 512
//                                  - threshold = 0.448
//                                  - maxDepth = 8
//                                  - timeoutSeconds = 111
//                                  - region = 'ap-south'
//                                  - epoch = 91
//                                  - version = '4.8.5'
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
// Set the parameter `batchSize` to `512`; later lines can use it as $batchSize.
:param batchSize => 512;
// Set the parameter `threshold` to `0.448`; later lines can use it as $threshold.
:param threshold => 0.448;
// Set the parameter `maxDepth` to `8`; later lines can use it as $maxDepth.
:param maxDepth => 8;
// Set the parameter `timeoutSeconds` to `111`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 111;
// Set the parameter `region` to `'ap-south'`; later lines can use it as $region.
:param region => 'ap-south';
// Set the parameter `epoch` to `91`; later lines can use it as $epoch.
:param epoch => 91;
// Set the parameter `version` to `'4.8.5'`; later lines can use it as $version.
:param version => '4.8.5';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_000' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_001'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_001' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:DEPENDS_ON {
  // Property / setting `strength` = `0.6798`.
  strength: 0.6798,
  // Property / setting `latency` = `194`.
  latency: 194,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `506`.
  bandwidth: 506,
  // Property / setting `confidence` = `0.884`.
  confidence: 0.884,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_001' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_002'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_002' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:MONITORS {
  // Property / setting `strength` = `0.3656`.
  strength: 0.3656,
  // Property / setting `latency` = `65`.
  latency: 65,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `6272`.
  bandwidth: 6272,
  // Property / setting `confidence` = `0.4871`.
  confidence: 0.4871,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_002' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_003'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_003' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:DEPENDS_ON {
  // Property / setting `strength` = `0.4256`.
  strength: 0.4256,
  // Property / setting `latency` = `180`.
  latency: 180,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `4403`.
  bandwidth: 4403,
  // Property / setting `confidence` = `0.792`.
  confidence: 0.792,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_003' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_004'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_004' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:ROUTES_TO {
  // Property / setting `strength` = `0.1425`.
  strength: 0.1425,
  // Property / setting `latency` = `201`.
  latency: 201,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `5296`.
  bandwidth: 5296,
  // Property / setting `confidence` = `0.9319`.
  confidence: 0.9319,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_004' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_005'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_005' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:CALIBRATES {
  // Property / setting `strength` = `0.8656`.
  strength: 0.8656,
  // Property / setting `latency` = `62`.
  latency: 62,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `430`.
  bandwidth: 430,
  // Property / setting `confidence` = `0.382`.
  confidence: 0.382,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_005' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_006'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_006' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:MONITORS {
  // Property / setting `strength` = `0.6573`.
  strength: 0.6573,
  // Property / setting `latency` = `158`.
  latency: 158,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `2278`.
  bandwidth: 2278,
  // Property / setting `confidence` = `0.6313`.
  confidence: 0.6313,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_006' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_007'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_007' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:TRIGGERS {
  // Property / setting `strength` = `0.1613`.
  strength: 0.1613,
  // Property / setting `latency` = `154`.
  latency: 154,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `6908`.
  bandwidth: 6908,
  // Property / setting `confidence` = `0.84`.
  confidence: 0.84,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_007' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_008'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_008' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:DEPENDS_ON {
  // Property / setting `strength` = `0.806`.
  strength: 0.806,
  // Property / setting `latency` = `20`.
  latency: 20,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `8013`.
  bandwidth: 8013,
  // Property / setting `confidence` = `0.6799`.
  confidence: 0.6799,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_008' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_009'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_009' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:TRIGGERS {
  // Property / setting `strength` = `0.9011`.
  strength: 0.9011,
  // Property / setting `latency` = `191`.
  latency: 191,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `3798`.
  bandwidth: 3798,
  // Property / setting `confidence` = `0.3982`.
  confidence: 0.3982,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_009' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_010'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_010' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:CALIBRATES {
  // Property / setting `strength` = `0.009`.
  strength: 0.009,
  // Property / setting `latency` = `109`.
  latency: 109,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `9965`.
  bandwidth: 9965,
  // Property / setting `confidence` = `0.8437`.
  confidence: 0.8437,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_010' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_011'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_011' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:TRIGGERS {
  // Property / setting `strength` = `0.0596`.
  strength: 0.0596,
  // Property / setting `latency` = `163`.
  latency: 163,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `240`.
  bandwidth: 240,
  // Property / setting `confidence` = `0.1246`.
  confidence: 0.1246,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_011' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_012'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_012' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:PRODUCES {
  // Property / setting `strength` = `0.5196`.
  strength: 0.5196,
  // Property / setting `latency` = `31`.
  latency: 31,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `9647`.
  bandwidth: 9647,
  // Property / setting `confidence` = `0.4342`.
  confidence: 0.4342,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_012' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_013'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_013' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:CALIBRATES {
  // Property / setting `strength` = `0.075`.
  strength: 0.075,
  // Property / setting `latency` = `122`.
  latency: 122,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `8730`.
  bandwidth: 8730,
  // Property / setting `confidence` = `0.9116`.
  confidence: 0.9116,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_013' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_014'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_014' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:ROUTES_TO {
  // Property / setting `strength` = `0.0641`.
  strength: 0.0641,
  // Property / setting `latency` = `15`.
  latency: 15,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `7582`.
  bandwidth: 7582,
  // Property / setting `confidence` = `0.2284`.
  confidence: 0.2284,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_014' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_015'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_015' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:MONITORS {
  // Property / setting `strength` = `0.8244`.
  strength: 0.8244,
  // Property / setting `latency` = `79`.
  latency: 79,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `6932`.
  bandwidth: 6932,
  // Property / setting `confidence` = `0.6721`.
  confidence: 0.6721,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_015' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_016'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_016' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:TRIGGERS {
  // Property / setting `strength` = `0.0967`.
  strength: 0.0967,
  // Property / setting `latency` = `16`.
  latency: 16,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `3226`.
  bandwidth: 3226,
  // Property / setting `confidence` = `0.6168`.
  confidence: 0.6168,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_016' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_017'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_017' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:VALIDATES {
  // Property / setting `strength` = `0.633`.
  strength: 0.633,
  // Property / setting `latency` = `77`.
  latency: 77,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `5343`.
  bandwidth: 5343,
  // Property / setting `confidence` = `0.3818`.
  confidence: 0.3818,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_017' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_018'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_018' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:MONITORS {
  // Property / setting `strength` = `0.0532`.
  strength: 0.0532,
  // Property / setting `latency` = `145`.
  latency: 145,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `1837`.
  bandwidth: 1837,
  // Property / setting `confidence` = `0.2234`.
  confidence: 0.2234,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_018' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_019'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_019' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:OBSERVES {
  // Property / setting `strength` = `0.5918`.
  strength: 0.5918,
  // Property / setting `latency` = `248`.
  latency: 248,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `8707`.
  bandwidth: 8707,
  // Property / setting `confidence` = `0.5362`.
  confidence: 0.5362,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_019' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_020'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_020' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:TRIGGERS {
  // Property / setting `strength` = `0.008`.
  strength: 0.008,
  // Property / setting `latency` = `177`.
  latency: 177,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `1240`.
  bandwidth: 1240,
  // Property / setting `confidence` = `0.1156`.
  confidence: 0.1156,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_020' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_021'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_021' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:DEPENDS_ON {
  // Property / setting `strength` = `0.8511`.
  strength: 0.8511,
  // Property / setting `latency` = `44`.
  latency: 44,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `7572`.
  bandwidth: 7572,
  // Property / setting `confidence` = `0.5474`.
  confidence: 0.5474,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_021' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_022'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_022' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:MONITORS {
  // Property / setting `strength` = `0.8883`.
  strength: 0.8883,
  // Property / setting `latency` = `69`.
  latency: 69,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `2189`.
  bandwidth: 2189,
  // Property / setting `confidence` = `0.8305`.
  confidence: 0.8305,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_022' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_023'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_023' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:TRIGGERS {
  // Property / setting `strength` = `0.6876`.
  strength: 0.6876,
  // Property / setting `latency` = `11`.
  latency: 11,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `521`.
  bandwidth: 521,
  // Property / setting `confidence` = `0.6122`.
  confidence: 0.6122,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_023' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_024'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_024' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:DEPENDS_ON {
  // Property / setting `strength` = `0.0162`.
  strength: 0.0162,
  // Property / setting `latency` = `28`.
  latency: 28,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `1290`.
  bandwidth: 1290,
  // Property / setting `confidence` = `0.7953`.
  confidence: 0.7953,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_024' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_025'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_025' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:VALIDATES {
  // Property / setting `strength` = `0.2042`.
  strength: 0.2042,
  // Property / setting `latency` = `236`.
  latency: 236,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `8949`.
  bandwidth: 8949,
  // Property / setting `confidence` = `0.0636`.
  confidence: 0.0636,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_025' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_026'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_026' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:MONITORS {
  // Property / setting `strength` = `0.718`.
  strength: 0.718,
  // Property / setting `latency` = `57`.
  latency: 57,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `6297`.
  bandwidth: 6297,
  // Property / setting `confidence` = `0.5916`.
  confidence: 0.5916,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_026' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_027'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_027' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:VALIDATES {
  // Property / setting `strength` = `0.2299`.
  strength: 0.2299,
  // Property / setting `latency` = `145`.
  latency: 145,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `940`.
  bandwidth: 940,
  // Property / setting `confidence` = `0.8937`.
  confidence: 0.8937,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_027' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_028'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_028' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:VALIDATES {
  // Property / setting `strength` = `0.5614`.
  strength: 0.5614,
  // Property / setting `latency` = `162`.
  latency: 162,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `7387`.
  bandwidth: 7387,
  // Property / setting `confidence` = `0.6354`.
  confidence: 0.6354,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_028' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_029'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_029' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:PRODUCES {
  // Property / setting `strength` = `0.8965`.
  strength: 0.8965,
  // Property / setting `latency` = `244`.
  latency: 244,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `3635`.
  bandwidth: 3635,
  // Property / setting `confidence` = `0.272`.
  confidence: 0.272,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_05_metric_trackers_2_029' })`.
MATCH (a:Multimodal { identifier: 'multimodal_05_metric_trackers_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_05_metric_trackers_2_000'`.
      (b:Multimodal { identifier: 'multimodal_05_metric_trackers_2_000' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:ROUTES_TO {
  // Property / setting `strength` = `0.6033`.
  strength: 0.6033,
  // Property / setting `latency` = `168`.
  latency: 168,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `2326`.
  bandwidth: 2326,
  // Property / setting `confidence` = `0.4319`.
  confidence: 0.4319,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
