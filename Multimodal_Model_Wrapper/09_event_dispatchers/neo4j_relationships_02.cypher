// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project (event
//                                  dispatchers area). It is one small, separate piece so each
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
//                                  - threshold = 0.209
//                                  - maxDepth = 3
//                                  - timeoutSeconds = 57
//                                  - region = 'us-east'
//                                  - epoch = 71
//                                  - version = '2.0.0'
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
// Set the parameter `threshold` to `0.209`; later lines can use it as $threshold.
:param threshold => 0.209;
// Set the parameter `maxDepth` to `3`; later lines can use it as $maxDepth.
:param maxDepth => 3;
// Set the parameter `timeoutSeconds` to `57`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 57;
// Set the parameter `region` to `'us-east'`; later lines can use it as $region.
:param region => 'us-east';
// Set the parameter `epoch` to `71`; later lines can use it as $epoch.
:param epoch => 71;
// Set the parameter `version` to `'2.0.0'`; later lines can use it as $version.
:param version => '2.0.0';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_000' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_001' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:VALIDATES {
  // Property / setting `strength` = `0.3045`.
  strength: 0.3045,
  // Property / setting `latency` = `200`.
  latency: 200,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `9931`.
  bandwidth: 9931,
  // Property / setting `confidence` = `0.7512`.
  confidence: 0.7512,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_001' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_002' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:VALIDATES {
  // Property / setting `strength` = `0.2212`.
  strength: 0.2212,
  // Property / setting `latency` = `222`.
  latency: 222,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `1558`.
  bandwidth: 1558,
  // Property / setting `confidence` = `0.6018`.
  confidence: 0.6018,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_002' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_003' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:VALIDATES {
  // Property / setting `strength` = `0.1572`.
  strength: 0.1572,
  // Property / setting `latency` = `37`.
  latency: 37,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `4683`.
  bandwidth: 4683,
  // Property / setting `confidence` = `0.7519`.
  confidence: 0.7519,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_003' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_004' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:PRODUCES {
  // Property / setting `strength` = `0.2011`.
  strength: 0.2011,
  // Property / setting `latency` = `225`.
  latency: 225,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `2559`.
  bandwidth: 2559,
  // Property / setting `confidence` = `0.4375`.
  confidence: 0.4375,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_004' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_005' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:DEPENDS_ON {
  // Property / setting `strength` = `0.6787`.
  strength: 0.6787,
  // Property / setting `latency` = `184`.
  latency: 184,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `1928`.
  bandwidth: 1928,
  // Property / setting `confidence` = `0.9127`.
  confidence: 0.9127,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_005' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_006' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:DEPENDS_ON {
  // Property / setting `strength` = `0.6482`.
  strength: 0.6482,
  // Property / setting `latency` = `197`.
  latency: 197,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `5795`.
  bandwidth: 5795,
  // Property / setting `confidence` = `0.0291`.
  confidence: 0.0291,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_006' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_007' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:TRIGGERS {
  // Property / setting `strength` = `0.8198`.
  strength: 0.8198,
  // Property / setting `latency` = `67`.
  latency: 67,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `4951`.
  bandwidth: 4951,
  // Property / setting `confidence` = `0.0808`.
  confidence: 0.0808,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_007' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_008' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:OBSERVES {
  // Property / setting `strength` = `0.8982`.
  strength: 0.8982,
  // Property / setting `latency` = `112`.
  latency: 112,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `192`.
  bandwidth: 192,
  // Property / setting `confidence` = `0.9852`.
  confidence: 0.9852,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_008' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_009' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:CALIBRATES {
  // Property / setting `strength` = `0.8248`.
  strength: 0.8248,
  // Property / setting `latency` = `119`.
  latency: 119,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `7546`.
  bandwidth: 7546,
  // Property / setting `confidence` = `0.192`.
  confidence: 0.192,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_009' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_010' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:TRIGGERS {
  // Property / setting `strength` = `0.4614`.
  strength: 0.4614,
  // Property / setting `latency` = `249`.
  latency: 249,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `4473`.
  bandwidth: 4473,
  // Property / setting `confidence` = `0.0502`.
  confidence: 0.0502,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_010' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_011' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:VALIDATES {
  // Property / setting `strength` = `0.0793`.
  strength: 0.0793,
  // Property / setting `latency` = `224`.
  latency: 224,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `438`.
  bandwidth: 438,
  // Property / setting `confidence` = `0.1813`.
  confidence: 0.1813,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_011' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_012' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:DEPENDS_ON {
  // Property / setting `strength` = `0.8279`.
  strength: 0.8279,
  // Property / setting `latency` = `236`.
  latency: 236,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `4531`.
  bandwidth: 4531,
  // Property / setting `confidence` = `0.6724`.
  confidence: 0.6724,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_012' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_013' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:OBSERVES {
  // Property / setting `strength` = `0.0535`.
  strength: 0.0535,
  // Property / setting `latency` = `207`.
  latency: 207,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `6928`.
  bandwidth: 6928,
  // Property / setting `confidence` = `0.0359`.
  confidence: 0.0359,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_013' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_014' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:PRODUCES {
  // Property / setting `strength` = `0.877`.
  strength: 0.877,
  // Property / setting `latency` = `59`.
  latency: 59,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `1484`.
  bandwidth: 1484,
  // Property / setting `confidence` = `0.4346`.
  confidence: 0.4346,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_014' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_015' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:MONITORS {
  // Property / setting `strength` = `0.6808`.
  strength: 0.6808,
  // Property / setting `latency` = `104`.
  latency: 104,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `7013`.
  bandwidth: 7013,
  // Property / setting `confidence` = `0.2161`.
  confidence: 0.2161,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_015' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_016' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:OBSERVES {
  // Property / setting `strength` = `0.835`.
  strength: 0.835,
  // Property / setting `latency` = `197`.
  latency: 197,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `3673`.
  bandwidth: 3673,
  // Property / setting `confidence` = `0.1631`.
  confidence: 0.1631,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_016' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_017' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:CALIBRATES {
  // Property / setting `strength` = `0.412`.
  strength: 0.412,
  // Property / setting `latency` = `113`.
  latency: 113,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `5237`.
  bandwidth: 5237,
  // Property / setting `confidence` = `0.0555`.
  confidence: 0.0555,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_017' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_018' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:VALIDATES {
  // Property / setting `strength` = `0.8905`.
  strength: 0.8905,
  // Property / setting `latency` = `108`.
  latency: 108,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `9307`.
  bandwidth: 9307,
  // Property / setting `confidence` = `0.4555`.
  confidence: 0.4555,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_018' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_019' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:PRODUCES {
  // Property / setting `strength` = `0.6833`.
  strength: 0.6833,
  // Property / setting `latency` = `146`.
  latency: 146,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `5295`.
  bandwidth: 5295,
  // Property / setting `confidence` = `0.6617`.
  confidence: 0.6617,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_019' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_020' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:CALIBRATES {
  // Property / setting `strength` = `0.7763`.
  strength: 0.7763,
  // Property / setting `latency` = `61`.
  latency: 61,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `4920`.
  bandwidth: 4920,
  // Property / setting `confidence` = `0.2445`.
  confidence: 0.2445,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_020' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_021' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:OBSERVES {
  // Property / setting `strength` = `0.5392`.
  strength: 0.5392,
  // Property / setting `latency` = `134`.
  latency: 134,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `666`.
  bandwidth: 666,
  // Property / setting `confidence` = `0.4569`.
  confidence: 0.4569,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_021' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_022' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:DEPENDS_ON {
  // Property / setting `strength` = `0.4201`.
  strength: 0.4201,
  // Property / setting `latency` = `222`.
  latency: 222,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `1793`.
  bandwidth: 1793,
  // Property / setting `confidence` = `0.5939`.
  confidence: 0.5939,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_022' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_023' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:VALIDATES {
  // Property / setting `strength` = `0.3457`.
  strength: 0.3457,
  // Property / setting `latency` = `203`.
  latency: 203,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `2262`.
  bandwidth: 2262,
  // Property / setting `confidence` = `0.529`.
  confidence: 0.529,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_023' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_024' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:TRIGGERS {
  // Property / setting `strength` = `0.6511`.
  strength: 0.6511,
  // Property / setting `latency` = `169`.
  latency: 169,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `2275`.
  bandwidth: 2275,
  // Property / setting `confidence` = `0.185`.
  confidence: 0.185,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_024' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_025' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:VALIDATES {
  // Property / setting `strength` = `0.8545`.
  strength: 0.8545,
  // Property / setting `latency` = `246`.
  latency: 246,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `9019`.
  bandwidth: 9019,
  // Property / setting `confidence` = `0.4753`.
  confidence: 0.4753,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_025' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_026' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:PRODUCES {
  // Property / setting `strength` = `0.7257`.
  strength: 0.7257,
  // Property / setting `latency` = `52`.
  latency: 52,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `6395`.
  bandwidth: 6395,
  // Property / setting `confidence` = `0.8419`.
  confidence: 0.8419,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_026' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_027' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:OBSERVES {
  // Property / setting `strength` = `0.6407`.
  strength: 0.6407,
  // Property / setting `latency` = `146`.
  latency: 146,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `411`.
  bandwidth: 411,
  // Property / setting `confidence` = `0.5401`.
  confidence: 0.5401,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_027' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_028' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:VALIDATES {
  // Property / setting `strength` = `0.7837`.
  strength: 0.7837,
  // Property / setting `latency` = `195`.
  latency: 195,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `7190`.
  bandwidth: 7190,
  // Property / setting `confidence` = `0.8122`.
  confidence: 0.8122,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_028' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_029' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:TRIGGERS {
  // Property / setting `strength` = `0.8689`.
  strength: 0.8689,
  // Property / setting `latency` = `94`.
  latency: 94,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `7653`.
  bandwidth: 7653,
  // Property / setting `confidence` = `0.1132`.
  confidence: 0.1132,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_09_event_dispatchers_2_029' })`.
MATCH (a:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_09_event_dispatchers_2_...`.
      (b:Multimodal { identifier: 'multimodal_09_event_dispatchers_2_000' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:TRIGGERS {
  // Property / setting `strength` = `0.9869`.
  strength: 0.9869,
  // Property / setting `latency` = `138`.
  latency: 138,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `2026`.
  bandwidth: 2026,
  // Property / setting `confidence` = `0.43`.
  confidence: 0.43,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
