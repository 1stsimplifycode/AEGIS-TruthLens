// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_procedures_05.cypher
//  2. Program Description        : A Neo4j Cypher script that runs ready-made Neo4j procedures
//                                  (built-in routines) for bigger graph operations for the
//                                  'multimodal model wrapper' project (metric trackers area).
//                                  It is one small, separate piece so each language/part can
//                                  be tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : Results of the called procedures.
//  8. Variables                  : - namespace = 'multimodal_05_05'
//                                  - batchSize = 64
//                                  - threshold = 0.449
//                                  - maxDepth = 9
//                                  - timeoutSeconds = 71
//                                  - region = 'us-east'
//                                  - epoch = 66
//                                  - version = '2.1.6'
//  9. Algorithm / Logic          : - Contains about 0 CREATE and 36 MATCH statements.
//                                  - CREATE adds new data; MATCH finds existing data; RETURN
//                                    shows the result.
//                                  - Node labels used: Multimodal.
// 10. Dependencies               : - Neo4j database (version 5 recommended).
//                                  - cypher-shell (comes with Neo4j).
//                                  - APOC plugin for Neo4j.
//                                  - Graph Data Science (GDS) plugin for Neo4j.
// 11. Execution Instructions     : cypher-shell -u neo4j -p <password> -f
//                                  neo4j_procedures_05.cypher
// 12. Assumptions and Limitations: - The required tools listed above are installed and on the
//                                    PATH.
//                                  - Limitation: results are only as good as the data given to
//                                    it.
// 13. Error Handling             : No special error handling. If a statement fails, Neo4j
//                                  stops and reports the error.
// =============================================================================================

// Set the parameter `namespace` to `'multimodal_05_05'`; later lines can use it as $namespace.
:param namespace => 'multimodal_05_05';
// Set the parameter `batchSize` to `64`; later lines can use it as $batchSize.
:param batchSize => 64;
// Set the parameter `threshold` to `0.449`; later lines can use it as $threshold.
:param threshold => 0.449;
// Set the parameter `maxDepth` to `9`; later lines can use it as $maxDepth.
:param maxDepth => 9;
// Set the parameter `timeoutSeconds` to `71`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 71;
// Set the parameter `region` to `'us-east'`; later lines can use it as $region.
:param region => 'us-east';
// Set the parameter `epoch` to `66`; later lines can use it as $epoch.
:param epoch => 66;
// Set the parameter `version` to `'2.1.6'`; later lines can use it as $version.
:param version => '2.1.6';

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 19 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 19 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 500, parallel: false}`.
  {batchSize: 500, parallel: false}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 4 })`.
MATCH (start:Multimodal { priority: 4 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `3`.
  maxLevel: 3,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_000, relationships AS edges_000`.
}) YIELD nodes AS reachable_000, relationships AS edges_000
// Give back (show) these results: `size(reachable_000) AS node_count_000`.
RETURN size(reachable_000) AS node_count_000,
       // ...also include the value `size(edges_000) AS edge_count_000` in the results.
       size(edges_000) AS edge_count_000;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_0', {
  // Property / setting `maxIterations` = `29`.
  maxIterations: 29,
  // Property / setting `dampingFactor` = `0.833`.
  dampingFactor: 0.833
// End of the settings; collect these outputs: `nodeId AS nid_000, score AS pr_score_000`.
}) YIELD nodeId AS nid_000, score AS pr_score_000
// Pass these values on to the next step: `nid_000, pr_score_000`.
WITH nid_000, pr_score_000
// Keep only results where `pr_score_000 > 0.446`.
WHERE pr_score_000 > 0.446
// Give back (show) these results: `nid_000, pr_score_000`.
RETURN nid_000, pr_score_000
// Sort the results by `pr_score_000 DESC` (highest first).
ORDER BY pr_score_000 DESC
// Return at most 20 results.
LIMIT 20;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 13 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 13 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 100, parallel: false}`.
  {batchSize: 100, parallel: false}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 1 })`.
MATCH (start:Multimodal { priority: 1 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `3`.
  maxLevel: 3,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_001, relationships AS edges_001`.
}) YIELD nodes AS reachable_001, relationships AS edges_001
// Give back (show) these results: `size(reachable_001) AS node_count_001`.
RETURN size(reachable_001) AS node_count_001,
       // ...also include the value `size(edges_001) AS edge_count_001` in the results.
       size(edges_001) AS edge_count_001;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_1', {
  // Property / setting `maxIterations` = `39`.
  maxIterations: 39,
  // Property / setting `dampingFactor` = `0.879`.
  dampingFactor: 0.879
