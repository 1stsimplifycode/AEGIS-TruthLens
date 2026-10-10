// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project
//                                  (validation layer area). It is one small, separate piece so
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
//                                  - threshold = 0.25
//                                  - maxDepth = 6
//                                  - timeoutSeconds = 105
//                                  - region = 'us-east'
//                                  - epoch = 30
//                                  - version = '1.7.8'
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
// Set the parameter `threshold` to `0.25`; later lines can use it as $threshold.
:param threshold => 0.25;
// Set the parameter `maxDepth` to `6`; later lines can use it as $maxDepth.
:param maxDepth => 6;
// Set the parameter `timeoutSeconds` to `105`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 105;
// Set the parameter `region` to `'us-east'`; later lines can use it as $region.
:param region => 'us-east';
// Set the parameter `epoch` to `30`; later lines can use it as $epoch.
:param epoch => 30;
// Set the parameter `version` to `'1.7.8'`; later lines can use it as $version.
:param version => '1.7.8';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_000' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_001'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_001' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:VALIDATES {
  // Property / setting `strength` = `0.932`.
  strength: 0.932,
  // Property / setting `latency` = `117`.
  latency: 117,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `1704`.
  bandwidth: 1704,
  // Property / setting `confidence` = `0.9073`.
  confidence: 0.9073,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_001' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_002'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_002' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:ROUTES_TO {
  // Property / setting `strength` = `0.1595`.
  strength: 0.1595,
  // Property / setting `latency` = `2`.
  latency: 2,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `5838`.
  bandwidth: 5838,
  // Property / setting `confidence` = `0.8436`.
  confidence: 0.8436,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_002' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_003'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_003' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:DEPENDS_ON {
  // Property / setting `strength` = `0.0259`.
  strength: 0.0259,
  // Property / setting `latency` = `240`.
  latency: 240,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `5384`.
  bandwidth: 5384,
  // Property / setting `confidence` = `0.3401`.
  confidence: 0.3401,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_003' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_004'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_004' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:DEPENDS_ON {
  // Property / setting `strength` = `0.9999`.
  strength: 0.9999,
  // Property / setting `latency` = `64`.
  latency: 64,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `1673`.
  bandwidth: 1673,
  // Property / setting `confidence` = `0.6641`.
  confidence: 0.6641,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_004' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_005'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_005' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:OBSERVES {
  // Property / setting `strength` = `0.1973`.
  strength: 0.1973,
  // Property / setting `latency` = `150`.
  latency: 150,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `3194`.
  bandwidth: 3194,
  // Property / setting `confidence` = `0.8444`.
  confidence: 0.8444,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_005' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_006'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_006' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:OBSERVES {
  // Property / setting `strength` = `0.3032`.
  strength: 0.3032,
  // Property / setting `latency` = `39`.
  latency: 39,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `9250`.
  bandwidth: 9250,
  // Property / setting `confidence` = `0.3333`.
  confidence: 0.3333,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_006' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_007'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_007' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:MONITORS {
  // Property / setting `strength` = `0.5513`.
  strength: 0.5513,
  // Property / setting `latency` = `213`.
  latency: 213,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `9374`.
  bandwidth: 9374,
  // Property / setting `confidence` = `0.231`.
  confidence: 0.231,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_007' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_008'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_008' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:VALIDATES {
  // Property / setting `strength` = `0.4122`.
  strength: 0.4122,
  // Property / setting `latency` = `82`.
  latency: 82,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `7491`.
  bandwidth: 7491,
  // Property / setting `confidence` = `0.3455`.
  confidence: 0.3455,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_008' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_009'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_009' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:MONITORS {
  // Property / setting `strength` = `0.196`.
  strength: 0.196,
  // Property / setting `latency` = `98`.
  latency: 98,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `318`.
  bandwidth: 318,
  // Property / setting `confidence` = `0.3837`.
  confidence: 0.3837,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_009' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_010'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_010' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:DEPENDS_ON {
  // Property / setting `strength` = `0.6102`.
  strength: 0.6102,
  // Property / setting `latency` = `219`.
  latency: 219,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `5652`.
  bandwidth: 5652,
  // Property / setting `confidence` = `0.6957`.
  confidence: 0.6957,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_010' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_011'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_011' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:CALIBRATES {
  // Property / setting `strength` = `0.0936`.
  strength: 0.0936,
  // Property / setting `latency` = `15`.
  latency: 15,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `3005`.
  bandwidth: 3005,
  // Property / setting `confidence` = `0.704`.
  confidence: 0.704,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_011' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_012'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_012' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:OBSERVES {
  // Property / setting `strength` = `0.4487`.
  strength: 0.4487,
  // Property / setting `latency` = `203`.
  latency: 203,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `7103`.
  bandwidth: 7103,
  // Property / setting `confidence` = `0.4267`.
  confidence: 0.4267,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_012' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_013'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_013' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:DEPENDS_ON {
  // Property / setting `strength` = `0.8995`.
  strength: 0.8995,
  // Property / setting `latency` = `211`.
  latency: 211,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `1059`.
  bandwidth: 1059,
  // Property / setting `confidence` = `0.277`.
  confidence: 0.277,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_013' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_014'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_014' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:TRIGGERS {
  // Property / setting `strength` = `0.7235`.
  strength: 0.7235,
  // Property / setting `latency` = `64`.
  latency: 64,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `307`.
  bandwidth: 307,
  // Property / setting `confidence` = `0.2348`.
  confidence: 0.2348,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_014' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_015'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_015' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:DEPENDS_ON {
  // Property / setting `strength` = `0.0483`.
  strength: 0.0483,
  // Property / setting `latency` = `68`.
  latency: 68,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `1251`.
  bandwidth: 1251,
  // Property / setting `confidence` = `0.9946`.
  confidence: 0.9946,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_015' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_016'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_016' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:PRODUCES {
  // Property / setting `strength` = `0.3509`.
  strength: 0.3509,
  // Property / setting `latency` = `130`.
  latency: 130,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `5959`.
  bandwidth: 5959,
  // Property / setting `confidence` = `0.0861`.
  confidence: 0.0861,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_016' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_017'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_017' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:DEPENDS_ON {
  // Property / setting `strength` = `0.9278`.
  strength: 0.9278,
  // Property / setting `latency` = `191`.
  latency: 191,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `2396`.
  bandwidth: 2396,
  // Property / setting `confidence` = `0.1202`.
  confidence: 0.1202,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_017' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_018'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_018' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:MONITORS {
  // Property / setting `strength` = `0.3611`.
  strength: 0.3611,
  // Property / setting `latency` = `248`.
  latency: 248,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `6712`.
  bandwidth: 6712,
  // Property / setting `confidence` = `0.2963`.
  confidence: 0.2963,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_018' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_019'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_019' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:TRIGGERS {
  // Property / setting `strength` = `0.3683`.
  strength: 0.3683,
  // Property / setting `latency` = `216`.
  latency: 216,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `4825`.
  bandwidth: 4825,
  // Property / setting `confidence` = `0.9768`.
  confidence: 0.9768,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_019' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_020'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_020' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:OBSERVES {
  // Property / setting `strength` = `0.3418`.
  strength: 0.3418,
  // Property / setting `latency` = `106`.
  latency: 106,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `7050`.
  bandwidth: 7050,
  // Property / setting `confidence` = `0.9173`.
  confidence: 0.9173,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_020' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_021'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_021' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:OBSERVES {
  // Property / setting `strength` = `0.472`.
  strength: 0.472,
  // Property / setting `latency` = `208`.
  latency: 208,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `1280`.
  bandwidth: 1280,
  // Property / setting `confidence` = `0.5235`.
  confidence: 0.5235,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_021' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_022'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_022' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:ROUTES_TO {
  // Property / setting `strength` = `0.9708`.
  strength: 0.9708,
  // Property / setting `latency` = `114`.
  latency: 114,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `9714`.
  bandwidth: 9714,
  // Property / setting `confidence` = `0.8393`.
  confidence: 0.8393,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_022' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_023'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_023' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:ROUTES_TO {
  // Property / setting `strength` = `0.4348`.
  strength: 0.4348,
  // Property / setting `latency` = `94`.
  latency: 94,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `7609`.
  bandwidth: 7609,
  // Property / setting `confidence` = `0.1309`.
  confidence: 0.1309,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_023' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_024'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_024' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:PRODUCES {
  // Property / setting `strength` = `0.2613`.
  strength: 0.2613,
  // Property / setting `latency` = `151`.
  latency: 151,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `5207`.
  bandwidth: 5207,
  // Property / setting `confidence` = `0.5495`.
  confidence: 0.5495,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_024' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_025'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_025' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:PRODUCES {
  // Property / setting `strength` = `0.2856`.
  strength: 0.2856,
  // Property / setting `latency` = `249`.
  latency: 249,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `8868`.
  bandwidth: 8868,
  // Property / setting `confidence` = `0.5458`.
  confidence: 0.5458,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_025' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_026'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_026' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:CALIBRATES {
  // Property / setting `strength` = `0.8271`.
  strength: 0.8271,
  // Property / setting `latency` = `115`.
  latency: 115,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `8186`.
  bandwidth: 8186,
  // Property / setting `confidence` = `0.6442`.
  confidence: 0.6442,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_026' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_027'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_027' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:VALIDATES {
  // Property / setting `strength` = `0.6922`.
  strength: 0.6922,
  // Property / setting `latency` = `85`.
  latency: 85,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `2483`.
  bandwidth: 2483,
  // Property / setting `confidence` = `0.8885`.
  confidence: 0.8885,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_027' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_028'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_028' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:TRIGGERS {
  // Property / setting `strength` = `0.9014`.
  strength: 0.9014,
  // Property / setting `latency` = `190`.
  latency: 190,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `6907`.
  bandwidth: 6907,
  // Property / setting `confidence` = `0.7775`.
  confidence: 0.7775,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_028' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_029'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_029' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:VALIDATES {
  // Property / setting `strength` = `0.001`.
  strength: 0.001,
  // Property / setting `latency` = `157`.
  latency: 157,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `5365`.
  bandwidth: 5365,
  // Property / setting `confidence` = `0.6124`.
  confidence: 0.6124,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_06_validation_layer_2_029' })`.
MATCH (a:Multimodal { identifier: 'multimodal_06_validation_layer_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_06_validation_layer_2_000'`.
      (b:Multimodal { identifier: 'multimodal_06_validation_layer_2_000' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:CALIBRATES {
  // Property / setting `strength` = `0.8775`.
  strength: 0.8775,
  // Property / setting `latency` = `202`.
  latency: 202,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `2683`.
  bandwidth: 2683,
  // Property / setting `confidence` = `0.6711`.
  confidence: 0.6711,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
