// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_nodes_01.cypher
//  2. Program Description        : A Neo4j Cypher script that creates the nodes (the 'dots' /
//                                  entities) of a Neo4j graph database for the 'multimodal
//                                  model wrapper' project (config managers area). It is one
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
//                                  - batchSize = 128
//                                  - threshold = 0.842
//                                  - maxDepth = 5
//                                  - timeoutSeconds = 34
//                                  - region = 'us-west'
//                                  - epoch = 6
//                                  - version = '4.8.1'
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
// Set the parameter `batchSize` to `128`; later lines can use it as $batchSize.
:param batchSize => 128;
// Set the parameter `threshold` to `0.842`; later lines can use it as $threshold.
:param threshold => 0.842;
// Set the parameter `maxDepth` to `5`; later lines can use it as $maxDepth.
:param maxDepth => 5;
// Set the parameter `timeoutSeconds` to `34`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 34;
// Set the parameter `region` to `'us-west'`; later lines can use it as $region.
:param region => 'us-west';
// Set the parameter `epoch` to `6`; later lines can use it as $epoch.
:param epoch => 6;
// Set the parameter `version` to `'4.8.1'`; later lines can use it as $version.
:param version => '4.8.1';

// Create a new node (a data point in the graph) called `n_000` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_000:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_000'`.
  identifier: 'multimodal_03_config_managers_1_000',
  // Property / setting `name` = `'node_000'`.
  name: 'node_000',
  // Property / setting `version` = `'4.4'`.
  version: '4.4',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.1827`.
  weight: 0.1827,
  // Property / setting `score` = `0.8888`.
  score: 0.8888,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `60`.
  epoch: 60,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_001` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_001:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_001'`.
  identifier: 'multimodal_03_config_managers_1_001',
  // Property / setting `name` = `'node_001'`.
  name: 'node_001',
  // Property / setting `version` = `'5.3'`.
  version: '5.3',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.374`.
  weight: 0.374,
  // Property / setting `score` = `0.6802`.
  score: 0.6802,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
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

// Create a new node (a data point in the graph) called `n_002` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_002:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_002'`.
  identifier: 'multimodal_03_config_managers_1_002',
  // Property / setting `name` = `'node_002'`.
  name: 'node_002',
  // Property / setting `version` = `'1.1'`.
  version: '1.1',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.1361`.
  weight: 0.1361,
  // Property / setting `score` = `0.5479`.
  score: 0.5479,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `3`.
  epoch: 3,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_003` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_003:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_003'`.
  identifier: 'multimodal_03_config_managers_1_003',
  // Property / setting `name` = `'node_003'`.
  name: 'node_003',
  // Property / setting `version` = `'2.3'`.
  version: '2.3',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.7176`.
  weight: 0.7176,
  // Property / setting `score` = `0.0916`.
  score: 0.0916,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `60`.
  epoch: 60,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_004` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_004:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_004'`.
  identifier: 'multimodal_03_config_managers_1_004',
  // Property / setting `name` = `'node_004'`.
  name: 'node_004',
  // Property / setting `version` = `'4.5'`.
  version: '4.5',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.2942`.
  weight: 0.2942,
  // Property / setting `score` = `0.5979`.
  score: 0.5979,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `56`.
  epoch: 56,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_005` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_005:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_005'`.
  identifier: 'multimodal_03_config_managers_1_005',
  // Property / setting `name` = `'node_005'`.
  name: 'node_005',
  // Property / setting `version` = `'3.2'`.
  version: '3.2',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.6153`.
  weight: 0.6153,
  // Property / setting `score` = `0.3448`.
  score: 0.3448,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
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

// Create a new node (a data point in the graph) called `n_006` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_006:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_006'`.
  identifier: 'multimodal_03_config_managers_1_006',
  // Property / setting `name` = `'node_006'`.
  name: 'node_006',
  // Property / setting `version` = `'4.9'`.
  version: '4.9',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.2163`.
  weight: 0.2163,
  // Property / setting `score` = `0.5089`.
  score: 0.5089,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
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

// Create a new node (a data point in the graph) called `n_007` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_007:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_007'`.
  identifier: 'multimodal_03_config_managers_1_007',
  // Property / setting `name` = `'node_007'`.
  name: 'node_007',
  // Property / setting `version` = `'4.1'`.
  version: '4.1',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.451`.
  weight: 0.451,
  // Property / setting `score` = `0.8241`.
  score: 0.8241,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `4`.
  epoch: 4,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_008` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_008:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_008'`.
  identifier: 'multimodal_03_config_managers_1_008',
  // Property / setting `name` = `'node_008'`.
  name: 'node_008',
  // Property / setting `version` = `'3.9'`.
  version: '3.9',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.656`.
  weight: 0.656,
  // Property / setting `score` = `0.1933`.
  score: 0.1933,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `64`.
  epoch: 64,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_009` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_009:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_009'`.
  identifier: 'multimodal_03_config_managers_1_009',
  // Property / setting `name` = `'node_009'`.
  name: 'node_009',
  // Property / setting `version` = `'1.5'`.
  version: '1.5',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.1808`.
  weight: 0.1808,
  // Property / setting `score` = `0.7434`.
  score: 0.7434,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `11`.
  epoch: 11,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_010` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_010:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_010'`.
  identifier: 'multimodal_03_config_managers_1_010',
  // Property / setting `name` = `'node_010'`.
  name: 'node_010',
  // Property / setting `version` = `'2.3'`.
  version: '2.3',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.9347`.
  weight: 0.9347,
  // Property / setting `score` = `0.4372`.
  score: 0.4372,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
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

// Create a new node (a data point in the graph) called `n_011` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_011:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_011'`.
  identifier: 'multimodal_03_config_managers_1_011',
  // Property / setting `name` = `'node_011'`.
  name: 'node_011',
  // Property / setting `version` = `'1.6'`.
  version: '1.6',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.9798`.
  weight: 0.9798,
  // Property / setting `score` = `0.8187`.
  score: 0.8187,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `44`.
  epoch: 44,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_012` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_012:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_012'`.
  identifier: 'multimodal_03_config_managers_1_012',
  // Property / setting `name` = `'node_012'`.
  name: 'node_012',
  // Property / setting `version` = `'3.0'`.
  version: '3.0',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.8975`.
  weight: 0.8975,
  // Property / setting `score` = `0.4399`.
  score: 0.4399,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `24`.
  epoch: 24,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_013` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_013:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_013'`.
  identifier: 'multimodal_03_config_managers_1_013',
  // Property / setting `name` = `'node_013'`.
  name: 'node_013',
  // Property / setting `version` = `'4.4'`.
  version: '4.4',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.9436`.
  weight: 0.9436,
  // Property / setting `score` = `0.9606`.
  score: 0.9606,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `37`.
  epoch: 37,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_014` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_014:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_014'`.
  identifier: 'multimodal_03_config_managers_1_014',
  // Property / setting `name` = `'node_014'`.
  name: 'node_014',
  // Property / setting `version` = `'5.9'`.
  version: '5.9',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.9554`.
  weight: 0.9554,
  // Property / setting `score` = `0.1032`.
  score: 0.1032,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `40`.
  epoch: 40,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_015` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_015:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_015'`.
  identifier: 'multimodal_03_config_managers_1_015',
  // Property / setting `name` = `'node_015'`.
  name: 'node_015',
  // Property / setting `version` = `'1.8'`.
  version: '1.8',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.6916`.
  weight: 0.6916,
  // Property / setting `score` = `0.4972`.
  score: 0.4972,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `91`.
  epoch: 91,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_016` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_016:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_016'`.
  identifier: 'multimodal_03_config_managers_1_016',
  // Property / setting `name` = `'node_016'`.
  name: 'node_016',
  // Property / setting `version` = `'4.8'`.
  version: '4.8',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.7095`.
  weight: 0.7095,
  // Property / setting `score` = `0.4123`.
  score: 0.4123,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `44`.
  epoch: 44,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_017` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_017:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_017'`.
  identifier: 'multimodal_03_config_managers_1_017',
  // Property / setting `name` = `'node_017'`.
  name: 'node_017',
  // Property / setting `version` = `'5.3'`.
  version: '5.3',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.984`.
  weight: 0.984,
  // Property / setting `score` = `0.6642`.
  score: 0.6642,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `4`.
  epoch: 4,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_018` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_018:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_018'`.
  identifier: 'multimodal_03_config_managers_1_018',
  // Property / setting `name` = `'node_018'`.
  name: 'node_018',
  // Property / setting `version` = `'2.9'`.
  version: '2.9',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.2067`.
  weight: 0.2067,
  // Property / setting `score` = `0.8`.
  score: 0.8,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `35`.
  epoch: 35,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_019` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_019:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_019'`.
  identifier: 'multimodal_03_config_managers_1_019',
  // Property / setting `name` = `'node_019'`.
  name: 'node_019',
  // Property / setting `version` = `'4.0'`.
  version: '4.0',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.1551`.
  weight: 0.1551,
  // Property / setting `score` = `0.0191`.
  score: 0.0191,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `6`.
  epoch: 6,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_020` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_020:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_020'`.
  identifier: 'multimodal_03_config_managers_1_020',
  // Property / setting `name` = `'node_020'`.
  name: 'node_020',
  // Property / setting `version` = `'4.3'`.
  version: '4.3',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.5875`.
  weight: 0.5875,
  // Property / setting `score` = `0.3874`.
  score: 0.3874,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `75`.
  epoch: 75,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_021` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_021:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_021'`.
  identifier: 'multimodal_03_config_managers_1_021',
  // Property / setting `name` = `'node_021'`.
  name: 'node_021',
  // Property / setting `version` = `'4.6'`.
  version: '4.6',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.5586`.
  weight: 0.5586,
  // Property / setting `score` = `0.4616`.
  score: 0.4616,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `73`.
  epoch: 73,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_022` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_022:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_022'`.
  identifier: 'multimodal_03_config_managers_1_022',
  // Property / setting `name` = `'node_022'`.
  name: 'node_022',
  // Property / setting `version` = `'5.3'`.
  version: '5.3',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.961`.
  weight: 0.961,
  // Property / setting `score` = `0.7745`.
  score: 0.7745,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `81`.
  epoch: 81,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_023` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_023:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_023'`.
  identifier: 'multimodal_03_config_managers_1_023',
  // Property / setting `name` = `'node_023'`.
  name: 'node_023',
  // Property / setting `version` = `'1.9'`.
  version: '1.9',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.9881`.
  weight: 0.9881,
  // Property / setting `score` = `0.1237`.
  score: 0.1237,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `30`.
  epoch: 30,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_024` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_024:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_024'`.
  identifier: 'multimodal_03_config_managers_1_024',
  // Property / setting `name` = `'node_024'`.
  name: 'node_024',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.4109`.
  weight: 0.4109,
  // Property / setting `score` = `0.5444`.
  score: 0.5444,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
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

// Create a new node (a data point in the graph) called `n_025` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_025:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_025'`.
  identifier: 'multimodal_03_config_managers_1_025',
  // Property / setting `name` = `'node_025'`.
  name: 'node_025',
  // Property / setting `version` = `'5.2'`.
  version: '5.2',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.8882`.
  weight: 0.8882,
  // Property / setting `score` = `0.1571`.
  score: 0.1571,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `8`.
  epoch: 8,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_026` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_026:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_026'`.
  identifier: 'multimodal_03_config_managers_1_026',
  // Property / setting `name` = `'node_026'`.
  name: 'node_026',
  // Property / setting `version` = `'3.7'`.
  version: '3.7',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.6808`.
  weight: 0.6808,
  // Property / setting `score` = `0.7822`.
  score: 0.7822,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `70`.
  epoch: 70,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_027` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_027:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_027'`.
  identifier: 'multimodal_03_config_managers_1_027',
  // Property / setting `name` = `'node_027'`.
  name: 'node_027',
  // Property / setting `version` = `'2.2'`.
  version: '2.2',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.4834`.
  weight: 0.4834,
  // Property / setting `score` = `0.9748`.
  score: 0.9748,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
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

// Create a new node (a data point in the graph) called `n_028` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_028:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_028'`.
  identifier: 'multimodal_03_config_managers_1_028',
  // Property / setting `name` = `'node_028'`.
  name: 'node_028',
  // Property / setting `version` = `'2.3'`.
  version: '2.3',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.9446`.
  weight: 0.9446,
  // Property / setting `score` = `0.1381`.
  score: 0.1381,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `17`.
  epoch: 17,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_029` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_029:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_029'`.
  identifier: 'multimodal_03_config_managers_1_029',
  // Property / setting `name` = `'node_029'`.
  name: 'node_029',
  // Property / setting `version` = `'3.6'`.
  version: '3.6',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.1782`.
  weight: 0.1782,
  // Property / setting `score` = `0.665`.
  score: 0.665,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `53`.
  epoch: 53,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_030` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_030:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_030'`.
  identifier: 'multimodal_03_config_managers_1_030',
  // Property / setting `name` = `'node_030'`.
  name: 'node_030',
  // Property / setting `version` = `'2.9'`.
  version: '2.9',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.2119`.
  weight: 0.2119,
  // Property / setting `score` = `0.1874`.
  score: 0.1874,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `24`.
  epoch: 24,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_031` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_031:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_031'`.
  identifier: 'multimodal_03_config_managers_1_031',
  // Property / setting `name` = `'node_031'`.
  name: 'node_031',
  // Property / setting `version` = `'1.0'`.
  version: '1.0',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.7583`.
  weight: 0.7583,
  // Property / setting `score` = `0.9977`.
  score: 0.9977,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `24`.
  epoch: 24,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_032` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_032:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_032'`.
  identifier: 'multimodal_03_config_managers_1_032',
  // Property / setting `name` = `'node_032'`.
  name: 'node_032',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.2139`.
  weight: 0.2139,
  // Property / setting `score` = `0.7104`.
  score: 0.7104,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `12`.
  epoch: 12,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_033` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_033:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_033'`.
  identifier: 'multimodal_03_config_managers_1_033',
  // Property / setting `name` = `'node_033'`.
  name: 'node_033',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.5485`.
  weight: 0.5485,
  // Property / setting `score` = `0.0615`.
  score: 0.0615,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `19`.
  epoch: 19,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_034` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_034:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_034'`.
  identifier: 'multimodal_03_config_managers_1_034',
  // Property / setting `name` = `'node_034'`.
  name: 'node_034',
  // Property / setting `version` = `'2.1'`.
  version: '2.1',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.4982`.
  weight: 0.4982,
  // Property / setting `score` = `0.7245`.
  score: 0.7245,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `31`.
  epoch: 31,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_035` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_035:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_035'`.
  identifier: 'multimodal_03_config_managers_1_035',
  // Property / setting `name` = `'node_035'`.
  name: 'node_035',
  // Property / setting `version` = `'3.7'`.
  version: '3.7',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.3007`.
  weight: 0.3007,
  // Property / setting `score` = `0.5152`.
  score: 0.5152,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
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

// Create a new node (a data point in the graph) called `n_036` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_036:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_036'`.
  identifier: 'multimodal_03_config_managers_1_036',
  // Property / setting `name` = `'node_036'`.
  name: 'node_036',
  // Property / setting `version` = `'5.3'`.
  version: '5.3',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.8888`.
  weight: 0.8888,
  // Property / setting `score` = `0.8958`.
  score: 0.8958,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `74`.
  epoch: 74,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_037` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_037:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_037'`.
  identifier: 'multimodal_03_config_managers_1_037',
  // Property / setting `name` = `'node_037'`.
  name: 'node_037',
  // Property / setting `version` = `'2.3'`.
  version: '2.3',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.4136`.
  weight: 0.4136,
  // Property / setting `score` = `0.0448`.
  score: 0.0448,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `98`.
  epoch: 98,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_038` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_038:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_038'`.
  identifier: 'multimodal_03_config_managers_1_038',
  // Property / setting `name` = `'node_038'`.
  name: 'node_038',
  // Property / setting `version` = `'1.0'`.
  version: '1.0',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.6447`.
  weight: 0.6447,
  // Property / setting `score` = `0.6956`.
  score: 0.6956,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `87`.
  epoch: 87,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_039` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_039:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_03_config_managers_1_039'`.
  identifier: 'multimodal_03_config_managers_1_039',
  // Property / setting `name` = `'node_039'`.
  name: 'node_039',
  // Property / setting `version` = `'2.8'`.
  version: '2.8',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.1269`.
  weight: 0.1269,
  // Property / setting `score` = `0.2882`.
  score: 0.2882,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `36`.
  epoch: 36,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});