// End of the settings; collect these outputs: `nodeId AS nid_001, score AS pr_score_001`.
}) YIELD nodeId AS nid_001, score AS pr_score_001
// Pass these values on to the next step: `nid_001, pr_score_001`.
WITH nid_001, pr_score_001
// Keep only results where `pr_score_001 > 0.249`.
WHERE pr_score_001 > 0.249
// Give back (show) these results: `nid_001, pr_score_001`.
RETURN nid_001, pr_score_001
// Sort the results by `pr_score_001 DESC` (highest first).
ORDER BY pr_score_001 DESC
// Return at most 20 results.
LIMIT 20;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 38 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 38 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 1000, parallel: false}`.
  {batchSize: 1000, parallel: false}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 9 })`.
MATCH (start:Multimodal { priority: 9 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `3`.
  maxLevel: 3,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_002, relationships AS edges_002`.
}) YIELD nodes AS reachable_002, relationships AS edges_002
// Give back (show) these results: `size(reachable_002) AS node_count_002`.
RETURN size(reachable_002) AS node_count_002,
       // ...also include the value `size(edges_002) AS edge_count_002` in the results.
       size(edges_002) AS edge_count_002;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_2', {
  // Property / setting `maxIterations` = `50`.
  maxIterations: 50,
  // Property / setting `dampingFactor` = `0.783`.
  dampingFactor: 0.783
// End of the settings; collect these outputs: `nodeId AS nid_002, score AS pr_score_002`.
}) YIELD nodeId AS nid_002, score AS pr_score_002
// Pass these values on to the next step: `nid_002, pr_score_002`.
WITH nid_002, pr_score_002
// Keep only results where `pr_score_002 > 0.103`.
WHERE pr_score_002 > 0.103
// Give back (show) these results: `nid_002, pr_score_002`.
RETURN nid_002, pr_score_002
// Sort the results by `pr_score_002 DESC` (highest first).
ORDER BY pr_score_002 DESC
// Return at most 100 results.
LIMIT 100;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 46 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 46 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 500, parallel: false}`.
  {batchSize: 500, parallel: false}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 2 })`.
MATCH (start:Multimodal { priority: 2 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `2`.
  maxLevel: 2,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_003, relationships AS edges_003`.
}) YIELD nodes AS reachable_003, relationships AS edges_003
// Give back (show) these results: `size(reachable_003) AS node_count_003`.
RETURN size(reachable_003) AS node_count_003,
       // ...also include the value `size(edges_003) AS edge_count_003` in the results.
       size(edges_003) AS edge_count_003;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_3', {
  // Property / setting `maxIterations` = `23`.
  maxIterations: 23,
  // Property / setting `dampingFactor` = `0.814`.
  dampingFactor: 0.814
// End of the settings; collect these outputs: `nodeId AS nid_003, score AS pr_score_003`.
}) YIELD nodeId AS nid_003, score AS pr_score_003
// Pass these values on to the next step: `nid_003, pr_score_003`.
WITH nid_003, pr_score_003
// Keep only results where `pr_score_003 > 0.39`.
WHERE pr_score_003 > 0.39
// Give back (show) these results: `nid_003, pr_score_003`.
RETURN nid_003, pr_score_003
// Sort the results by `pr_score_003 DESC` (highest first).
ORDER BY pr_score_003 DESC
// Return at most 20 results.
LIMIT 20;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 46 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 46 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 100, parallel: false}`.
  {batchSize: 100, parallel: false}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 3 })`.
