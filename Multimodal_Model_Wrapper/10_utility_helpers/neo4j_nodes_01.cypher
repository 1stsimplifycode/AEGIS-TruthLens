// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_nodes_01.cypher
//  2. Program Description        : A Neo4j Cypher script that creates the nodes (the 'dots' /
//                                  entities) of a Neo4j graph database for the 'multimodal
//                                  model wrapper' project (utility helpers area). It is one
//                                  small, separate piece so each language/part can be tested
//                                  on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New nodes stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_01_01'
//                                  - batchSize = 512
//                                  - threshold = 0.794
//                                  - maxDepth = 11
//                                  - timeoutSeconds = 105
//                                  - region = 'ap-south'
//                                  - epoch = 86
//                                  - version = '5.9.7'
//  9. Algorithm / Logic          : - Contains about 40 CREATE and 0 MATCH statements.
//                                  - CREATE adds new data; MATCH finds existing data; RETURN
//                                    shows the result.
//                                  - Node labels used: Multimodal.
// 10. Dependencies               : - Neo4j database (version 5 recommended).
//                                  - cypher-shell (comes with Neo4j).
// 11. Execution Instructions     : cypher-shell -u neo4j -p <password> -f
//                                  neo4j_nodes_01.cypher
// 12. Assumptions and Limitations: - The required tools listed above are installed and on the
//                                    PATH.
//                                  - Limitation: results are only as good as the data given to
//                                    it.
// 13. Error Handling             : No special error handling. If a statement fails, Neo4j
//                                  stops and reports the error.
// =============================================================================================

// Set the parameter `namespace` to `'multimodal_01_01'`; later lines can use it as $namespace.
:param namespace => 'multimodal_01_01';
// Set the parameter `batchSize` to `512`; later lines can use it as $batchSize.
:param batchSize => 512;
// Set the parameter `threshold` to `0.794`; later lines can use it as $threshold.
:param threshold => 0.794;
// Set the parameter `maxDepth` to `11`; later lines can use it as $maxDepth.
:param maxDepth => 11;
// Set the parameter `timeoutSeconds` to `105`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 105;
// Set the parameter `region` to `'ap-south'`; later lines can use it as $region.
:param region => 'ap-south';
// Set the parameter `epoch` to `86`; later lines can use it as $epoch.
:param epoch => 86;
// Set the parameter `version` to `'5.9.7'`; later lines can use it as $version.
:param version => '5.9.7';

