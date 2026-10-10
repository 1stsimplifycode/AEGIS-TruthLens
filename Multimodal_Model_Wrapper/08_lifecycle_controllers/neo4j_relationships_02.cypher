// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_relationships_02.cypher
//  2. Program Description        : A Neo4j Cypher script that creates relationships (the
//                                  'lines' connecting the dots) between nodes in a Neo4j graph
//                                  database for the 'multimodal model wrapper' project
//                                  (lifecycle controllers area). It is one small, separate
//                                  piece so each language/part can be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New relationships stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_02_02'
//                                  - batchSize = 128
//                                  - threshold = 0.675
//                                  - maxDepth = 5
//                                  - timeoutSeconds = 90
//                                  - region = 'ap-south'
//                                  - epoch = 14
//                                  - version = '1.1.4'
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
// Set the parameter `threshold` to `0.675`; later lines can use it as $threshold.
:param threshold => 0.675;
// Set the parameter `maxDepth` to `5`; later lines can use it as $maxDepth.
:param maxDepth => 5;
// Set the parameter `timeoutSeconds` to `90`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 90;
// Set the parameter `region` to `'ap-south'`; later lines can use it as $region.
:param region => 'ap-south';
// Set the parameter `epoch` to `14`; later lines can use it as $epoch.
:param epoch => 14;
// Set the parameter `version` to `'1.1.4'`; later lines can use it as $version.
:param version => '1.1.4';

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_000' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_001' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_000:ROUTES_TO {
  // Property / setting `strength` = `0.8884`.
  strength: 0.8884,
  // Property / setting `latency` = `183`.
  latency: 183,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `821`.
  bandwidth: 821,
  // Property / setting `confidence` = `0.7588`.
  confidence: 0.7588,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_001' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_002' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_001:OBSERVES {
  // Property / setting `strength` = `0.3432`.
  strength: 0.3432,
  // Property / setting `latency` = `245`.
  latency: 245,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `7369`.
  bandwidth: 7369,
  // Property / setting `confidence` = `0.3402`.
  confidence: 0.3402,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_002' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_003' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_002:MONITORS {
  // Property / setting `strength` = `0.4702`.
  strength: 0.4702,
  // Property / setting `latency` = `220`.
  latency: 220,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `7422`.
  bandwidth: 7422,
  // Property / setting `confidence` = `0.9952`.
  confidence: 0.9952,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_003' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_004' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_003:OBSERVES {
  // Property / setting `strength` = `0.9941`.
  strength: 0.9941,
  // Property / setting `latency` = `139`.
  latency: 139,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `bandwidth` = `2380`.
  bandwidth: 2380,
  // Property / setting `confidence` = `0.764`.
  confidence: 0.764,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_004' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_005' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_004:DEPENDS_ON {
  // Property / setting `strength` = `0.6577`.
  strength: 0.6577,
  // Property / setting `latency` = `246`.
  latency: 246,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `512`.
  bandwidth: 512,
  // Property / setting `confidence` = `0.3472`.
  confidence: 0.3472,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_005' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_006' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_005:PRODUCES {
  // Property / setting `strength` = `0.8044`.
  strength: 0.8044,
  // Property / setting `latency` = `88`.
  latency: 88,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `8761`.
  bandwidth: 8761,
  // Property / setting `confidence` = `0.5211`.
  confidence: 0.5211,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_006' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_007' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_006:TRIGGERS {
  // Property / setting `strength` = `0.9855`.
  strength: 0.9855,
  // Property / setting `latency` = `123`.
  latency: 123,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `1892`.
  bandwidth: 1892,
  // Property / setting `confidence` = `0.4526`.
  confidence: 0.4526,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_007' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_008' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_007:TRIGGERS {
  // Property / setting `strength` = `0.9899`.
  strength: 0.9899,
  // Property / setting `latency` = `112`.
  latency: 112,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `3844`.
  bandwidth: 3844,
  // Property / setting `confidence` = `0.022`.
  confidence: 0.022,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_008' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_009' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_008:DEPENDS_ON {
  // Property / setting `strength` = `0.6251`.
  strength: 0.6251,
  // Property / setting `latency` = `179`.
  latency: 179,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `3950`.
  bandwidth: 3950,
  // Property / setting `confidence` = `0.5457`.
  confidence: 0.5457,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_009' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_010' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_009:ROUTES_TO {
  // Property / setting `strength` = `0.6363`.
  strength: 0.6363,
  // Property / setting `latency` = `114`.
  latency: 114,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `5078`.
  bandwidth: 5078,
  // Property / setting `confidence` = `0.8188`.
  confidence: 0.8188,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_010' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_011' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_010:VALIDATES {
  // Property / setting `strength` = `0.1334`.
  strength: 0.1334,
  // Property / setting `latency` = `10`.
  latency: 10,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `4771`.
  bandwidth: 4771,
  // Property / setting `confidence` = `0.4986`.
  confidence: 0.4986,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_011' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_012' })
// Connect `a` to another node with a `MONITORS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_011:MONITORS {
  // Property / setting `strength` = `0.3238`.
  strength: 0.3238,
  // Property / setting `latency` = `81`.
  latency: 81,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `5499`.
  bandwidth: 5499,
  // Property / setting `confidence` = `0.9667`.
  confidence: 0.9667,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_012' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_013' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_012:DEPENDS_ON {
  // Property / setting `strength` = `0.7452`.
  strength: 0.7452,
  // Property / setting `latency` = `206`.
  latency: 206,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `3753`.
  bandwidth: 3753,
  // Property / setting `confidence` = `0.7757`.
  confidence: 0.7757,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_013' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_014' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_013:ROUTES_TO {
  // Property / setting `strength` = `0.9081`.
  strength: 0.9081,
  // Property / setting `latency` = `104`.
  latency: 104,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `5499`.
  bandwidth: 5499,
  // Property / setting `confidence` = `0.4073`.
  confidence: 0.4073,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_014' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_015' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_014:CALIBRATES {
  // Property / setting `strength` = `0.0733`.
  strength: 0.0733,
  // Property / setting `latency` = `62`.
  latency: 62,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `3383`.
  bandwidth: 3383,
  // Property / setting `confidence` = `0.702`.
  confidence: 0.702,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_015' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_016' })
// Connect `a` to another node with a `ROUTES_TO` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_015:ROUTES_TO {
  // Property / setting `strength` = `0.8697`.
  strength: 0.8697,
  // Property / setting `latency` = `219`.
  latency: 219,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `3640`.
  bandwidth: 3640,
  // Property / setting `confidence` = `0.7926`.
  confidence: 0.7926,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_016' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_017' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_016:VALIDATES {
  // Property / setting `strength` = `0.4405`.
  strength: 0.4405,
  // Property / setting `latency` = `104`.
  latency: 104,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `7080`.
  bandwidth: 7080,
  // Property / setting `confidence` = `0.9349`.
  confidence: 0.9349,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_017' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_018' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_017:OBSERVES {
  // Property / setting `strength` = `0.9344`.
  strength: 0.9344,
  // Property / setting `latency` = `113`.
  latency: 113,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `5575`.
  bandwidth: 5575,
  // Property / setting `confidence` = `0.3627`.
  confidence: 0.3627,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_018' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_019' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_018:DEPENDS_ON {
  // Property / setting `strength` = `0.8956`.
  strength: 0.8956,
  // Property / setting `latency` = `21`.
  latency: 21,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `8983`.
  bandwidth: 8983,
  // Property / setting `confidence` = `0.0962`.
  confidence: 0.0962,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_019' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_020' })
// Connect `a` to another node with a `DEPENDS_ON` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_019:DEPENDS_ON {
  // Property / setting `strength` = `0.7993`.
  strength: 0.7993,
  // Property / setting `latency` = `143`.
  latency: 143,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `5412`.
  bandwidth: 5412,
  // Property / setting `confidence` = `0.0116`.
  confidence: 0.0116,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_020' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_021' })
// Connect `a` to another node with a `VALIDATES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_020:VALIDATES {
  // Property / setting `strength` = `0.8898`.
  strength: 0.8898,
  // Property / setting `latency` = `216`.
  latency: 216,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `bandwidth` = `1717`.
  bandwidth: 1717,
  // Property / setting `confidence` = `0.1405`.
  confidence: 0.1405,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_021' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_022' })
// Connect `a` to another node with a `CALIBRATES` relationship (a line between two data points)
// only if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_021:CALIBRATES {
  // Property / setting `strength` = `0.6779`.
  strength: 0.6779,
  // Property / setting `latency` = `220`.
  latency: 220,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `bandwidth` = `4013`.
  bandwidth: 4013,
  // Property / setting `confidence` = `0.4037`.
  confidence: 0.4037,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_022' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_023' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_022:OBSERVES {
  // Property / setting `strength` = `0.9692`.
  strength: 0.9692,
  // Property / setting `latency` = `114`.
  latency: 114,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_6'`.
  channel: 'channel_6',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `6560`.
  bandwidth: 6560,
  // Property / setting `confidence` = `0.9936`.
  confidence: 0.9936,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_023' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_024' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_023:OBSERVES {
  // Property / setting `strength` = `0.1555`.
  strength: 0.1555,
  // Property / setting `latency` = `246`.
  latency: 246,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_7'`.
  channel: 'channel_7',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `bandwidth` = `1843`.
  bandwidth: 1843,
  // Property / setting `confidence` = `0.6562`.
  confidence: 0.6562,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_024' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_025' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_024:TRIGGERS {
  // Property / setting `strength` = `0.3771`.
  strength: 0.3771,
  // Property / setting `latency` = `193`.
  latency: 193,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_0'`.
  channel: 'channel_0',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `bandwidth` = `9535`.
  bandwidth: 9535,
  // Property / setting `confidence` = `0.6086`.
  confidence: 0.6086,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_025' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_026' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_025:TRIGGERS {
  // Property / setting `strength` = `0.5781`.
  strength: 0.5781,
  // Property / setting `latency` = `23`.
  latency: 23,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_1'`.
  channel: 'channel_1',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `9676`.
  bandwidth: 9676,
  // Property / setting `confidence` = `0.6463`.
  confidence: 0.6463,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_026' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_027' })
// Connect `a` to another node with a `OBSERVES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_026:OBSERVES {
  // Property / setting `strength` = `0.4294`.
  strength: 0.4294,
  // Property / setting `latency` = `85`.
  latency: 85,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_2'`.
  channel: 'channel_2',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `bandwidth` = `3004`.
  bandwidth: 3004,
  // Property / setting `confidence` = `0.0147`.
  confidence: 0.0147,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_027' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_028' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_027:TRIGGERS {
  // Property / setting `strength` = `0.772`.
  strength: 0.772,
  // Property / setting `latency` = `222`.
  latency: 222,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_3'`.
  channel: 'channel_3',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `bandwidth` = `1972`.
  bandwidth: 1972,
  // Property / setting `confidence` = `0.5417`.
  confidence: 0.5417,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_028' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_029' })
// Connect `a` to another node with a `PRODUCES` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_028:PRODUCES {
  // Property / setting `strength` = `0.9587`.
  strength: 0.9587,
  // Property / setting `latency` = `96`.
  latency: 96,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_4'`.
  channel: 'channel_4',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `bandwidth` = `7304`.
  bandwidth: 7304,
  // Property / setting `confidence` = `0.8166`.
  confidence: 0.8166,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);

// Find the parts of the graph that match the pattern `(a:Multimodal { identifier:
// 'multimodal_08_lifecycle_controllers_2_...`.
MATCH (a:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_029' }),
      // ...and also the node `b` with label `Multimodal` where `identifier:
      // 'multimodal_08_lifecycle_controller...`.
      (b:Multimodal { identifier: 'multimodal_08_lifecycle_controllers_2_000' })
// Connect `a` to another node with a `TRIGGERS` relationship (a line between two data points) only
// if it does not exist yet. Its properties are listed below.
MERGE (a)-[r_029:TRIGGERS {
  // Property / setting `strength` = `0.6539`.
  strength: 0.6539,
  // Property / setting `latency` = `174`.
  latency: 174,
  // Property / setting `established` = the current date and time.
  established: datetime(),
  // Property / setting `channel` = `'channel_5'`.
  channel: 'channel_5',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `bandwidth` = `1451`.
  bandwidth: 1451,
  // Property / setting `confidence` = `0.5769`.
  confidence: 0.5769,
  // Property / setting `active` = true (yes).
  active: true
// End of the relationship's properties; the relationship points to `b`.
}]->(b);