MATCH (start:Multimodal { priority: 3 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `5`.
  maxLevel: 5,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_004, relationships AS edges_004`.
}) YIELD nodes AS reachable_004, relationships AS edges_004
// Give back (show) these results: `size(reachable_004) AS node_count_004`.
RETURN size(reachable_004) AS node_count_004,
       // ...also include the value `size(edges_004) AS edge_count_004` in the results.
       size(edges_004) AS edge_count_004;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_4', {
  // Property / setting `maxIterations` = `34`.
  maxIterations: 34,
  // Property / setting `dampingFactor` = `0.753`.
  dampingFactor: 0.753
// End of the settings; collect these outputs: `nodeId AS nid_004, score AS pr_score_004`.
}) YIELD nodeId AS nid_004, score AS pr_score_004
// Pass these values on to the next step: `nid_004, pr_score_004`.
WITH nid_004, pr_score_004
// Keep only results where `pr_score_004 > 0.363`.
WHERE pr_score_004 > 0.363
// Give back (show) these results: `nid_004, pr_score_004`.
RETURN nid_004, pr_score_004
// Sort the results by `pr_score_004 DESC` (highest first).
ORDER BY pr_score_004 DESC
// Return at most 100 results.
LIMIT 100;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 18 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 18 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 1000, parallel: false}`.
  {batchSize: 1000, parallel: false}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 8 })`.
MATCH (start:Multimodal { priority: 8 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `6`.
  maxLevel: 6,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_005, relationships AS edges_005`.
}) YIELD nodes AS reachable_005, relationships AS edges_005
// Give back (show) these results: `size(reachable_005) AS node_count_005`.
RETURN size(reachable_005) AS node_count_005,
       // ...also include the value `size(edges_005) AS edge_count_005` in the results.
       size(edges_005) AS edge_count_005;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_5', {
  // Property / setting `maxIterations` = `40`.
  maxIterations: 40,
  // Property / setting `dampingFactor` = `0.836`.
  dampingFactor: 0.836
// End of the settings; collect these outputs: `nodeId AS nid_005, score AS pr_score_005`.
}) YIELD nodeId AS nid_005, score AS pr_score_005
// Pass these values on to the next step: `nid_005, pr_score_005`.
WITH nid_005, pr_score_005
// Keep only results where `pr_score_005 > 0.256`.
WHERE pr_score_005 > 0.256
// Give back (show) these results: `nid_005, pr_score_005`.
RETURN nid_005, pr_score_005
// Sort the results by `pr_score_005 DESC` (highest first).
ORDER BY pr_score_005 DESC
// Return at most 100 results.
LIMIT 100;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 24 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 24 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 1000, parallel: true}`.
  {batchSize: 1000, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 3 })`.
MATCH (start:Multimodal { priority: 3 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `6`.
  maxLevel: 6,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_006, relationships AS edges_006`.
}) YIELD nodes AS reachable_006, relationships AS edges_006
// Give back (show) these results: `size(reachable_006) AS node_count_006`.
RETURN size(reachable_006) AS node_count_006,
       // ...also include the value `size(edges_006) AS edge_count_006` in the results.
       size(edges_006) AS edge_count_006;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_6', {
  // Property / setting `maxIterations` = `19`.
  maxIterations: 19,
  // Property / setting `dampingFactor` = `0.822`.
  dampingFactor: 0.822
// End of the settings; collect these outputs: `nodeId AS nid_006, score AS pr_score_006`.
}) YIELD nodeId AS nid_006, score AS pr_score_006
// Pass these values on to the next step: `nid_006, pr_score_006`.
WITH nid_006, pr_score_006
// Keep only results where `pr_score_006 > 0.45`.
WHERE pr_score_006 > 0.45
// Give back (show) these results: `nid_006, pr_score_006`.
RETURN nid_006, pr_score_006
// Sort the results by `pr_score_006 DESC` (highest first).
ORDER BY pr_score_006 DESC
// Return at most 20 results.
LIMIT 20;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 31 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 31 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 1000, parallel: true}`.
  {batchSize: 1000, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 3 })`.
MATCH (start:Multimodal { priority: 3 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `3`.
  maxLevel: 3,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_007, relationships AS edges_007`.
}) YIELD nodes AS reachable_007, relationships AS edges_007
// Give back (show) these results: `size(reachable_007) AS node_count_007`.
RETURN size(reachable_007) AS node_count_007,
       // ...also include the value `size(edges_007) AS edge_count_007` in the results.
       size(edges_007) AS edge_count_007;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_7', {
  // Property / setting `maxIterations` = `21`.
  maxIterations: 21,
  // Property / setting `dampingFactor` = `0.79`.
  dampingFactor: 0.79