// Create a new node (a data point in the graph) called `n_000` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_000:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_000'`.
  identifier: 'multimodal_10_utility_helpers_1_000',
  // Property / setting `name` = `'node_000'`.
  name: 'node_000',
  // Property / setting `version` = `'1.8'`.
  version: '1.8',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.3023`.
  weight: 0.3023,
  // Property / setting `score` = `0.9666`.
  score: 0.9666,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `88`.
  epoch: 88,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_001` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_001:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_001'`.
  identifier: 'multimodal_10_utility_helpers_1_001',
  // Property / setting `name` = `'node_001'`.
  name: 'node_001',
  // Property / setting `version` = `'3.0'`.
  version: '3.0',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.5479`.
  weight: 0.5479,
  // Property / setting `score` = `0.9196`.
  score: 0.9196,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `45`.
  epoch: 45,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_002` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_002:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_002'`.
  identifier: 'multimodal_10_utility_helpers_1_002',
  // Property / setting `name` = `'node_002'`.
  name: 'node_002',
  // Property / setting `version` = `'2.9'`.
  version: '2.9',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.1285`.
  weight: 0.1285,
  // Property / setting `score` = `0.6402`.
  score: 0.6402,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `46`.
  epoch: 46,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_003` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_003:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_003'`.
  identifier: 'multimodal_10_utility_helpers_1_003',
  // Property / setting `name` = `'node_003'`.
  name: 'node_003',
  // Property / setting `version` = `'2.6'`.
  version: '2.6',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.522`.
  weight: 0.522,
  // Property / setting `score` = `0.3967`.
  score: 0.3967,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `51`.
  epoch: 51,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_004` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_004:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_004'`.
  identifier: 'multimodal_10_utility_helpers_1_004',
  // Property / setting `name` = `'node_004'`.
  name: 'node_004',
  // Property / setting `version` = `'4.4'`.
  version: '4.4',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.9269`.
  weight: 0.9269,
  // Property / setting `score` = `0.9124`.
  score: 0.9124,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `58`.
  epoch: 58,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_005` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_005:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_005'`.
  identifier: 'multimodal_10_utility_helpers_1_005',
  // Property / setting `name` = `'node_005'`.
  name: 'node_005',
  // Property / setting `version` = `'3.0'`.
  version: '3.0',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.6575`.
  weight: 0.6575,
  // Property / setting `score` = `0.7272`.
  score: 0.7272,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `85`.
  epoch: 85,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_006` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_006:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_006'`.
  identifier: 'multimodal_10_utility_helpers_1_006',
  // Property / setting `name` = `'node_006'`.
  name: 'node_006',
  // Property / setting `version` = `'3.3'`.
  version: '3.3',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.623`.
  weight: 0.623,
  // Property / setting `score` = `0.3148`.
  score: 0.3148,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `92`.
  epoch: 92,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_007` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_007:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_007'`.
  identifier: 'multimodal_10_utility_helpers_1_007',
  // Property / setting `name` = `'node_007'`.
  name: 'node_007',
  // Property / setting `version` = `'3.5'`.
  version: '3.5',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.9504`.
  weight: 0.9504,
  // Property / setting `score` = `0.151`.
  score: 0.151,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `81`.
  epoch: 81,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_008` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_008:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_008'`.
  identifier: 'multimodal_10_utility_helpers_1_008',
  // Property / setting `name` = `'node_008'`.
  name: 'node_008',
  // Property / setting `version` = `'5.5'`.
  version: '5.5',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.6962`.
  weight: 0.6962,
  // Property / setting `score` = `0.203`.
  score: 0.203,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `49`.
  epoch: 49,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_009` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_009:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_009'`.
  identifier: 'multimodal_10_utility_helpers_1_009',
  // Property / setting `name` = `'node_009'`.
  name: 'node_009',
  // Property / setting `version` = `'2.8'`.
  version: '2.8',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.2317`.
  weight: 0.2317,
  // Property / setting `score` = `0.6369`.
  score: 0.6369,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `66`.
  epoch: 66,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_010` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_010:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_010'`.
  identifier: 'multimodal_10_utility_helpers_1_010',
  // Property / setting `name` = `'node_010'`.
  name: 'node_010',
  // Property / setting `version` = `'3.7'`.
  version: '3.7',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.6439`.
  weight: 0.6439,
  // Property / setting `score` = `0.6552`.
  score: 0.6552,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `4`.
  epoch: 4,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_011` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_011:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_011'`.
  identifier: 'multimodal_10_utility_helpers_1_011',
  // Property / setting `name` = `'node_011'`.
  name: 'node_011',
  // Property / setting `version` = `'3.8'`.
  version: '3.8',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.6004`.
  weight: 0.6004,
  // Property / setting `score` = `0.4079`.
  score: 0.4079,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `92`.
  epoch: 92,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_012` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_012:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_012'`.
  identifier: 'multimodal_10_utility_helpers_1_012',
  // Property / setting `name` = `'node_012'`.
  name: 'node_012',
  // Property / setting `version` = `'2.9'`.
  version: '2.9',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.3094`.
  weight: 0.3094,
  // Property / setting `score` = `0.1815`.
  score: 0.1815,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `50`.
  epoch: 50,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_013` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_013:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_013'`.
  identifier: 'multimodal_10_utility_helpers_1_013',
  // Property / setting `name` = `'node_013'`.
  name: 'node_013',
  // Property / setting `version` = `'3.9'`.
  version: '3.9',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.2236`.
  weight: 0.2236,
  // Property / setting `score` = `0.7085`.
  score: 0.7085,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `21`.
  epoch: 21,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_014` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_014:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_014'`.
  identifier: 'multimodal_10_utility_helpers_1_014',
  // Property / setting `name` = `'node_014'`.
  name: 'node_014',
  // Property / setting `version` = `'3.3'`.
  version: '3.3',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.4527`.
  weight: 0.4527,
  // Property / setting `score` = `0.7379`.
  score: 0.7379,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `63`.
  epoch: 63,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_015` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_015:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_015'`.
  identifier: 'multimodal_10_utility_helpers_1_015',
  // Property / setting `name` = `'node_015'`.
  name: 'node_015',
  // Property / setting `version` = `'5.3'`.
  version: '5.3',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.19`.
  weight: 0.19,
  // Property / setting `score` = `0.4997`.
  score: 0.4997,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `10`.
  epoch: 10,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_016` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_016:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_016'`.
  identifier: 'multimodal_10_utility_helpers_1_016',
  // Property / setting `name` = `'node_016'`.
  name: 'node_016',
  // Property / setting `version` = `'1.1'`.
  version: '1.1',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.2512`.
  weight: 0.2512,
  // Property / setting `score` = `0.3593`.
  score: 0.3593,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `48`.
  epoch: 48,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_017` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_017:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_017'`.
  identifier: 'multimodal_10_utility_helpers_1_017',
  // Property / setting `name` = `'node_017'`.
  name: 'node_017',
  // Property / setting `version` = `'5.3'`.
  version: '5.3',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.3598`.
  weight: 0.3598,
  // Property / setting `score` = `0.6711`.
  score: 0.6711,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `14`.
  epoch: 14,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_018` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_018:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_018'`.
  identifier: 'multimodal_10_utility_helpers_1_018',
  // Property / setting `name` = `'node_018'`.
  name: 'node_018',
  // Property / setting `version` = `'5.8'`.
  version: '5.8',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.9304`.
  weight: 0.9304,
  // Property / setting `score` = `0.2976`.
  score: 0.2976,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `27`.
  epoch: 27,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_019` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_019:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_019'`.
  identifier: 'multimodal_10_utility_helpers_1_019',
  // Property / setting `name` = `'node_019'`.
  name: 'node_019',
  // Property / setting `version` = `'1.7'`.
  version: '1.7',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.3442`.
  weight: 0.3442,
  // Property / setting `score` = `0.4733`.
  score: 0.4733,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `53`.
  epoch: 53,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_020` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_020:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_020'`.
  identifier: 'multimodal_10_utility_helpers_1_020',
  // Property / setting `name` = `'node_020'`.
  name: 'node_020',
  // Property / setting `version` = `'4.7'`.
  version: '4.7',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.9363`.
  weight: 0.9363,
  // Property / setting `score` = `0.4126`.
  score: 0.4126,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `27`.
  epoch: 27,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_021` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_021:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_021'`.
  identifier: 'multimodal_10_utility_helpers_1_021',
  // Property / setting `name` = `'node_021'`.
  name: 'node_021',
  // Property / setting `version` = `'1.7'`.
  version: '1.7',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.1447`.
  weight: 0.1447,
  // Property / setting `score` = `0.6876`.
  score: 0.6876,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `19`.
  epoch: 19,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_022` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_022:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_022'`.
  identifier: 'multimodal_10_utility_helpers_1_022',
  // Property / setting `name` = `'node_022'`.
  name: 'node_022',
  // Property / setting `version` = `'4.9'`.
  version: '4.9',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.534`.
  weight: 0.534,
  // Property / setting `score` = `0.6272`.
  score: 0.6272,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `83`.
  epoch: 83,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_023` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_023:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_023'`.
  identifier: 'multimodal_10_utility_helpers_1_023',
  // Property / setting `name` = `'node_023'`.
  name: 'node_023',
  // Property / setting `version` = `'1.7'`.
  version: '1.7',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.2409`.
  weight: 0.2409,
  // Property / setting `score` = `0.7758`.
  score: 0.7758,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `54`.
  epoch: 54,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_024` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_024:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_024'`.
  identifier: 'multimodal_10_utility_helpers_1_024',
  // Property / setting `name` = `'node_024'`.
  name: 'node_024',
  // Property / setting `version` = `'4.9'`.
  version: '4.9',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.7097`.
  weight: 0.7097,
  // Property / setting `score` = `0.7235`.
  score: 0.7235,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `77`.
  epoch: 77,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_025` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_025:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_025'`.
  identifier: 'multimodal_10_utility_helpers_1_025',
  // Property / setting `name` = `'node_025'`.
  name: 'node_025',
  // Property / setting `version` = `'2.5'`.
  version: '2.5',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.2839`.
  weight: 0.2839,
  // Property / setting `score` = `0.0271`.
  score: 0.0271,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `10`.
  epoch: 10,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_026` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_026:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_026'`.
  identifier: 'multimodal_10_utility_helpers_1_026',
  // Property / setting `name` = `'node_026'`.
  name: 'node_026',
  // Property / setting `version` = `'3.5'`.
  version: '3.5',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.4485`.
  weight: 0.4485,
  // Property / setting `score` = `0.7089`.
  score: 0.7089,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `1`.
  epoch: 1,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_027` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_027:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_027'`.
  identifier: 'multimodal_10_utility_helpers_1_027',
  // Property / setting `name` = `'node_027'`.
  name: 'node_027',
  // Property / setting `version` = `'2.8'`.
  version: '2.8',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.543`.
  weight: 0.543,
  // Property / setting `score` = `0.1577`.
  score: 0.1577,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `22`.
  epoch: 22,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_028` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_028:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_028'`.
  identifier: 'multimodal_10_utility_helpers_1_028',
  // Property / setting `name` = `'node_028'`.
  name: 'node_028',
  // Property / setting `version` = `'4.8'`.
  version: '4.8',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.2129`.
  weight: 0.2129,
  // Property / setting `score` = `0.4143`.
  score: 0.4143,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `44`.
  epoch: 44,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_029` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_029:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_029'`.
  identifier: 'multimodal_10_utility_helpers_1_029',
  // Property / setting `name` = `'node_029'`.
  name: 'node_029',
  // Property / setting `version` = `'2.8'`.
  version: '2.8',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.6225`.
  weight: 0.6225,
  // Property / setting `score` = `0.312`.
  score: 0.312,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `71`.
  epoch: 71,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_030` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_030:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_030'`.
  identifier: 'multimodal_10_utility_helpers_1_030',
  // Property / setting `name` = `'node_030'`.
  name: 'node_030',
  // Property / setting `version` = `'3.8'`.
  version: '3.8',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.7827`.
  weight: 0.7827,
  // Property / setting `score` = `0.9076`.
  score: 0.9076,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `2`.
  epoch: 2,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_031` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_031:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_031'`.
  identifier: 'multimodal_10_utility_helpers_1_031',
  // Property / setting `name` = `'node_031'`.
  name: 'node_031',
  // Property / setting `version` = `'1.1'`.
  version: '1.1',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.5833`.
  weight: 0.5833,
  // Property / setting `score` = `0.6201`.
  score: 0.6201,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `18`.
  epoch: 18,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_032` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_032:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_032'`.
  identifier: 'multimodal_10_utility_helpers_1_032',
  // Property / setting `name` = `'node_032'`.
  name: 'node_032',
  // Property / setting `version` = `'4.8'`.
  version: '4.8',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.4033`.
  weight: 0.4033,
  // Property / setting `score` = `0.9349`.
  score: 0.9349,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `89`.
  epoch: 89,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_033` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_033:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_033'`.
  identifier: 'multimodal_10_utility_helpers_1_033',
  // Property / setting `name` = `'node_033'`.
  name: 'node_033',
  // Property / setting `version` = `'2.3'`.
  version: '2.3',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.3447`.
  weight: 0.3447,
  // Property / setting `score` = `0.863`.
  score: 0.863,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `36`.
  epoch: 36,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_034` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_034:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_034'`.
  identifier: 'multimodal_10_utility_helpers_1_034',
  // Property / setting `name` = `'node_034'`.
  name: 'node_034',
  // Property / setting `version` = `'2.4'`.
  version: '2.4',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.21`.
  weight: 0.21,
  // Property / setting `score` = `0.8744`.
  score: 0.8744,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `30`.
  epoch: 30,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_035` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_035:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_035'`.
  identifier: 'multimodal_10_utility_helpers_1_035',
  // Property / setting `name` = `'node_035'`.
  name: 'node_035',
  // Property / setting `version` = `'3.3'`.
  version: '3.3',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.5597`.
  weight: 0.5597,
  // Property / setting `score` = `0.5957`.
  score: 0.5957,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `93`.
  epoch: 93,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_036` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_036:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_036'`.
  identifier: 'multimodal_10_utility_helpers_1_036',
  // Property / setting `name` = `'node_036'`.
  name: 'node_036',
  // Property / setting `version` = `'1.4'`.
  version: '1.4',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.4664`.
  weight: 0.4664,
  // Property / setting `score` = `0.0374`.
  score: 0.0374,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `89`.
  epoch: 89,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_037` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_037:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_037'`.
  identifier: 'multimodal_10_utility_helpers_1_037',
  // Property / setting `name` = `'node_037'`.
  name: 'node_037',
  // Property / setting `version` = `'2.4'`.
  version: '2.4',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.1536`.
  weight: 0.1536,
  // Property / setting `score` = `0.3522`.
  score: 0.3522,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `6`.
  epoch: 6,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_038` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_038:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_038'`.
  identifier: 'multimodal_10_utility_helpers_1_038',
  // Property / setting `name` = `'node_038'`.
  name: 'node_038',
  // Property / setting `version` = `'5.8'`.
  version: '5.8',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.9126`.
  weight: 0.9126,
  // Property / setting `score` = `0.9671`.
  score: 0.9671,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `20`.
  epoch: 20,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_039` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_039:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_10_utility_helpers_1_039'`.
  identifier: 'multimodal_10_utility_helpers_1_039',
  // Property / setting `name` = `'node_039'`.
  name: 'node_039',
  // Property / setting `version` = `'5.6'`.
  version: '5.6',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.9903`.
  weight: 0.9903,
  // Property / setting `score` = `0.2857`.
  score: 0.2857,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `12`.
  epoch: 12,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});
