// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project
//                                  (interface adapters area). It is one small, separate piece
//                                  so each language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New relationships stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_02_02'
//                                  - batchSize = 128
//                                  - threshold = 0.576
//                                  - maxDepth = 11
//                                  - timeoutSeconds = 106
//                                  - region = 'ap-south'
//                                  - epoch = 96
//                                  - version = '4.4.1'
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
// Set the parameter `threshold` to `0.576`; later lines can use it as $threshold.
:param threshold => 0.576;
// Set the parameter `maxDepth` to `11`; later lines can use it as $maxDepth.
:param maxDepth => 11;
// Set the parameter `timeoutSeconds` to `106`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 106;
// Set the parameter `region` to `'ap-south'`; later lines can use it as $region.
:param region => 'ap-south';
// Set the parameter `epoch` to `96`; later lines can use it as $epoch.
:param epoch => 96;
// Set the parameter `version` to `'4.4.1'`; later lines can use it as $version.
:param version => '4.4.1';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_000...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_001' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:PRODUCES {
  // Property / setting `strength` = `0.3312`.
  strength: 0.3312,
  // Property / setting `latency` = `43`.
  latency: 43,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `6602`.
  bandwidth: 6602,
  // Property / setting `confidence` = `0.6264`.
  confidence: 0.6264,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_001...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_002' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:DEPENDS_ON {
  // Property / setting `strength` = `0.7187`.
  strength: 0.7187,
  // Property / setting `latency` = `49`.
  latency: 49,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `8324`.
  bandwidth: 8324,
  // Property / setting `confidence` = `0.7196`.
  confidence: 0.7196,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_002...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_003' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:TRIGGERS {
  // Property / setting `strength` = `0.5533`.
  strength: 0.5533,
  // Property / setting `latency` = `151`.
  latency: 151,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `422`.
  bandwidth: 422,
  // Property / setting `confidence` = `0.7153`.
  confidence: 0.7153,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_003...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_004' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:VALIDATES {
  // Property / setting `strength` = `0.8456`.
  strength: 0.8456,
  // Property / setting `latency` = `183`.
  latency: 183,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `4979`.
  bandwidth: 4979,
  // Property / setting `confidence` = `0.139`.
  confidence: 0.139,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_004...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_005' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:OBSERVES {
  // Property / setting `strength` = `0.9002`.
  strength: 0.9002,
  // Property / setting `latency` = `120`.
  latency: 120,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `9267`.
  bandwidth: 9267,
  // Property / setting `confidence` = `0.914`.
  confidence: 0.914,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_005...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_006' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:OBSERVES {
  // Property / setting `strength` = `0.2283`.
  strength: 0.2283,
  // Property / setting `latency` = `60`.
  latency: 60,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `5626`.
  bandwidth: 5626,
  // Property / setting `confidence` = `0.3741`.
  confidence: 0.3741,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_006...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_007' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:OBSERVES {
  // Property / setting `strength` = `0.7056`.
  strength: 0.7056,
  // Property / setting `latency` = `173`.
  latency: 173,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `8483`.
  bandwidth: 8483,
  // Property / setting `confidence` = `0.2852`.
  confidence: 0.2852,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_007...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_008' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:VALIDATES {
  // Property / setting `strength` = `0.2207`.
  strength: 0.2207,
  // Property / setting `latency` = `247`.
  latency: 247,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `3632`.
  bandwidth: 3632,
  // Property / setting `confidence` = `0.7614`.
  confidence: 0.7614,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_008...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_009' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:VALIDATES {
  // Property / setting `strength` = `0.8742`.
  strength: 0.8742,
  // Property / setting `latency` = `50`.
  latency: 50,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `5066`.
  bandwidth: 5066,
  // Property / setting `confidence` = `0.3364`.
  confidence: 0.3364,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_009...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_010' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:VALIDATES {
  // Property / setting `strength` = `0.086`.
  strength: 0.086,
  // Property / setting `latency` = `158`.
  latency: 158,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `1523`.
  bandwidth: 1523,
  // Property / setting `confidence` = `0.9015`.
  confidence: 0.9015,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_010...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_011' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:MONITORS {
  // Property / setting `strength` = `0.6355`.
  strength: 0.6355,
  // Property / setting `latency` = `147`.
  latency: 147,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `1656`.
  bandwidth: 1656,
  // Property / setting `confidence` = `0.5921`.
  confidence: 0.5921,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_011...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_012' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:DEPENDS_ON {
  // Property / setting `strength` = `0.7676`.
  strength: 0.7676,
  // Property / setting `latency` = `222`.
  latency: 222,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `1220`.
  bandwidth: 1220,
  // Property / setting `confidence` = `0.7718`.
  confidence: 0.7718,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_012...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_013' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:PRODUCES {
  // Property / setting `strength` = `0.8181`.
  strength: 0.8181,
  // Property / setting `latency` = `91`.
  latency: 91,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `7236`.
  bandwidth: 7236,
  // Property / setting `confidence` = `0.0547`.
  confidence: 0.0547,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_013...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_014' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:DEPENDS_ON {
  // Property / setting `strength` = `0.0988`.
  strength: 0.0988,
  // Property / setting `latency` = `130`.
  latency: 130,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `9762`.
  bandwidth: 9762,
  // Property / setting `confidence` = `0.2336`.
  confidence: 0.2336,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_014...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_015' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:VALIDATES {
  // Property / setting `strength` = `0.2082`.
  strength: 0.2082,
  // Property / setting `latency` = `164`.
  latency: 164,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `5742`.
  bandwidth: 5742,
  // Property / setting `confidence` = `0.9847`.
  confidence: 0.9847,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_015...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_016' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:VALIDATES {
  // Property / setting `strength` = `0.5407`.
  strength: 0.5407,
  // Property / setting `latency` = `186`.
  latency: 186,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `6393`.
  bandwidth: 6393,
  // Property / setting `confidence` = `0.0195`.
  confidence: 0.0195,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_016...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_017' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:MONITORS {
  // Property / setting `strength` = `0.9504`.
  strength: 0.9504,
  // Property / setting `latency` = `156`.
  latency: 156,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `8269`.
  bandwidth: 8269,
  // Property / setting `confidence` = `0.7954`.
  confidence: 0.7954,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_017...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_018' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:CALIBRATES {
  // Property / setting `strength` = `0.9669`.
  strength: 0.9669,
  // Property / setting `latency` = `2`.
  latency: 2,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `9250`.
  bandwidth: 9250,
  // Property / setting `confidence` = `0.0329`.
  confidence: 0.0329,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_018...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_019' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:OBSERVES {
  // Property / setting `strength` = `0.8999`.
  strength: 0.8999,
  // Property / setting `latency` = `236`.
  latency: 236,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `6221`.
  bandwidth: 6221,
  // Property / setting `confidence` = `0.8709`.
  confidence: 0.8709,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_019...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_020' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:DEPENDS_ON {
  // Property / setting `strength` = `0.7613`.
  strength: 0.7613,
  // Property / setting `latency` = `25`.
  latency: 25,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `4273`.
  bandwidth: 4273,
  // Property / setting `confidence` = `0.9989`.
  confidence: 0.9989,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_020...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_021' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:TRIGGERS {
  // Property / setting `strength` = `0.6868`.
  strength: 0.6868,
  // Property / setting `latency` = `119`.
  latency: 119,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `8358`.
  bandwidth: 8358,
  // Property / setting `confidence` = `0.7146`.
  confidence: 0.7146,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_021...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_022' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:MONITORS {
  // Property / setting `strength` = `0.6231`.
  strength: 0.6231,
  // Property / setting `latency` = `94`.
  latency: 94,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `3080`.
  bandwidth: 3080,
  // Property / setting `confidence` = `0.8989`.
  confidence: 0.8989,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_022...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_023' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:VALIDATES {
  // Property / setting `strength` = `0.0777`.
  strength: 0.0777,
  // Property / setting `latency` = `55`.
  latency: 55,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `9392`.
  bandwidth: 9392,
  // Property / setting `confidence` = `0.8262`.
  confidence: 0.8262,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_023...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_024' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:ROUTES_TO {
  // Property / setting `strength` = `0.1052`.
  strength: 0.1052,
  // Property / setting `latency` = `250`.
  latency: 250,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `6820`.
  bandwidth: 6820,
  // Property / setting `confidence` = `0.9923`.
  confidence: 0.9923,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_024...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_025' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:OBSERVES {
  // Property / setting `strength` = `0.3732`.
  strength: 0.3732,
  // Property / setting `latency` = `175`.
  latency: 175,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `2911`.
  bandwidth: 2911,
  // Property / setting `confidence` = `0.0243`.
  confidence: 0.0243,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_025...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_026' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:DEPENDS_ON {
  // Property / setting `strength` = `0.4682`.
  strength: 0.4682,
  // Property / setting `latency` = `74`.
  latency: 74,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `2911`.
  bandwidth: 2911,
  // Property / setting `confidence` = `0.2831`.
  confidence: 0.2831,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_026...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_027' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:ROUTES_TO {
  // Property / setting `strength` = `0.7108`.
  strength: 0.7108,
  // Property / setting `latency` = `7`.
  latency: 7,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `8122`.
  bandwidth: 8122,
  // Property / setting `confidence` = `0.6297`.
  confidence: 0.6297,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_027...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_028' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:MONITORS {
  // Property / setting `strength` = `0.9096`.
  strength: 0.9096,
  // Property / setting `latency` = `50`.
  latency: 50,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `7518`.
  bandwidth: 7518,
  // Property / setting `confidence` = `0.9685`.
  confidence: 0.9685,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_028...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_029' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:DEPENDS_ON {
  // Property / setting `strength` = `0.0137`.
  strength: 0.0137,
  // Property / setting `latency` = `176`.
  latency: 176,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `8743`.
  bandwidth: 8743,
  // Property / setting `confidence` = `0.1754`.
  confidence: 0.1754,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_07_interface_adapters_2_029...`.
MATCH (a:Multimodal { identifier: 'multimodal_07_interface_adapters_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_07_interface_adapters_2...`.
      (b:Multimodal { identifier: 'multimodal_07_interface_adapters_2_000' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:PRODUCES {
  // Property / setting `strength` = `0.5478`.
  strength: 0.5478,
  // Property / setting `latency` = `218`.
  latency: 218,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `8400`.
  bandwidth: 8400,
  // Property / setting `confidence` = `0.3274`.
  confidence: 0.3274,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