// End of the settings; collect these outputs: `nodeId AS nid_007, score AS pr_score_007`.
}) YIELD nodeId AS nid_007, score AS pr_score_007
// Pass these values on to the next step: `nid_007, pr_score_007`.
WITH nid_007, pr_score_007
// Keep only results where `pr_score_007 > 0.383`.
WHERE pr_score_007 > 0.383
// Give back (show) these results: `nid_007, pr_score_007`.
RETURN nid_007, pr_score_007
// Sort the results by `pr_score_007 DESC` (highest first).
ORDER BY pr_score_007 DESC
// Return at most 20 results.
LIMIT 20;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 32 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 32 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 100, parallel: true}`.
  {batchSize: 100, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 4 })`.
MATCH (start:Multimodal { priority: 4 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `4`.
  maxLevel: 4,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_008, relationships AS edges_008`.
}) YIELD nodes AS reachable_008, relationships AS edges_008
// Give back (show) these results: `size(reachable_008) AS node_count_008`.
RETURN size(reachable_008) AS node_count_008,
       // ...also include the value `size(edges_008) AS edge_count_008` in the results.
       size(edges_008) AS edge_count_008;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_8', {
  // Property / setting `maxIterations` = `50`.
  maxIterations: 50,
  // Property / setting `dampingFactor` = `0.792`.
  dampingFactor: 0.792
// End of the settings; collect these outputs: `nodeId AS nid_008, score AS pr_score_008`.
}) YIELD nodeId AS nid_008, score AS pr_score_008
// Pass these values on to the next step: `nid_008, pr_score_008`.
WITH nid_008, pr_score_008
// Keep only results where `pr_score_008 > 0.457`.
WHERE pr_score_008 > 0.457
// Give back (show) these results: `nid_008, pr_score_008`.
RETURN nid_008, pr_score_008
// Sort the results by `pr_score_008 DESC` (highest first).
ORDER BY pr_score_008 DESC
// Return at most 50 results.
LIMIT 50;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 40 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 40 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 500, parallel: true}`.
  {batchSize: 500, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 5 })`.
MATCH (start:Multimodal { priority: 5 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `5`.
  maxLevel: 5,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_009, relationships AS edges_009`.
}) YIELD nodes AS reachable_009, relationships AS edges_009
// Give back (show) these results: `size(reachable_009) AS node_count_009`.
RETURN size(reachable_009) AS node_count_009,
       // ...also include the value `size(edges_009) AS edge_count_009` in the results.
       size(edges_009) AS edge_count_009;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_9', {
  // Property / setting `maxIterations` = `49`.
  maxIterations: 49,
  // Property / setting `dampingFactor` = `0.881`.
  dampingFactor: 0.881
// End of the settings; collect these outputs: `nodeId AS nid_009, score AS pr_score_009`.
}) YIELD nodeId AS nid_009, score AS pr_score_009
// Pass these values on to the next step: `nid_009, pr_score_009`.
WITH nid_009, pr_score_009
// Keep only results where `pr_score_009 > 0.387`.
WHERE pr_score_009 > 0.387
// Give back (show) these results: `nid_009, pr_score_009`.
RETURN nid_009, pr_score_009
// Sort the results by `pr_score_009 DESC` (highest first).
ORDER BY pr_score_009 DESC
// Return at most 50 results.
LIMIT 50;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 16 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 16 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 1000, parallel: true}`.
  {batchSize: 1000, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 3 })`.
