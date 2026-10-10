// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project
//                                  (registry systems area). It is one small, separate piece so
//                                  each language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New relationships stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_02_02'
//                                  - batchSize = 64
//                                  - threshold = 0.732
//                                  - maxDepth = 11
//                                  - timeoutSeconds = 60
//                                  - region = 'eu-west'
//                                  - epoch = 40
//                                  - version = '5.3.1'
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
// Set the parameter `batchSize` to `64`; later lines can use it as $batchSize.
:param batchSize => 64;
// Set the parameter `threshold` to `0.732`; later lines can use it as $threshold.
:param threshold => 0.732;
// Set the parameter `maxDepth` to `11`; later lines can use it as $maxDepth.
:param maxDepth => 11;
// Set the parameter `timeoutSeconds` to `60`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 60;
// Set the parameter `region` to `'eu-west'`; later lines can use it as $region.
:param region => 'eu-west';
// Set the parameter `epoch` to `40`; later lines can use it as $epoch.
:param epoch => 40;
// Set the parameter `version` to `'5.3.1'`; later lines can use it as $version.
:param version => '5.3.1';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_000' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_001'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_001' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:PRODUCES {
  // Property / setting `strength` = `0.5705`.
  strength: 0.5705,
  // Property / setting `latency` = `67`.
  latency: 67,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `4628`.
  bandwidth: 4628,
  // Property / setting `confidence` = `0.7295`.
  confidence: 0.7295,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_001' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_002'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_002' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:CALIBRATES {
  // Property / setting `strength` = `0.4818`.
  strength: 0.4818,
  // Property / setting `latency` = `33`.
  latency: 33,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `8382`.
  bandwidth: 8382,
  // Property / setting `confidence` = `0.3025`.
  confidence: 0.3025,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_002' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_003'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_003' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:DEPENDS_ON {
  // Property / setting `strength` = `0.684`.
  strength: 0.684,
  // Property / setting `latency` = `186`.
  latency: 186,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `8000`.
  bandwidth: 8000,
  // Property / setting `confidence` = `0.5584`.
  confidence: 0.5584,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_003' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_004'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_004' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:ROUTES_TO {
  // Property / setting `strength` = `0.5811`.
  strength: 0.5811,
  // Property / setting `latency` = `116`.
  latency: 116,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `5409`.
  bandwidth: 5409,
  // Property / setting `confidence` = `0.6021`.
  confidence: 0.6021,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_004' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_005'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_005' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:OBSERVES {
  // Property / setting `strength` = `0.7937`.
  strength: 0.7937,
  // Property / setting `latency` = `196`.
  latency: 196,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `1483`.
  bandwidth: 1483,
  // Property / setting `confidence` = `0.1756`.
  confidence: 0.1756,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_005' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_006'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_006' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:ROUTES_TO {
  // Property / setting `strength` = `0.7558`.
  strength: 0.7558,
  // Property / setting `latency` = `8`.
  latency: 8,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `7216`.
  bandwidth: 7216,
  // Property / setting `confidence` = `0.2045`.
  confidence: 0.2045,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_006' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_007'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_007' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:CALIBRATES {
  // Property / setting `strength` = `0.0664`.
  strength: 0.0664,
  // Property / setting `latency` = `95`.
  latency: 95,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `8582`.
  bandwidth: 8582,
  // Property / setting `confidence` = `0.3092`.
  confidence: 0.3092,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_007' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_008'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_008' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:TRIGGERS {
  // Property / setting `strength` = `0.2457`.
  strength: 0.2457,
  // Property / setting `latency` = `18`.
  latency: 18,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `1800`.
  bandwidth: 1800,
  // Property / setting `confidence` = `0.7941`.
  confidence: 0.7941,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_008' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_009'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_009' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:MONITORS {
  // Property / setting `strength` = `0.4419`.
  strength: 0.4419,
  // Property / setting `latency` = `15`.
  latency: 15,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `7367`.
  bandwidth: 7367,
  // Property / setting `confidence` = `0.7041`.
  confidence: 0.7041,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_009' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_010'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_010' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:TRIGGERS {
  // Property / setting `strength` = `0.2713`.
  strength: 0.2713,
  // Property / setting `latency` = `124`.
  latency: 124,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `1072`.
  bandwidth: 1072,
  // Property / setting `confidence` = `0.537`.
  confidence: 0.537,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_010' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_011'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_011' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:TRIGGERS {
  // Property / setting `strength` = `0.0098`.
  strength: 0.0098,
  // Property / setting `latency` = `188`.
  latency: 188,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `685`.
  bandwidth: 685,
  // Property / setting `confidence` = `0.6638`.
  confidence: 0.6638,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_011' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_012'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_012' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:ROUTES_TO {
  // Property / setting `strength` = `0.4438`.
  strength: 0.4438,
  // Property / setting `latency` = `89`.
  latency: 89,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `1446`.
  bandwidth: 1446,
  // Property / setting `confidence` = `0.4811`.
  confidence: 0.4811,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_012' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_013'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_013' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:OBSERVES {
  // Property / setting `strength` = `0.3363`.
  strength: 0.3363,
  // Property / setting `latency` = `13`.
  latency: 13,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `6565`.
  bandwidth: 6565,
  // Property / setting `confidence` = `0.3128`.
  confidence: 0.3128,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_013' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_014'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_014' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:MONITORS {
  // Property / setting `strength` = `0.9331`.
  strength: 0.9331,
  // Property / setting `latency` = `201`.
  latency: 201,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `6958`.
  bandwidth: 6958,
  // Property / setting `confidence` = `0.8697`.
  confidence: 0.8697,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_014' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_015'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_015' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:VALIDATES {
  // Property / setting `strength` = `0.1943`.
  strength: 0.1943,
  // Property / setting `latency` = `193`.
  latency: 193,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `7961`.
  bandwidth: 7961,
  // Property / setting `confidence` = `0.0557`.
  confidence: 0.0557,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_015' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_016'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_016' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:TRIGGERS {
  // Property / setting `strength` = `0.3356`.
  strength: 0.3356,
  // Property / setting `latency` = `124`.
  latency: 124,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `238`.
  bandwidth: 238,
  // Property / setting `confidence` = `0.2202`.
  confidence: 0.2202,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_016' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_017'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_017' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:PRODUCES {
  // Property / setting `strength` = `0.845`.
  strength: 0.845,
  // Property / setting `latency` = `194`.
  latency: 194,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `4935`.
  bandwidth: 4935,
  // Property / setting `confidence` = `0.7621`.
  confidence: 0.7621,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_017' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_018'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_018' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:TRIGGERS {
  // Property / setting `strength` = `0.9609`.
  strength: 0.9609,
  // Property / setting `latency` = `159`.
  latency: 159,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `2897`.
  bandwidth: 2897,
  // Property / setting `confidence` = `0.0322`.
  confidence: 0.0322,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_018' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_019'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_019' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:DEPENDS_ON {
  // Property / setting `strength` = `0.3514`.
  strength: 0.3514,
  // Property / setting `latency` = `36`.
  latency: 36,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `9367`.
  bandwidth: 9367,
  // Property / setting `confidence` = `0.5906`.
  confidence: 0.5906,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_019' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_020'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_020' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:VALIDATES {
  // Property / setting `strength` = `0.5509`.
  strength: 0.5509,
  // Property / setting `latency` = `145`.
  latency: 145,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `4549`.
  bandwidth: 4549,
  // Property / setting `confidence` = `0.4293`.
  confidence: 0.4293,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_020' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_021'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_021' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:TRIGGERS {
  // Property / setting `strength` = `0.2017`.
  strength: 0.2017,
  // Property / setting `latency` = `13`.
  latency: 13,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `9802`.
  bandwidth: 9802,
  // Property / setting `confidence` = `0.7895`.
  confidence: 0.7895,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_021' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_022'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_022' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:CALIBRATES {
  // Property / setting `strength` = `0.5286`.
  strength: 0.5286,
  // Property / setting `latency` = `138`.
  latency: 138,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `8554`.
  bandwidth: 8554,
  // Property / setting `confidence` = `0.1706`.
  confidence: 0.1706,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_022' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_023'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_023' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:MONITORS {
  // Property / setting `strength` = `0.3723`.
  strength: 0.3723,
  // Property / setting `latency` = `142`.
  latency: 142,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `9555`.
  bandwidth: 9555,
  // Property / setting `confidence` = `0.4979`.
  confidence: 0.4979,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_023' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_024'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_024' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:OBSERVES {
  // Property / setting `strength` = `0.132`.
  strength: 0.132,
  // Property / setting `latency` = `95`.
  latency: 95,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `8526`.
  bandwidth: 8526,
  // Property / setting `confidence` = `0.5468`.
  confidence: 0.5468,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_024' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_025'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_025' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:MONITORS {
  // Property / setting `strength` = `0.3744`.
  strength: 0.3744,
  // Property / setting `latency` = `140`.
  latency: 140,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `8702`.
  bandwidth: 8702,
  // Property / setting `confidence` = `0.2601`.
  confidence: 0.2601,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_025' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_026'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_026' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:DEPENDS_ON {
  // Property / setting `strength` = `0.4163`.
  strength: 0.4163,
  // Property / setting `latency` = `78`.
  latency: 78,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `6669`.
  bandwidth: 6669,
  // Property / setting `confidence` = `0.4978`.
  confidence: 0.4978,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_026' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_027'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_027' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:VALIDATES {
  // Property / setting `strength` = `0.8237`.
  strength: 0.8237,
  // Property / setting `latency` = `40`.
  latency: 40,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `9107`.
  bandwidth: 9107,
  // Property / setting `confidence` = `0.1758`.
  confidence: 0.1758,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_027' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_028'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_028' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:CALIBRATES {
  // Property / setting `strength` = `0.0307`.
  strength: 0.0307,
  // Property / setting `latency` = `219`.
  latency: 219,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `2191`.
  bandwidth: 2191,
  // Property / setting `confidence` = `0.1936`.
  confidence: 0.1936,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_028' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_029'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_029' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:VALIDATES {
  // Property / setting `strength` = `0.3227`.
  strength: 0.3227,
  // Property / setting `latency` = `230`.
  latency: 230,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `7843`.
  bandwidth: 7843,
  // Property / setting `confidence` = `0.4089`.
  confidence: 0.4089,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_04_registry_systems_2_029' })`.
MATCH (a:Multimodal { identifier: 'multimodal_04_registry_systems_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_04_registry_systems_2_000'`.
      (b:Multimodal { identifier: 'multimodal_04_registry_systems_2_000' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:MONITORS {
  // Property / setting `strength` = `0.4159`.
  strength: 0.4159,
  // Property / setting `latency` = `71`.
  latency: 71,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `6694`.
  bandwidth: 6694,
  // Property / setting `confidence` = `0.9757`.
  confidence: 0.9757,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
