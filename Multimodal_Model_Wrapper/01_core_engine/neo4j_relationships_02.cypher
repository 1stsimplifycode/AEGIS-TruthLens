// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project (core
//                                  engine area). It is one small, separate piece so each
//                                  language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New relationships stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_02_02'
//                                  - batchSize = 128
//                                  - threshold = 0.684
//                                  - maxDepth = 4
//                                  - timeoutSeconds = 99
//                                  - region = 'us-west'
//                                  - epoch = 73
//                                  - version = '2.7.4'
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
// Set the parameter `batchSize` to `128`; later lines can use it as $batchSize.
:param batchSize => 128;
// Set the parameter `threshold` to `0.684`; later lines can use it as $threshold.
:param threshold => 0.684;
// Set the parameter `maxDepth` to `4`; later lines can use it as $maxDepth.
:param maxDepth => 4;
// Set the parameter `timeoutSeconds` to `99`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 99;
// Set the parameter `region` to `'us-west'`; later lines can use it as $region.
:param region => 'us-west';
// Set the parameter `epoch` to `73`; later lines can use it as $epoch.
:param epoch => 73;
// Set the parameter `version` to `'2.7.4'`; later lines can use it as $version.
:param version => '2.7.4';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_000' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_001'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_001' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:DEPENDS_ON {
  // Property / setting `strength` = `0.9025`.
  strength: 0.9025,
  // Property / setting `latency` = `58`.
  latency: 58,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `3549`.
  bandwidth: 3549,
  // Property / setting `confidence` = `0.1818`.
  confidence: 0.1818,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_001' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_002'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_002' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:ROUTES_TO {
  // Property / setting `strength` = `0.926`.
  strength: 0.926,
  // Property / setting `latency` = `192`.
  latency: 192,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `9614`.
  bandwidth: 9614,
  // Property / setting `confidence` = `0.7016`.
  confidence: 0.7016,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_002' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_003'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_003' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:VALIDATES {
  // Property / setting `strength` = `0.1929`.
  strength: 0.1929,
  // Property / setting `latency` = `202`.
  latency: 202,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `7362`.
  bandwidth: 7362,
  // Property / setting `confidence` = `0.1498`.
  confidence: 0.1498,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_003' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_004'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_004' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:OBSERVES {
  // Property / setting `strength` = `0.0004`.
  strength: 0.0004,
  // Property / setting `latency` = `119`.
  latency: 119,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `6976`.
  bandwidth: 6976,
  // Property / setting `confidence` = `0.0939`.
  confidence: 0.0939,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_004' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_005'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_005' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:DEPENDS_ON {
  // Property / setting `strength` = `0.9716`.
  strength: 0.9716,
  // Property / setting `latency` = `217`.
  latency: 217,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `6101`.
  bandwidth: 6101,
  // Property / setting `confidence` = `0.3173`.
  confidence: 0.3173,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_005' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_006'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_006' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:OBSERVES {
  // Property / setting `strength` = `0.0858`.
  strength: 0.0858,
  // Property / setting `latency` = `105`.
  latency: 105,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `6379`.
  bandwidth: 6379,
  // Property / setting `confidence` = `0.1272`.
  confidence: 0.1272,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_006' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_007'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_007' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:TRIGGERS {
  // Property / setting `strength` = `0.3224`.
  strength: 0.3224,
  // Property / setting `latency` = `99`.
  latency: 99,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `782`.
  bandwidth: 782,
  // Property / setting `confidence` = `0.8853`.
  confidence: 0.8853,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_007' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_008'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_008' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:VALIDATES {
  // Property / setting `strength` = `0.2578`.
  strength: 0.2578,
  // Property / setting `latency` = `149`.
  latency: 149,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `5291`.
  bandwidth: 5291,
  // Property / setting `confidence` = `0.3111`.
  confidence: 0.3111,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_008' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_009'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_009' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:PRODUCES {
  // Property / setting `strength` = `0.2094`.
  strength: 0.2094,
  // Property / setting `latency` = `128`.
  latency: 128,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `1674`.
  bandwidth: 1674,
  // Property / setting `confidence` = `0.8392`.
  confidence: 0.8392,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_009' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_010'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_010' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:OBSERVES {
  // Property / setting `strength` = `0.5991`.
  strength: 0.5991,
  // Property / setting `latency` = `179`.
  latency: 179,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `3951`.
  bandwidth: 3951,
  // Property / setting `confidence` = `0.919`.
  confidence: 0.919,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_010' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_011'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_011' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:MONITORS {
  // Property / setting `strength` = `0.6082`.
  strength: 0.6082,
  // Property / setting `latency` = `198`.
  latency: 198,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `7384`.
  bandwidth: 7384,
  // Property / setting `confidence` = `0.5343`.
  confidence: 0.5343,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_011' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_012'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_012' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:MONITORS {
  // Property / setting `strength` = `0.5475`.
  strength: 0.5475,
  // Property / setting `latency` = `85`.
  latency: 85,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `4659`.
  bandwidth: 4659,
  // Property / setting `confidence` = `0.7457`.
  confidence: 0.7457,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_012' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_013'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_013' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:DEPENDS_ON {
  // Property / setting `strength` = `0.2289`.
  strength: 0.2289,
  // Property / setting `latency` = `75`.
  latency: 75,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `4955`.
  bandwidth: 4955,
  // Property / setting `confidence` = `0.7403`.
  confidence: 0.7403,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_013' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_014'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_014' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:VALIDATES {
  // Property / setting `strength` = `0.4563`.
  strength: 0.4563,
  // Property / setting `latency` = `61`.
  latency: 61,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `2574`.
  bandwidth: 2574,
  // Property / setting `confidence` = `0.6524`.
  confidence: 0.6524,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_014' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_015'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_015' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:ROUTES_TO {
  // Property / setting `strength` = `0.526`.
  strength: 0.526,
  // Property / setting `latency` = `209`.
  latency: 209,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `741`.
  bandwidth: 741,
  // Property / setting `confidence` = `0.5653`.
  confidence: 0.5653,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_015' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_016'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_016' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:ROUTES_TO {
  // Property / setting `strength` = `0.8546`.
  strength: 0.8546,
  // Property / setting `latency` = `204`.
  latency: 204,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `2696`.
  bandwidth: 2696,
  // Property / setting `confidence` = `0.7297`.
  confidence: 0.7297,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_016' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_017'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_017' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:ROUTES_TO {
  // Property / setting `strength` = `0.9472`.
  strength: 0.9472,
  // Property / setting `latency` = `212`.
  latency: 212,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `1913`.
  bandwidth: 1913,
  // Property / setting `confidence` = `0.2004`.
  confidence: 0.2004,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_017' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_018'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_018' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:DEPENDS_ON {
  // Property / setting `strength` = `0.6812`.
  strength: 0.6812,
  // Property / setting `latency` = `191`.
  latency: 191,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `6350`.
  bandwidth: 6350,
  // Property / setting `confidence` = `0.261`.
  confidence: 0.261,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_018' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_019'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_019' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:CALIBRATES {
  // Property / setting `strength` = `0.0641`.
  strength: 0.0641,
  // Property / setting `latency` = `123`.
  latency: 123,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `1046`.
  bandwidth: 1046,
  // Property / setting `confidence` = `0.1552`.
  confidence: 0.1552,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_019' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_020'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_020' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:MONITORS {
  // Property / setting `strength` = `0.2733`.
  strength: 0.2733,
  // Property / setting `latency` = `156`.
  latency: 156,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `7985`.
  bandwidth: 7985,
  // Property / setting `confidence` = `0.3968`.
  confidence: 0.3968,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_020' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_021'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_021' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:DEPENDS_ON {
  // Property / setting `strength` = `0.9314`.
  strength: 0.9314,
  // Property / setting `latency` = `42`.
  latency: 42,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `9549`.
  bandwidth: 9549,
  // Property / setting `confidence` = `0.7728`.
  confidence: 0.7728,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_021' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_022'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_022' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:TRIGGERS {
  // Property / setting `strength` = `0.1091`.
  strength: 0.1091,
  // Property / setting `latency` = `209`.
  latency: 209,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `8101`.
  bandwidth: 8101,
  // Property / setting `confidence` = `0.2143`.
  confidence: 0.2143,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_022' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_023'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_023' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:DEPENDS_ON {
  // Property / setting `strength` = `0.5834`.
  strength: 0.5834,
  // Property / setting `latency` = `61`.
  latency: 61,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `6724`.
  bandwidth: 6724,
  // Property / setting `confidence` = `0.853`.
  confidence: 0.853,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_023' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_024'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_024' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:MONITORS {
  // Property / setting `strength` = `0.2449`.
  strength: 0.2449,
  // Property / setting `latency` = `20`.
  latency: 20,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `3402`.
  bandwidth: 3402,
  // Property / setting `confidence` = `0.9654`.
  confidence: 0.9654,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_024' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_025'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_025' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:OBSERVES {
  // Property / setting `strength` = `0.5182`.
  strength: 0.5182,
  // Property / setting `latency` = `249`.
  latency: 249,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `9965`.
  bandwidth: 9965,
  // Property / setting `confidence` = `0.475`.
  confidence: 0.475,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_025' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_026'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_026' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:ROUTES_TO {
  // Property / setting `strength` = `0.4611`.
  strength: 0.4611,
  // Property / setting `latency` = `36`.
  latency: 36,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `2939`.
  bandwidth: 2939,
  // Property / setting `confidence` = `0.137`.
  confidence: 0.137,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_026' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_027'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_027' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:OBSERVES {
  // Property / setting `strength` = `0.0735`.
  strength: 0.0735,
  // Property / setting `latency` = `168`.
  latency: 168,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `2075`.
  bandwidth: 2075,
  // Property / setting `confidence` = `0.0278`.
  confidence: 0.0278,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_027' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_028'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_028' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:DEPENDS_ON {
  // Property / setting `strength` = `0.2047`.
  strength: 0.2047,
  // Property / setting `latency` = `233`.
  latency: 233,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `1403`.
  bandwidth: 1403,
  // Property / setting `confidence` = `0.661`.
  confidence: 0.661,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_028' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_029'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_029' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:OBSERVES {
  // Property / setting `strength` = `0.8182`.
  strength: 0.8182,
  // Property / setting `latency` = `32`.
  latency: 32,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `2288`.
  bandwidth: 2288,
  // Property / setting `confidence` = `0.5057`.
  confidence: 0.5057,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_01_core_engine_2_029' })`.
MATCH (a:Multimodal { identifier: 'multimodal_01_core_engine_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_01_core_engine_2_000'`.
      (b:Multimodal { identifier: 'multimodal_01_core_engine_2_000' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:VALIDATES {
  // Property / setting `strength` = `0.2451`.
  strength: 0.2451,
  // Property / setting `latency` = `36`.
  latency: 36,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `7626`.
  bandwidth: 7626,
  // Property / setting `confidence` = `0.698`.
  confidence: 0.698,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