MATCH (start:Multimodal { priority: 3 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `4`.
  maxLevel: 4,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_010, relationships AS edges_010`.
}) YIELD nodes AS reachable_010, relationships AS edges_010
// Give back (show) these results: `size(reachable_010) AS node_count_010`.
RETURN size(reachable_010) AS node_count_010,
       // ...also include the value `size(edges_010) AS edge_count_010` in the results.
       size(edges_010) AS edge_count_010;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_10', {
  // Property / setting `maxIterations` = `40`.
  maxIterations: 40,
  // Property / setting `dampingFactor` = `0.854`.
  dampingFactor: 0.854
// End of the settings; collect these outputs: `nodeId AS nid_010, score AS pr_score_010`.
}) YIELD nodeId AS nid_010, score AS pr_score_010
// Pass these values on to the next step: `nid_010, pr_score_010`.
WITH nid_010, pr_score_010
// Keep only results where `pr_score_010 > 0.105`.
WHERE pr_score_010 > 0.105
// Give back (show) these results: `nid_010, pr_score_010`.
RETURN nid_010, pr_score_010
// Sort the results by `pr_score_010 DESC` (highest first).
ORDER BY pr_score_010 DESC
// Return at most 20 results.
LIMIT 20;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 27 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 27 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 1000, parallel: false}`.
  {batchSize: 1000, parallel: false}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 9 })`.
MATCH (start:Multimodal { priority: 9 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `5`.
  maxLevel: 5,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_011, relationships AS edges_011`.
}) YIELD nodes AS reachable_011, relationships AS edges_011
// Give back (show) these results: `size(reachable_011) AS node_count_011`.
RETURN size(reachable_011) AS node_count_011,
       // ...also include the value `size(edges_011) AS edge_count_011` in the results.
       size(edges_011) AS edge_count_011;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_11', {
  // Property / setting `maxIterations` = `19`.
  maxIterations: 19,
  // Property / setting `dampingFactor` = `0.739`.
  dampingFactor: 0.739
// End of the settings; collect these outputs: `nodeId AS nid_011, score AS pr_score_011`.
}) YIELD nodeId AS nid_011, score AS pr_score_011
// Pass these values on to the next step: `nid_011, pr_score_011`.
WITH nid_011, pr_score_011
// Keep only results where `pr_score_011 > 0.38`.
WHERE pr_score_011 > 0.38
// Give back (show) these results: `nid_011, pr_score_011`.
RETURN nid_011, pr_score_011
// Sort the results by `pr_score_011 DESC` (highest first).
ORDER BY pr_score_011 DESC
// Return at most 50 results.
LIMIT 50;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 36 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 36 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 1000, parallel: true}`.
  {batchSize: 1000, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 7 })`.
MATCH (start:Multimodal { priority: 7 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `2`.
  maxLevel: 2,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_012, relationships AS edges_012`.
}) YIELD nodes AS reachable_012, relationships AS edges_012
// Give back (show) these results: `size(reachable_012) AS node_count_012`.
RETURN size(reachable_012) AS node_count_012,
       // ...also include the value `size(edges_012) AS edge_count_012` in the results.
       size(edges_012) AS edge_count_012;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_12', {
  // Property / setting `maxIterations` = `39`.
  maxIterations: 39,
  // Property / setting `dampingFactor` = `0.714`.
  dampingFactor: 0.714
// End of the settings; collect these outputs: `nodeId AS nid_012, score AS pr_score_012`.
}) YIELD nodeId AS nid_012, score AS pr_score_012
// Pass these values on to the next step: `nid_012, pr_score_012`.
WITH nid_012, pr_score_012
// Keep only results where `pr_score_012 > 0.417`.
WHERE pr_score_012 > 0.417
// Give back (show) these results: `nid_012, pr_score_012`.
RETURN nid_012, pr_score_012
// Sort the results by `pr_score_012 DESC` (highest first).
ORDER BY pr_score_012 DESC
// Return at most 20 results.
LIMIT 20;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 25 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 25 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 500, parallel: true}`.
  {batchSize: 500, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 9 })`.
MATCH (start:Multimodal { priority: 9 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `3`.
  maxLevel: 3,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_013, relationships AS edges_013`.
}) YIELD nodes AS reachable_013, relationships AS edges_013
// Give back (show) these results: `size(reachable_013) AS node_count_013`.
RETURN size(reachable_013) AS node_count_013,
       // ...also include the value `size(edges_013) AS edge_count_013` in the results.
       size(edges_013) AS edge_count_013;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_13', {
  // Property / setting `maxIterations` = `23`.
  maxIterations: 23,
  // Property / setting `dampingFactor` = `0.944`.
  dampingFactor: 0.944
