// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_nodes_01.cypher
//  2. Program Description        : A Neo4j Cypher script that creates the nodes (the 'dots' /
//                                  entities) of a Neo4j graph database for the 'multimodal
//                                  model wrapper' project (lifecycle controllers area). It is
//                                  one small, separate piece so each language/part can be
//                                  tested on its own.
//  3. Author Name                : Adishree Gupta and Akshat
//  4. Date Created               : 2026-10-10
//  5. Version Number             : 1.0.0
//  6. Input                      : Parameters set at the top with :param (namespace,
//                                  batchSize, threshold, maxDepth, timeoutSeconds, region,
//                                  epoch, version).
//  7. Output                     : New nodes stored in the graph.
//  8. Variables                  : - namespace = 'multimodal_01_01'
//                                  - batchSize = 64
//                                  - threshold = 0.682
//                                  - maxDepth = 9
//                                  - timeoutSeconds = 44
//                                  - region = 'eu-west'
//                                  - epoch = 98
//                                  - version = '3.0.6'
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
// Set the parameter `batchSize` to `64`; later lines can use it as $batchSize.
:param batchSize => 64;
// Set the parameter `threshold` to `0.682`; later lines can use it as $threshold.
:param threshold => 0.682;
// Set the parameter `maxDepth` to `9`; later lines can use it as $maxDepth.
:param maxDepth => 9;
// Set the parameter `timeoutSeconds` to `44`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 44;
// Set the parameter `region` to `'eu-west'`; later lines can use it as $region.
:param region => 'eu-west';
// Set the parameter `epoch` to `98`; later lines can use it as $epoch.
:param epoch => 98;
// Set the parameter `version` to `'3.0.6'`; later lines can use it as $version.
:param version => '3.0.6';

// Create a new node (a data point in the graph) called `n_000` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_000:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_000'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_000',
  // Property / setting `name` = `'node_000'`.
  name: 'node_000',
  // Property / setting `version` = `'2.0'`.
  version: '2.0',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.4377`.
  weight: 0.4377,
  // Property / setting `score` = `0.265`.
  score: 0.265,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `78`.
  epoch: 78,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_001` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_001:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_001'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_001',
  // Property / setting `name` = `'node_001'`.
  name: 'node_001',
  // Property / setting `version` = `'1.8'`.
  version: '1.8',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.8649`.
  weight: 0.8649,
  // Property / setting `score` = `0.0579`.
  score: 0.0579,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
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

// Create a new node (a data point in the graph) called `n_002` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_002:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_002'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_002',
  // Property / setting `name` = `'node_002'`.
  name: 'node_002',
  // Property / setting `version` = `'5.5'`.
  version: '5.5',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.9139`.
  weight: 0.9139,
  // Property / setting `score` = `0.9082`.
  score: 0.9082,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `28`.
  epoch: 28,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_003` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_003:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_003'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_003',
  // Property / setting `name` = `'node_003'`.
  name: 'node_003',
  // Property / setting `version` = `'4.9'`.
  version: '4.9',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.89`.
  weight: 0.89,
  // Property / setting `score` = `0.6042`.
  score: 0.6042,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `96`.
  epoch: 96,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_004` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_004:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_004'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_004',
  // Property / setting `name` = `'node_004'`.
  name: 'node_004',
  // Property / setting `version` = `'1.7'`.
  version: '1.7',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.5895`.
  weight: 0.5895,
  // Property / setting `score` = `0.2089`.
  score: 0.2089,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
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

