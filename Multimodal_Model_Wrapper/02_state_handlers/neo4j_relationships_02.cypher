// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project (state
//                                  handlers area). It is one small, separate piece so each
//                                  language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New relationships stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_02_02'
//                                  - batchSize = 256
//                                  - threshold = 0.704
//                                  - maxDepth = 4
//                                  - timeoutSeconds = 113
//                                  - region = 'ap-south'
//                                  - epoch = 18
//                                  - version = '5.0.4'
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
// Set the parameter `threshold` to `0.704`; later lines can use it as $threshold.
:param threshold => 0.704;
// Set the parameter `maxDepth` to `4`; later lines can use it as $maxDepth.
:param maxDepth => 4;
// Set the parameter `timeoutSeconds` to `113`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 113;
// Set the parameter `region` to `'ap-south'`; later lines can use it as $region.
:param region => 'ap-south';
// Set the parameter `epoch` to `18`; later lines can use it as $epoch.
:param epoch => 18;
// Set the parameter `version` to `'5.0.4'`; later lines can use it as $version.
:param version => '5.0.4';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_000' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_001'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_001' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:ROUTES_TO {
  // Property / setting `strength` = `0.2387`.
  strength: 0.2387,
  // Property / setting `latency` = `65`.
  latency: 65,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `9510`.
  bandwidth: 9510,
  // Property / setting `confidence` = `0.0693`.
  confidence: 0.0693,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_001' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_002'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_002' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:OBSERVES {
  // Property / setting `strength` = `0.5768`.
  strength: 0.5768,
  // Property / setting `latency` = `50`.
  latency: 50,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `4546`.
  bandwidth: 4546,
  // Property / setting `confidence` = `0.5669`.
  confidence: 0.5669,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_002' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_003'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_003' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:MONITORS {
  // Property / setting `strength` = `0.6629`.
  strength: 0.6629,
  // Property / setting `latency` = `51`.
  latency: 51,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `962`.
  bandwidth: 962,
  // Property / setting `confidence` = `0.2944`.
  confidence: 0.2944,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_003' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_004'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_004' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:ROUTES_TO {
  // Property / setting `strength` = `0.9295`.
  strength: 0.9295,
  // Property / setting `latency` = `87`.
  latency: 87,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `5300`.
  bandwidth: 5300,
  // Property / setting `confidence` = `0.034`.
  confidence: 0.034,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_004' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_005'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_005' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:TRIGGERS {
  // Property / setting `strength` = `0.5938`.
  strength: 0.5938,
  // Property / setting `latency` = `15`.
  latency: 15,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `1665`.
  bandwidth: 1665,
  // Property / setting `confidence` = `0.3309`.
  confidence: 0.3309,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_005' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_006'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_006' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:PRODUCES {
  // Property / setting `strength` = `0.2141`.
  strength: 0.2141,
  // Property / setting `latency` = `65`.
  latency: 65,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `5225`.
  bandwidth: 5225,
  // Property / setting `confidence` = `0.6646`.
  confidence: 0.6646,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_006' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_007'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_007' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:TRIGGERS {
  // Property / setting `strength` = `0.8594`.
  strength: 0.8594,
  // Property / setting `latency` = `246`.
  latency: 246,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `3153`.
  bandwidth: 3153,
  // Property / setting `confidence` = `0.4167`.
  confidence: 0.4167,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_007' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_008'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_008' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:PRODUCES {
  // Property / setting `strength` = `0.5029`.
  strength: 0.5029,
  // Property / setting `latency` = `191`.
  latency: 191,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `5913`.
  bandwidth: 5913,
  // Property / setting `confidence` = `0.6155`.
  confidence: 0.6155,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_008' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_009'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_009' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:OBSERVES {
  // Property / setting `strength` = `0.5417`.
  strength: 0.5417,
  // Property / setting `latency` = `222`.
  latency: 222,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `9701`.
  bandwidth: 9701,
  // Property / setting `confidence` = `0.6288`.
  confidence: 0.6288,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_009' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_010'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_010' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:CALIBRATES {
  // Property / setting `strength` = `0.6368`.
  strength: 0.6368,
  // Property / setting `latency` = `242`.
  latency: 242,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `3353`.
  bandwidth: 3353,
  // Property / setting `confidence` = `0.8937`.
  confidence: 0.8937,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_010' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_011'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_011' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:PRODUCES {
  // Property / setting `strength` = `0.7918`.
  strength: 0.7918,
  // Property / setting `latency` = `193`.
  latency: 193,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `5253`.
  bandwidth: 5253,
  // Property / setting `confidence` = `0.9072`.
  confidence: 0.9072,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_011' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_012'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_012' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:OBSERVES {
  // Property / setting `strength` = `0.965`.
  strength: 0.965,
  // Property / setting `latency` = `225`.
  latency: 225,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `5290`.
  bandwidth: 5290,
  // Property / setting `confidence` = `0.3025`.
  confidence: 0.3025,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_012' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_013'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_013' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:VALIDATES {
  // Property / setting `strength` = `0.1393`.
  strength: 0.1393,
  // Property / setting `latency` = `234`.
  latency: 234,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `1495`.
  bandwidth: 1495,
  // Property / setting `confidence` = `0.2457`.
  confidence: 0.2457,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_013' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_014'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_014' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:MONITORS {
  // Property / setting `strength` = `0.5115`.
  strength: 0.5115,
  // Property / setting `latency` = `45`.
  latency: 45,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `7893`.
  bandwidth: 7893,
  // Property / setting `confidence` = `0.3198`.
  confidence: 0.3198,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_014' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_015'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_015' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:OBSERVES {
  // Property / setting `strength` = `0.6456`.
  strength: 0.6456,
  // Property / setting `latency` = `9`.
  latency: 9,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `2268`.
  bandwidth: 2268,
  // Property / setting `confidence` = `0.6675`.
  confidence: 0.6675,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_015' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_016'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_016' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:CALIBRATES {
  // Property / setting `strength` = `0.6102`.
  strength: 0.6102,
  // Property / setting `latency` = `23`.
  latency: 23,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `2171`.
  bandwidth: 2171,
  // Property / setting `confidence` = `0.3991`.
  confidence: 0.3991,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_016' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_017'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_017' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:PRODUCES {
  // Property / setting `strength` = `0.8123`.
  strength: 0.8123,
  // Property / setting `latency` = `131`.
  latency: 131,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `4866`.
  bandwidth: 4866,
  // Property / setting `confidence` = `0.4313`.
  confidence: 0.4313,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_017' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_018'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_018' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:OBSERVES {
  // Property / setting `strength` = `0.5273`.
  strength: 0.5273,
  // Property / setting `latency` = `201`.
  latency: 201,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `5298`.
  bandwidth: 5298,
  // Property / setting `confidence` = `0.6496`.
  confidence: 0.6496,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_018' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_019'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_019' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:PRODUCES {
  // Property / setting `strength` = `0.6621`.
  strength: 0.6621,
  // Property / setting `latency` = `49`.
  latency: 49,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `409`.
  bandwidth: 409,
  // Property / setting `confidence` = `0.7426`.
  confidence: 0.7426,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_019' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_020'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_020' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:OBSERVES {
  // Property / setting `strength` = `0.2132`.
  strength: 0.2132,
  // Property / setting `latency` = `219`.
  latency: 219,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `173`.
  bandwidth: 173,
  // Property / setting `confidence` = `0.5619`.
  confidence: 0.5619,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_020' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_021'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_021' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:OBSERVES {
  // Property / setting `strength` = `0.8621`.
  strength: 0.8621,
  // Property / setting `latency` = `215`.
  latency: 215,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `7374`.
  bandwidth: 7374,
  // Property / setting `confidence` = `0.174`.
  confidence: 0.174,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_021' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_022'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_022' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:DEPENDS_ON {
  // Property / setting `strength` = `0.2263`.
  strength: 0.2263,
  // Property / setting `latency` = `39`.
  latency: 39,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `2381`.
  bandwidth: 2381,
  // Property / setting `confidence` = `0.1474`.
  confidence: 0.1474,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_022' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_023'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_023' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:CALIBRATES {
  // Property / setting `strength` = `0.8281`.
  strength: 0.8281,
  // Property / setting `latency` = `203`.
  latency: 203,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `3166`.
  bandwidth: 3166,
  // Property / setting `confidence` = `0.9828`.
  confidence: 0.9828,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_023' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_024'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_024' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:OBSERVES {
  // Property / setting `strength` = `0.4684`.
  strength: 0.4684,
  // Property / setting `latency` = `75`.
  latency: 75,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `867`.
  bandwidth: 867,
  // Property / setting `confidence` = `0.5145`.
  confidence: 0.5145,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_024' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_025'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_025' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:OBSERVES {
  // Property / setting `strength` = `0.2735`.
  strength: 0.2735,
  // Property / setting `latency` = `131`.
  latency: 131,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `5254`.
  bandwidth: 5254,
  // Property / setting `confidence` = `0.2115`.
  confidence: 0.2115,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_025' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_026'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_026' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:TRIGGERS {
  // Property / setting `strength` = `0.965`.
  strength: 0.965,
  // Property / setting `latency` = `55`.
  latency: 55,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `5709`.
  bandwidth: 5709,
  // Property / setting `confidence` = `0.0133`.
  confidence: 0.0133,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_026' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_027'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_027' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:ROUTES_TO {
  // Property / setting `strength` = `0.1652`.
  strength: 0.1652,
  // Property / setting `latency` = `168`.
  latency: 168,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `2756`.
  bandwidth: 2756,
  // Property / setting `confidence` = `0.5663`.
  confidence: 0.5663,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_027' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_028'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_028' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:PRODUCES {
  // Property / setting `strength` = `0.7189`.
  strength: 0.7189,
  // Property / setting `latency` = `136`.
  latency: 136,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `8034`.
  bandwidth: 8034,
  // Property / setting `confidence` = `0.7393`.
  confidence: 0.7393,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_028' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_029'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_029' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:DEPENDS_ON {
  // Property / setting `strength` = `0.8124`.
  strength: 0.8124,
  // Property / setting `latency` = `71`.
  latency: 71,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `1609`.
  bandwidth: 1609,
  // Property / setting `confidence` = `0.8027`.
  confidence: 0.8027,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_02_state_handlers_2_029' })`.
MATCH (a:Multimodal { identifier: 'multimodal_02_state_handlers_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_02_state_handlers_2_000'`.
      (b:Multimodal { identifier: 'multimodal_02_state_handlers_2_000' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:TRIGGERS {
  // Property / setting `strength` = `0.8319`.
  strength: 0.8319,
  // Property / setting `latency` = `30`.
  latency: 30,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `4004`.
  bandwidth: 4004,
  // Property / setting `confidence` = `0.8745`.
  confidence: 0.8745,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