// End of the settings; collect these outputs: `nodeId AS nid_013, score AS pr_score_013`.
}) YIELD nodeId AS nid_013, score AS pr_score_013
// Pass these values on to the next step: `nid_013, pr_score_013`.
WITH nid_013, pr_score_013
// Keep only results where `pr_score_013 > 0.398`.
WHERE pr_score_013 > 0.398
// Give back (show) these results: `nid_013, pr_score_013`.
RETURN nid_013, pr_score_013
// Sort the results by `pr_score_013 DESC` (highest first).
ORDER BY pr_score_013 DESC
// Return at most 20 results.
LIMIT 20;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 31 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 31 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 500, parallel: true}`.
  {batchSize: 500, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 2 })`.
MATCH (start:Multimodal { priority: 2 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `5`.
  maxLevel: 5,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_014, relationships AS edges_014`.
}) YIELD nodes AS reachable_014, relationships AS edges_014
// Give back (show) these results: `size(reachable_014) AS node_count_014`.
RETURN size(reachable_014) AS node_count_014,
       // ...also include the value `size(edges_014) AS edge_count_014` in the results.
       size(edges_014) AS edge_count_014;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_14', {
  // Property / setting `maxIterations` = `34`.
  maxIterations: 34,
  // Property / setting `dampingFactor` = `0.76`.
  dampingFactor: 0.76
// End of the settings; collect these outputs: `nodeId AS nid_014, score AS pr_score_014`.
}) YIELD nodeId AS nid_014, score AS pr_score_014
// Pass these values on to the next step: `nid_014, pr_score_014`.
WITH nid_014, pr_score_014
// Keep only results where `pr_score_014 > 0.31`.
WHERE pr_score_014 > 0.31
// Give back (show) these results: `nid_014, pr_score_014`.
RETURN nid_014, pr_score_014
// Sort the results by `pr_score_014 DESC` (highest first).
ORDER BY pr_score_014 DESC
// Return at most 50 results.
LIMIT 50;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 16 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 16 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 500, parallel: false}`.
  {batchSize: 500, parallel: false}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 4 })`.
MATCH (start:Multimodal { priority: 4 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `6`.
  maxLevel: 6,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_015, relationships AS edges_015`.
}) YIELD nodes AS reachable_015, relationships AS edges_015
// Give back (show) these results: `size(reachable_015) AS node_count_015`.
RETURN size(reachable_015) AS node_count_015,
       // ...also include the value `size(edges_015) AS edge_count_015` in the results.
       size(edges_015) AS edge_count_015;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_15', {
  // Property / setting `maxIterations` = `31`.
  maxIterations: 31,
  // Property / setting `dampingFactor` = `0.947`.
  dampingFactor: 0.947
// End of the settings; collect these outputs: `nodeId AS nid_015, score AS pr_score_015`.
}) YIELD nodeId AS nid_015, score AS pr_score_015
// Pass these values on to the next step: `nid_015, pr_score_015`.
WITH nid_015, pr_score_015
// Keep only results where `pr_score_015 > 0.387`.
WHERE pr_score_015 > 0.387
// Give back (show) these results: `nid_015, pr_score_015`.
RETURN nid_015, pr_score_015
// Sort the results by `pr_score_015 DESC` (highest first).
ORDER BY pr_score_015 DESC
// Return at most 100 results.
LIMIT 100;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 18 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 18 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 100, parallel: true}`.
  {batchSize: 100, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 7 })`.