// Create a new node (a data point in the graph) called `n_005` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_005:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_005'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_005',
  // Property / setting `name` = `'node_005'`.
  name: 'node_005',
  // Property / setting `version` = `'3.9'`.
  version: '3.9',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.3385`.
  weight: 0.3385,
  // Property / setting `score` = `0.4963`.
  score: 0.4963,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `5`.
  epoch: 5,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_006` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_006:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_006'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_006',
  // Property / setting `name` = `'node_006'`.
  name: 'node_006',
  // Property / setting `version` = `'5.3'`.
  version: '5.3',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.2897`.
  weight: 0.2897,
  // Property / setting `score` = `0.2939`.
  score: 0.2939,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `22`.
  epoch: 22,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_007` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_007:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_007'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_007',
  // Property / setting `name` = `'node_007'`.
  name: 'node_007',
  // Property / setting `version` = `'2.3'`.
  version: '2.3',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.2385`.
  weight: 0.2385,
  // Property / setting `score` = `0.5167`.
  score: 0.5167,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `94`.
  epoch: 94,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_008` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_008:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_008'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_008',
  // Property / setting `name` = `'node_008'`.
  name: 'node_008',
  // Property / setting `version` = `'5.5'`.
  version: '5.5',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.1345`.
  weight: 0.1345,
  // Property / setting `score` = `0.4144`.
  score: 0.4144,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `60`.
  epoch: 60,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_009` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_009:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_009'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_009',
  // Property / setting `name` = `'node_009'`.
  name: 'node_009',
  // Property / setting `version` = `'2.7'`.
  version: '2.7',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.2745`.
  weight: 0.2745,
  // Property / setting `score` = `0.6938`.
  score: 0.6938,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `43`.
  epoch: 43,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_010` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_010:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_010'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_010',
  // Property / setting `name` = `'node_010'`.
  name: 'node_010',
  // Property / setting `version` = `'5.7'`.
  version: '5.7',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.8325`.
  weight: 0.8325,
  // Property / setting `score` = `0.8459`.
  score: 0.8459,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `59`.
  epoch: 59,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_011` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_011:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_011'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_011',
  // Property / setting `name` = `'node_011'`.
  name: 'node_011',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.2266`.
  weight: 0.2266,
  // Property / setting `score` = `0.7515`.
  score: 0.7515,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `13`.
  epoch: 13,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_012` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_012:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_012'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_012',
  // Property / setting `name` = `'node_012'`.
  name: 'node_012',
  // Property / setting `version` = `'3.6'`.
  version: '3.6',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.2993`.
  weight: 0.2993,
  // Property / setting `score` = `0.1935`.
  score: 0.1935,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `1`.
  epoch: 1,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_013` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_013:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_013'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_013',
  // Property / setting `name` = `'node_013'`.
  name: 'node_013',
  // Property / setting `version` = `'1.2'`.
  version: '1.2',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.4555`.
  weight: 0.4555,
  // Property / setting `score` = `0.1097`.
  score: 0.1097,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `16`.
  epoch: 16,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_014` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_014:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_014'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_014',
  // Property / setting `name` = `'node_014'`.
  name: 'node_014',
  // Property / setting `version` = `'3.1'`.
  version: '3.1',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.6959`.
  weight: 0.6959,
  // Property / setting `score` = `0.9825`.
  score: 0.9825,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `94`.
  epoch: 94,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_015` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_015:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_015'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_015',
  // Property / setting `name` = `'node_015'`.
  name: 'node_015',
  // Property / setting `version` = `'3.8'`.
  version: '3.8',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.8908`.
  weight: 0.8908,
  // Property / setting `score` = `0.287`.
  score: 0.287,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `71`.
  epoch: 71,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_016` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_016:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_016'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_016',
  // Property / setting `name` = `'node_016'`.
  name: 'node_016',
  // Property / setting `version` = `'3.9'`.
  version: '3.9',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.1014`.
  weight: 0.1014,
  // Property / setting `score` = `0.5264`.
  score: 0.5264,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `33`.
  epoch: 33,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_017` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_017:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_017'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_017',
  // Property / setting `name` = `'node_017'`.
  name: 'node_017',
  // Property / setting `version` = `'3.1'`.
  version: '3.1',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.1112`.
  weight: 0.1112,
  // Property / setting `score` = `0.2834`.
  score: 0.2834,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `80`.
  epoch: 80,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_018` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_018:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_018'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_018',
  // Property / setting `name` = `'node_018'`.
  name: 'node_018',
  // Property / setting `version` = `'5.1'`.
  version: '5.1',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.7072`.
  weight: 0.7072,
  // Property / setting `score` = `0.0802`.
  score: 0.0802,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `15`.
  epoch: 15,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_019` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_019:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_019'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_019',
  // Property / setting `name` = `'node_019'`.
  name: 'node_019',
  // Property / setting `version` = `'4.3'`.
  version: '4.3',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.4695`.
  weight: 0.4695,
  // Property / setting `score` = `0.1014`.
  score: 0.1014,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `70`.
  epoch: 70,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_020` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_020:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_020'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_020',
  // Property / setting `name` = `'node_020'`.
  name: 'node_020',
  // Property / setting `version` = `'3.7'`.
  version: '3.7',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.1949`.
  weight: 0.1949,
  // Property / setting `score` = `0.3305`.
  score: 0.3305,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `76`.
  epoch: 76,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_021` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_021:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_021'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_021',
  // Property / setting `name` = `'node_021'`.
  name: 'node_021',
  // Property / setting `version` = `'4.8'`.
  version: '4.8',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.5065`.
  weight: 0.5065,
  // Property / setting `score` = `0.0793`.
  score: 0.0793,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `71`.
  epoch: 71,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_022` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_022:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_022'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_022',
  // Property / setting `name` = `'node_022'`.
  name: 'node_022',
  // Property / setting `version` = `'2.2'`.
  version: '2.2',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.7207`.
  weight: 0.7207,
  // Property / setting `score` = `0.0591`.
  score: 0.0591,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `73`.
  epoch: 73,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_023` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_023:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_023'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_023',
  // Property / setting `name` = `'node_023'`.
  name: 'node_023',
  // Property / setting `version` = `'5.8'`.
  version: '5.8',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.1906`.
  weight: 0.1906,
  // Property / setting `score` = `0.0298`.
  score: 0.0298,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `50`.
  epoch: 50,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_024` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_024:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_024'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_024',
  // Property / setting `name` = `'node_024'`.
  name: 'node_024',
  // Property / setting `version` = `'4.7'`.
  version: '4.7',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.1813`.
  weight: 0.1813,
  // Property / setting `score` = `0.588`.
  score: 0.588,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `43`.
  epoch: 43,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_025` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_025:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_025'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_025',
  // Property / setting `name` = `'node_025'`.
  name: 'node_025',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.8131`.
  weight: 0.8131,
  // Property / setting `score` = `0.5504`.
  score: 0.5504,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `84`.
  epoch: 84,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_026` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_026:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_026'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_026',
  // Property / setting `name` = `'node_026'`.
  name: 'node_026',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.2871`.
  weight: 0.2871,
  // Property / setting `score` = `0.3198`.
  score: 0.3198,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `60`.
  epoch: 60,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_027` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_027:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_027'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_027',
  // Property / setting `name` = `'node_027'`.
  name: 'node_027',
  // Property / setting `version` = `'1.7'`.
  version: '1.7',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.1491`.
  weight: 0.1491,
  // Property / setting `score` = `0.5477`.
  score: 0.5477,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `74`.
  epoch: 74,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_028` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_028:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_028'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_028',
  // Property / setting `name` = `'node_028'`.
  name: 'node_028',
  // Property / setting `version` = `'2.0'`.
  version: '2.0',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.9034`.
  weight: 0.9034,
  // Property / setting `score` = `0.1811`.
  score: 0.1811,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `89`.
  epoch: 89,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_029` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_029:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_029'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_029',
  // Property / setting `name` = `'node_029'`.
  name: 'node_029',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.5362`.
  weight: 0.5362,
  // Property / setting `score` = `0.4738`.
  score: 0.4738,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `46`.
  epoch: 46,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_030` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_030:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_030'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_030',
  // Property / setting `name` = `'node_030'`.
  name: 'node_030',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.6799`.
  weight: 0.6799,
  // Property / setting `score` = `0.6881`.
  score: 0.6881,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `49`.
  epoch: 49,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_031` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_031:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_031'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_031',
  // Property / setting `name` = `'node_031'`.
  name: 'node_031',
  // Property / setting `version` = `'3.2'`.
  version: '3.2',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.5263`.
  weight: 0.5263,
  // Property / setting `score` = `0.6888`.
  score: 0.6888,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
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

// Create a new node (a data point in the graph) called `n_032` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_032:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_032'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_032',
  // Property / setting `name` = `'node_032'`.
  name: 'node_032',
  // Property / setting `version` = `'1.6'`.
  version: '1.6',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.3576`.
  weight: 0.3576,
  // Property / setting `score` = `0.1633`.
  score: 0.1633,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `49`.
  epoch: 49,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_033` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_033:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_033'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_033',
  // Property / setting `name` = `'node_033'`.
  name: 'node_033',
  // Property / setting `version` = `'3.2'`.
  version: '3.2',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.8711`.
  weight: 0.8711,
  // Property / setting `score` = `0.2009`.
  score: 0.2009,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `83`.
  epoch: 83,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_034` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_034:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_034'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_034',
  // Property / setting `name` = `'node_034'`.
  name: 'node_034',
  // Property / setting `version` = `'4.2'`.
  version: '4.2',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.9044`.
  weight: 0.9044,
  // Property / setting `score` = `0.525`.
  score: 0.525,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `54`.
  epoch: 54,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_035` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_035:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_035'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_035',
  // Property / setting `name` = `'node_035'`.
  name: 'node_035',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.4091`.
  weight: 0.4091,
  // Property / setting `score` = `0.3845`.
  score: 0.3845,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `22`.
  epoch: 22,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_036` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_036:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_036'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_036',
  // Property / setting `name` = `'node_036'`.
  name: 'node_036',
  // Property / setting `version` = `'2.1'`.
  version: '2.1',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.2838`.
  weight: 0.2838,
  // Property / setting `score` = `0.1388`.
  score: 0.1388,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `41`.
  epoch: 41,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_037` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_037:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_037'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_037',
  // Property / setting `name` = `'node_037'`.
  name: 'node_037',
  // Property / setting `version` = `'4.4'`.
  version: '4.4',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.4348`.
  weight: 0.4348,
  // Property / setting `score` = `0.2006`.
  score: 0.2006,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `51`.
  epoch: 51,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_038` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_038:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_038'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_038',
  // Property / setting `name` = `'node_038'`.
  name: 'node_038',
  // Property / setting `version` = `'5.0'`.
  version: '5.0',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.1643`.
  weight: 0.1643,
  // Property / setting `score` = `0.0394`.
  score: 0.0394,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `79`.
  epoch: 79,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_039` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_039:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_08_lifecycle_controllers_1_039'`.
  identifier: 'multimodal_08_lifecycle_controllers_1_039',
  // Property / setting `name` = `'node_039'`.
  name: 'node_039',
  // Property / setting `version` = `'3.1'`.
  version: '3.1',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.7502`.
  weight: 0.7502,
  // Property / setting `score` = `0.5916`.
  score: 0.5916,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `29`.
  epoch: 29,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});
