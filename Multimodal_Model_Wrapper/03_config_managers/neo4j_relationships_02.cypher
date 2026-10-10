// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project (config
//                                  managers area). It is one small, separate piece so each
//                                  language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New relationships stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_02_02'
//                                  - batchSize = 64
//                                  - threshold = 0.74
//                                  - maxDepth = 10
//                                  - timeoutSeconds = 17
//                                  - region = 'us-east'
//                                  - epoch = 60
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
// Set the parameter `batchSize` to `64`; later lines can use it as $batchSize.
:param batchSize => 64;
// Set the parameter `threshold` to `0.74`; later lines can use it as $threshold.
:param threshold => 0.74;
// Set the parameter `maxDepth` to `10`; later lines can use it as $maxDepth.
:param maxDepth => 10;
// Set the parameter `timeoutSeconds` to `17`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 17;
// Set the parameter `region` to `'us-east'`; later lines can use it as $region.
:param region => 'us-east';
// Set the parameter `epoch` to `60`; later lines can use it as $epoch.
:param epoch => 60;
// Set the parameter `version` to `'4.8.5'`; later lines can use it as $version.
:param version => '4.8.5';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_000' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_001'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_001' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:MONITORS {
  // Property / setting `strength` = `0.672`.
  strength: 0.672,
  // Property / setting `latency` = `76`.
  latency: 76,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `7576`.
  bandwidth: 7576,
  // Property / setting `confidence` = `0.1781`.
  confidence: 0.1781,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_001' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_002'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_002' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:ROUTES_TO {
  // Property / setting `strength` = `0.1013`.
  strength: 0.1013,
  // Property / setting `latency` = `32`.
  latency: 32,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `2804`.
  bandwidth: 2804,
  // Property / setting `confidence` = `0.6739`.
  confidence: 0.6739,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_002' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_003'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_003' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:VALIDATES {
  // Property / setting `strength` = `0.2265`.
  strength: 0.2265,
  // Property / setting `latency` = `163`.
  latency: 163,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `5557`.
  bandwidth: 5557,
  // Property / setting `confidence` = `0.8618`.
  confidence: 0.8618,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_003' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_004'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_004' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:DEPENDS_ON {
  // Property / setting `strength` = `0.393`.
  strength: 0.393,
  // Property / setting `latency` = `188`.
  latency: 188,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `919`.
  bandwidth: 919,
  // Property / setting `confidence` = `0.458`.
  confidence: 0.458,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_004' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_005'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_005' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:ROUTES_TO {
  // Property / setting `strength` = `0.5722`.
  strength: 0.5722,
  // Property / setting `latency` = `100`.
  latency: 100,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `4381`.
  bandwidth: 4381,
  // Property / setting `confidence` = `0.1662`.
  confidence: 0.1662,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_005' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_006'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_006' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:DEPENDS_ON {
  // Property / setting `strength` = `0.6763`.
  strength: 0.6763,
  // Property / setting `latency` = `184`.
  latency: 184,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `2034`.
  bandwidth: 2034,
  // Property / setting `confidence` = `0.2365`.
  confidence: 0.2365,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_006' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_007'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_007' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:ROUTES_TO {
  // Property / setting `strength` = `0.7708`.
  strength: 0.7708,
  // Property / setting `latency` = `186`.
  latency: 186,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `2813`.
  bandwidth: 2813,
  // Property / setting `confidence` = `0.665`.
  confidence: 0.665,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_007' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_008'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_008' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:PRODUCES {
  // Property / setting `strength` = `0.7705`.
  strength: 0.7705,
  // Property / setting `latency` = `226`.
  latency: 226,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `1183`.
  bandwidth: 1183,
  // Property / setting `confidence` = `0.4908`.
  confidence: 0.4908,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_008' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_009'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_009' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:OBSERVES {
  // Property / setting `strength` = `0.3504`.
  strength: 0.3504,
  // Property / setting `latency` = `197`.
  latency: 197,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `3930`.
  bandwidth: 3930,
  // Property / setting `confidence` = `0.1459`.
  confidence: 0.1459,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_009' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_010'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_010' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:OBSERVES {
  // Property / setting `strength` = `0.2373`.
  strength: 0.2373,
  // Property / setting `latency` = `6`.
  latency: 6,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `2644`.
  bandwidth: 2644,
  // Property / setting `confidence` = `0.6309`.
  confidence: 0.6309,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_010' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_011'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_011' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:ROUTES_TO {
  // Property / setting `strength` = `0.2645`.
  strength: 0.2645,
  // Property / setting `latency` = `61`.
  latency: 61,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `1819`.
  bandwidth: 1819,
  // Property / setting `confidence` = `0.9981`.
  confidence: 0.9981,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_011' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_012'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_012' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:CALIBRATES {
  // Property / setting `strength` = `0.3114`.
  strength: 0.3114,
  // Property / setting `latency` = `173`.
  latency: 173,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `6312`.
  bandwidth: 6312,
  // Property / setting `confidence` = `0.2552`.
  confidence: 0.2552,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_012' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_013'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_013' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:OBSERVES {
  // Property / setting `strength` = `0.6195`.
  strength: 0.6195,
  // Property / setting `latency` = `59`.
  latency: 59,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `8928`.
  bandwidth: 8928,
  // Property / setting `confidence` = `0.506`.
  confidence: 0.506,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_013' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_014'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_014' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:DEPENDS_ON {
  // Property / setting `strength` = `0.9719`.
  strength: 0.9719,
  // Property / setting `latency` = `220`.
  latency: 220,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `5327`.
  bandwidth: 5327,
  // Property / setting `confidence` = `0.1131`.
  confidence: 0.1131,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_014' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_015'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_015' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:VALIDATES {
  // Property / setting `strength` = `0.2369`.
  strength: 0.2369,
  // Property / setting `latency` = `13`.
  latency: 13,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `4757`.
  bandwidth: 4757,
  // Property / setting `confidence` = `0.5673`.
  confidence: 0.5673,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_015' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_016'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_016' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:CALIBRATES {
  // Property / setting `strength` = `0.3106`.
  strength: 0.3106,
  // Property / setting `latency` = `188`.
  latency: 188,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `1571`.
  bandwidth: 1571,
  // Property / setting `confidence` = `0.9932`.
  confidence: 0.9932,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_016' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_017'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_017' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:MONITORS {
  // Property / setting `strength` = `0.971`.
  strength: 0.971,
  // Property / setting `latency` = `231`.
  latency: 231,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `3680`.
  bandwidth: 3680,
  // Property / setting `confidence` = `0.1588`.
  confidence: 0.1588,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_017' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_018'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_018' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:OBSERVES {
  // Property / setting `strength` = `0.79`.
  strength: 0.79,
  // Property / setting `latency` = `95`.
  latency: 95,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `7281`.
  bandwidth: 7281,
  // Property / setting `confidence` = `0.2903`.
  confidence: 0.2903,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_018' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_019'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_019' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:DEPENDS_ON {
  // Property / setting `strength` = `0.3803`.
  strength: 0.3803,
  // Property / setting `latency` = `195`.
  latency: 195,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `5056`.
  bandwidth: 5056,
  // Property / setting `confidence` = `0.2259`.
  confidence: 0.2259,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_019' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_020'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_020' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:DEPENDS_ON {
  // Property / setting `strength` = `0.2564`.
  strength: 0.2564,
  // Property / setting `latency` = `101`.
  latency: 101,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `6160`.
  bandwidth: 6160,
  // Property / setting `confidence` = `0.9827`.
  confidence: 0.9827,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_020' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_021'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_021' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:CALIBRATES {
  // Property / setting `strength` = `0.7775`.
  strength: 0.7775,
  // Property / setting `latency` = `160`.
  latency: 160,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `7630`.
  bandwidth: 7630,
  // Property / setting `confidence` = `0.7681`.
  confidence: 0.7681,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_021' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_022'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_022' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:PRODUCES {
  // Property / setting `strength` = `0.0675`.
  strength: 0.0675,
  // Property / setting `latency` = `191`.
  latency: 191,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `5256`.
  bandwidth: 5256,
  // Property / setting `confidence` = `0.4125`.
  confidence: 0.4125,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_022' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_023'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_023' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:MONITORS {
  // Property / setting `strength` = `0.839`.
  strength: 0.839,
  // Property / setting `latency` = `84`.
  latency: 84,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `6896`.
  bandwidth: 6896,
  // Property / setting `confidence` = `0.7458`.
  confidence: 0.7458,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_023' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_024'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_024' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:CALIBRATES {
  // Property / setting `strength` = `0.4396`.
  strength: 0.4396,
  // Property / setting `latency` = `59`.
  latency: 59,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `2448`.
  bandwidth: 2448,
  // Property / setting `confidence` = `0.0682`.
  confidence: 0.0682,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_024' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_025'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_025' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:DEPENDS_ON {
  // Property / setting `strength` = `0.2754`.
  strength: 0.2754,
  // Property / setting `latency` = `114`.
  latency: 114,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `9626`.
  bandwidth: 9626,
  // Property / setting `confidence` = `0.526`.
  confidence: 0.526,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_025' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_026'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_026' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:DEPENDS_ON {
  // Property / setting `strength` = `0.1347`.
  strength: 0.1347,
  // Property / setting `latency` = `147`.
  latency: 147,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `8212`.
  bandwidth: 8212,
  // Property / setting `confidence` = `0.9439`.
  confidence: 0.9439,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_026' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_027'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_027' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:OBSERVES {
  // Property / setting `strength` = `0.5232`.
  strength: 0.5232,
  // Property / setting `latency` = `191`.
  latency: 191,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `bandwidth` = `9989`.
  bandwidth: 9989,
  // Property / setting `confidence` = `0.884`.
  confidence: 0.884,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_027' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_028'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_028' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:OBSERVES {
  // Property / setting `strength` = `0.8066`.
  strength: 0.8066,
  // Property / setting `latency` = `132`.
  latency: 132,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `6411`.
  bandwidth: 6411,
  // Property / setting `confidence` = `0.6596`.
  confidence: 0.6596,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_028' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_029'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_029' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:VALIDATES {
  // Property / setting `strength` = `0.1268`.
  strength: 0.1268,
  // Property / setting `latency` = `139`.
  latency: 139,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `6686`.
  bandwidth: 6686,
  // Property / setting `confidence` = `0.757`.
  confidence: 0.757,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_03_config_managers_2_029' })`.
MATCH (a:Multimodal { identifier: 'multimodal_03_config_managers_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_03_config_managers_2_000'`.
      (b:Multimodal { identifier: 'multimodal_03_config_managers_2_000' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:CALIBRATES {
  // Property / setting `strength` = `0.5359`.
  strength: 0.5359,
  // Property / setting `latency` = `29`.
  latency: 29,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `9355`.
  bandwidth: 9355,
  // Property / setting `confidence` = `0.4087`.
  confidence: 0.4087,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