MATCH (start:Multimodal { priority: 7 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `5`.
  maxLevel: 5,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_016, relationships AS edges_016`.
}) YIELD nodes AS reachable_016, relationships AS edges_016
// Give back (show) these results: `size(reachable_016) AS node_count_016`.
RETURN size(reachable_016) AS node_count_016,
       // ...also include the value `size(edges_016) AS edge_count_016` in the results.
       size(edges_016) AS edge_count_016;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_16', {
  // Property / setting `maxIterations` = `34`.
  maxIterations: 34,
  // Property / setting `dampingFactor` = `0.779`.
  dampingFactor: 0.779
// End of the settings; collect these outputs: `nodeId AS nid_016, score AS pr_score_016`.
}) YIELD nodeId AS nid_016, score AS pr_score_016
// Pass these values on to the next step: `nid_016, pr_score_016`.
WITH nid_016, pr_score_016
// Keep only results where `pr_score_016 > 0.367`.
WHERE pr_score_016 > 0.367
// Give back (show) these results: `nid_016, pr_score_016`.
RETURN nid_016, pr_score_016
// Sort the results by `pr_score_016 DESC` (highest first).
ORDER BY pr_score_016 DESC
// Return at most 50 results.
LIMIT 50;

// Run the ready-made procedure `apoc.periodic.iterate` (from the APOC plugin) (name meaning:
// periodic iterate).
CALL apoc.periodic.iterate(
  // Inner query text given to the procedure: `"MATCH (n:Multimodal) WHERE n.epoch = 19 RETURN n"`.
  "MATCH (n:Multimodal) WHERE n.epoch = 19 RETURN n",
  // Inner query text given to the procedure: `"SET n.lastVisited = datetime(), n.visits =
  // coalesce(n.visits, 0) + 1"`.
  "SET n.lastVisited = datetime(), n.visits = coalesce(n.visits, 0) + 1",
  // Settings for the procedure: `{batchSize: 1000, parallel: true}`.
  {batchSize: 1000, parallel: true}
// End of the procedure call.
);

// Find the parts of the graph that match the pattern `(start:Multimodal { priority: 8 })`.
MATCH (start:Multimodal { priority: 8 })
// Run the ready-made procedure `apoc.path.subgraphAll` (from the APOC plugin) (name meaning: path
// subgraph all).
CALL apoc.path.subgraphAll(start, {
  // Property / setting `maxLevel` = `4`.
  maxLevel: 4,
  // Property / setting `relationshipFilter` = `'DEPENDS_ON>|TRIGGERS>'`.
  relationshipFilter: 'DEPENDS_ON>|TRIGGERS>',
  // Property / setting `labelFilter` = `'+Multimodal'`.
  labelFilter: '+Multimodal'
// End of the settings; collect these outputs: `nodes AS reachable_017, relationships AS edges_017`.
}) YIELD nodes AS reachable_017, relationships AS edges_017
// Give back (show) these results: `size(reachable_017) AS node_count_017`.
RETURN size(reachable_017) AS node_count_017,
       // ...also include the value `size(edges_017) AS edge_count_017` in the results.
       size(edges_017) AS edge_count_017;

// Run the ready-made procedure `gds.pageRank.stream` (from the Graph Data Science plugin) (name
// meaning: page rank stream).
CALL gds.pageRank.stream('multimodal_graph_17', {
  // Property / setting `maxIterations` = `40`.
  maxIterations: 40,
  // Property / setting `dampingFactor` = `0.751`.
  dampingFactor: 0.751
// End of the settings; collect these outputs: `nodeId AS nid_017, score AS pr_score_017`.
}) YIELD nodeId AS nid_017, score AS pr_score_017
// Pass these values on to the next step: `nid_017, pr_score_017`.
WITH nid_017, pr_score_017
// Keep only results where `pr_score_017 > 0.289`.
WHERE pr_score_017 > 0.289
// Give back (show) these results: `nid_017, pr_score_017`.
RETURN nid_017, pr_score_017
// Sort the results by `pr_score_017 DESC` (highest first).
ORDER BY pr_score_017 DESC
// Return at most 50 results.
LIMIT 50;
