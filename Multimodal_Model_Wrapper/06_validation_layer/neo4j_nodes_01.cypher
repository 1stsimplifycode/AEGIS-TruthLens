// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_nodes_01.cypher
//  2. Program Description        : A Neo4j Cypher script that creates the nodes (the 'dots' /
//                                  entities) of a Neo4j graph database for the 'multimodal
//                                  model wrapper' project (validation layer area). It is one
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
//                                  - threshold = 0.591
//                                  - maxDepth = 5
//                                  - timeoutSeconds = 66
//                                  - region = 'us-east'
//                                  - epoch = 97
//                                  - version = '5.6.5'
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
// Set the parameter `threshold` to `0.591`; later lines can use it as $threshold.
:param threshold => 0.591;
// Set the parameter `maxDepth` to `5`; later lines can use it as $maxDepth.
:param maxDepth => 5;
// Set the parameter `timeoutSeconds` to `66`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 66;
// Set the parameter `region` to `'us-east'`; later lines can use it as $region.
:param region => 'us-east';
// Set the parameter `epoch` to `97`; later lines can use it as $epoch.
:param epoch => 97;
// Set the parameter `version` to `'5.6.5'`; later lines can use it as $version.
:param version => '5.6.5';

// Create a new node (a data point in the graph) called `n_000` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_000:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_000'`.
  identifier: 'multimodal_06_validation_layer_1_000',
  // Property / setting `name` = `'node_000'`.
  name: 'node_000',
  // Property / setting `version` = `'4.9'`.
  version: '4.9',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.3974`.
  weight: 0.3974,
  // Property / setting `score` = `0.9823`.
  score: 0.9823,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `83`.
  epoch: 83,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_001` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_001:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_001'`.
  identifier: 'multimodal_06_validation_layer_1_001',
  // Property / setting `name` = `'node_001'`.
  name: 'node_001',
  // Property / setting `version` = `'2.3'`.
  version: '2.3',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.8993`.
  weight: 0.8993,
  // Property / setting `score` = `0.0128`.
  score: 0.0128,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `13`.
  epoch: 13,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_002` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_002:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_002'`.
  identifier: 'multimodal_06_validation_layer_1_002',
  // Property / setting `name` = `'node_002'`.
  name: 'node_002',
  // Property / setting `version` = `'3.3'`.
  version: '3.3',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.2827`.
  weight: 0.2827,
  // Property / setting `score` = `0.9883`.
  score: 0.9883,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
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

// Create a new node (a data point in the graph) called `n_003` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_003:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_003'`.
  identifier: 'multimodal_06_validation_layer_1_003',
  // Property / setting `name` = `'node_003'`.
  name: 'node_003',
  // Property / setting `version` = `'1.5'`.
  version: '1.5',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.9909`.
  weight: 0.9909,
  // Property / setting `score` = `0.3752`.
  score: 0.3752,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `24`.
  epoch: 24,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_004` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_004:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_004'`.
  identifier: 'multimodal_06_validation_layer_1_004',
  // Property / setting `name` = `'node_004'`.
  name: 'node_004',
  // Property / setting `version` = `'2.0'`.
  version: '2.0',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.3352`.
  weight: 0.3352,
  // Property / setting `score` = `0.4721`.
  score: 0.4721,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `11`.
  epoch: 11,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_005` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_005:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_005'`.
  identifier: 'multimodal_06_validation_layer_1_005',
  // Property / setting `name` = `'node_005'`.
  name: 'node_005',
  // Property / setting `version` = `'3.1'`.
  version: '3.1',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.8847`.
  weight: 0.8847,
  // Property / setting `score` = `0.4285`.
  score: 0.4285,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `76`.
  epoch: 76,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_006` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_006:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_006'`.
  identifier: 'multimodal_06_validation_layer_1_006',
  // Property / setting `name` = `'node_006'`.
  name: 'node_006',
  // Property / setting `version` = `'3.1'`.
  version: '3.1',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.5692`.
  weight: 0.5692,
  // Property / setting `score` = `0.719`.
  score: 0.719,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
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

// Create a new node (a data point in the graph) called `n_007` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_007:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_007'`.
  identifier: 'multimodal_06_validation_layer_1_007',
  // Property / setting `name` = `'node_007'`.
  name: 'node_007',
  // Property / setting `version` = `'5.5'`.
  version: '5.5',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.7268`.
  weight: 0.7268,
  // Property / setting `score` = `0.8096`.
  score: 0.8096,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `76`.
  epoch: 76,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_008` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_008:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_008'`.
  identifier: 'multimodal_06_validation_layer_1_008',
  // Property / setting `name` = `'node_008'`.
  name: 'node_008',
  // Property / setting `version` = `'5.6'`.
  version: '5.6',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.5817`.
  weight: 0.5817,
  // Property / setting `score` = `0.0462`.
  score: 0.0462,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `72`.
  epoch: 72,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_009` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_009:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_009'`.
  identifier: 'multimodal_06_validation_layer_1_009',
  // Property / setting `name` = `'node_009'`.
  name: 'node_009',
  // Property / setting `version` = `'4.3'`.
  version: '4.3',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.6557`.
  weight: 0.6557,
  // Property / setting `score` = `0.2099`.
  score: 0.2099,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
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

// Create a new node (a data point in the graph) called `n_010` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_010:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_010'`.
  identifier: 'multimodal_06_validation_layer_1_010',
  // Property / setting `name` = `'node_010'`.
  name: 'node_010',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.3423`.
  weight: 0.3423,
  // Property / setting `score` = `0.3192`.
  score: 0.3192,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `56`.
  epoch: 56,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_011` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_011:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_011'`.
  identifier: 'multimodal_06_validation_layer_1_011',
  // Property / setting `name` = `'node_011'`.
  name: 'node_011',
  // Property / setting `version` = `'1.9'`.
  version: '1.9',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.222`.
  weight: 0.222,
  // Property / setting `score` = `0.8084`.
  score: 0.8084,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
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

// Create a new node (a data point in the graph) called `n_012` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_012:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_012'`.
  identifier: 'multimodal_06_validation_layer_1_012',
  // Property / setting `name` = `'node_012'`.
  name: 'node_012',
  // Property / setting `version` = `'3.3'`.
  version: '3.3',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.8143`.
  weight: 0.8143,
  // Property / setting `score` = `0.1324`.
  score: 0.1324,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `63`.
  epoch: 63,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_013` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_013:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_013'`.
  identifier: 'multimodal_06_validation_layer_1_013',
  // Property / setting `name` = `'node_013'`.
  name: 'node_013',
  // Property / setting `version` = `'3.5'`.
  version: '3.5',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.8258`.
  weight: 0.8258,
  // Property / setting `score` = `0.4894`.
  score: 0.4894,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `38`.
  epoch: 38,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_014` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_014:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_014'`.
  identifier: 'multimodal_06_validation_layer_1_014',
  // Property / setting `name` = `'node_014'`.
  name: 'node_014',
  // Property / setting `version` = `'2.5'`.
  version: '2.5',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.7987`.
  weight: 0.7987,
  // Property / setting `score` = `0.991`.
  score: 0.991,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `18`.
  epoch: 18,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_015` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_015:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_015'`.
  identifier: 'multimodal_06_validation_layer_1_015',
  // Property / setting `name` = `'node_015'`.
  name: 'node_015',
  // Property / setting `version` = `'4.6'`.
  version: '4.6',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.4378`.
  weight: 0.4378,
  // Property / setting `score` = `0.0712`.
  score: 0.0712,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `63`.
  epoch: 63,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_016` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_016:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_016'`.
  identifier: 'multimodal_06_validation_layer_1_016',
  // Property / setting `name` = `'node_016'`.
  name: 'node_016',
  // Property / setting `version` = `'2.4'`.
  version: '2.4',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.7754`.
  weight: 0.7754,
  // Property / setting `score` = `0.703`.
  score: 0.703,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `25`.
  epoch: 25,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_017` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_017:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_017'`.
  identifier: 'multimodal_06_validation_layer_1_017',
  // Property / setting `name` = `'node_017'`.
  name: 'node_017',
  // Property / setting `version` = `'1.1'`.
  version: '1.1',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.1158`.
  weight: 0.1158,
  // Property / setting `score` = `0.8286`.
  score: 0.8286,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `29`.
  epoch: 29,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_018` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_018:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_018'`.
  identifier: 'multimodal_06_validation_layer_1_018',
  // Property / setting `name` = `'node_018'`.
  name: 'node_018',
  // Property / setting `version` = `'5.1'`.
  version: '5.1',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.4796`.
  weight: 0.4796,
  // Property / setting `score` = `0.7016`.
  score: 0.7016,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `3`.
  epoch: 3,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_019` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_019:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_019'`.
  identifier: 'multimodal_06_validation_layer_1_019',
  // Property / setting `name` = `'node_019'`.
  name: 'node_019',
  // Property / setting `version` = `'3.4'`.
  version: '3.4',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.2715`.
  weight: 0.2715,
  // Property / setting `score` = `0.3262`.
  score: 0.3262,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `72`.
  epoch: 72,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_020` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_020:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_020'`.
  identifier: 'multimodal_06_validation_layer_1_020',
  // Property / setting `name` = `'node_020'`.
  name: 'node_020',
  // Property / setting `version` = `'1.6'`.
  version: '1.6',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.9903`.
  weight: 0.9903,
  // Property / setting `score` = `0.4741`.
  score: 0.4741,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `24`.
  epoch: 24,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_021` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_021:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_021'`.
  identifier: 'multimodal_06_validation_layer_1_021',
  // Property / setting `name` = `'node_021'`.
  name: 'node_021',
  // Property / setting `version` = `'4.8'`.
  version: '4.8',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.2965`.
  weight: 0.2965,
  // Property / setting `score` = `0.868`.
  score: 0.868,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `49`.
  epoch: 49,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_022` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_022:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_022'`.
  identifier: 'multimodal_06_validation_layer_1_022',
  // Property / setting `name` = `'node_022'`.
  name: 'node_022',
  // Property / setting `version` = `'4.9'`.
  version: '4.9',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.3209`.
  weight: 0.3209,
  // Property / setting `score` = `0.8011`.
  score: 0.8011,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
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

// Create a new node (a data point in the graph) called `n_023` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_023:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_023'`.
  identifier: 'multimodal_06_validation_layer_1_023',
  // Property / setting `name` = `'node_023'`.
  name: 'node_023',
  // Property / setting `version` = `'4.8'`.
  version: '4.8',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.2039`.
  weight: 0.2039,
  // Property / setting `score` = `0.7239`.
  score: 0.7239,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `95`.
  epoch: 95,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_024` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_024:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_024'`.
  identifier: 'multimodal_06_validation_layer_1_024',
  // Property / setting `name` = `'node_024'`.
  name: 'node_024',
  // Property / setting `version` = `'3.8'`.
  version: '3.8',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.7129`.
  weight: 0.7129,
  // Property / setting `score` = `0.2149`.
  score: 0.2149,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `75`.
  epoch: 75,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_025` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_025:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_025'`.
  identifier: 'multimodal_06_validation_layer_1_025',
  // Property / setting `name` = `'node_025'`.
  name: 'node_025',
  // Property / setting `version` = `'3.3'`.
  version: '3.3',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.6428`.
  weight: 0.6428,
  // Property / setting `score` = `0.1905`.
  score: 0.1905,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `88`.
  epoch: 88,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_026` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_026:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_026'`.
  identifier: 'multimodal_06_validation_layer_1_026',
  // Property / setting `name` = `'node_026'`.
  name: 'node_026',
  // Property / setting `version` = `'4.0'`.
  version: '4.0',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.4706`.
  weight: 0.4706,
  // Property / setting `score` = `0.9608`.
  score: 0.9608,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `94`.
  epoch: 94,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_027` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_027:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_027'`.
  identifier: 'multimodal_06_validation_layer_1_027',
  // Property / setting `name` = `'node_027'`.
  name: 'node_027',
  // Property / setting `version` = `'2.3'`.
  version: '2.3',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.3846`.
  weight: 0.3846,
  // Property / setting `score` = `0.646`.
  score: 0.646,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `53`.
  epoch: 53,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_028` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_028:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_028'`.
  identifier: 'multimodal_06_validation_layer_1_028',
  // Property / setting `name` = `'node_028'`.
  name: 'node_028',
  // Property / setting `version` = `'4.2'`.
  version: '4.2',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.1329`.
  weight: 0.1329,
  // Property / setting `score` = `0.8068`.
  score: 0.8068,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `3`.
  epoch: 3,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_029` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_029:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_029'`.
  identifier: 'multimodal_06_validation_layer_1_029',
  // Property / setting `name` = `'node_029'`.
  name: 'node_029',
  // Property / setting `version` = `'4.1'`.
  version: '4.1',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.793`.
  weight: 0.793,
  // Property / setting `score` = `0.9334`.
  score: 0.9334,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `6`.
  epoch: 6,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_030` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_030:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_030'`.
  identifier: 'multimodal_06_validation_layer_1_030',
  // Property / setting `name` = `'node_030'`.
  name: 'node_030',
  // Property / setting `version` = `'3.6'`.
  version: '3.6',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.9978`.
  weight: 0.9978,
  // Property / setting `score` = `0.9552`.
  score: 0.9552,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `29`.
  epoch: 29,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_031` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_031:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_031'`.
  identifier: 'multimodal_06_validation_layer_1_031',
  // Property / setting `name` = `'node_031'`.
  name: 'node_031',
  // Property / setting `version` = `'5.2'`.
  version: '5.2',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.9988`.
  weight: 0.9988,
  // Property / setting `score` = `0.6751`.
  score: 0.6751,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `76`.
  epoch: 76,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_032` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_032:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_032'`.
  identifier: 'multimodal_06_validation_layer_1_032',
  // Property / setting `name` = `'node_032'`.
  name: 'node_032',
  // Property / setting `version` = `'5.2'`.
  version: '5.2',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.386`.
  weight: 0.386,
  // Property / setting `score` = `0.3153`.
  score: 0.3153,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `89`.
  epoch: 89,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_033` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_033:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_033'`.
  identifier: 'multimodal_06_validation_layer_1_033',
  // Property / setting `name` = `'node_033'`.
  name: 'node_033',
  // Property / setting `version` = `'2.2'`.
  version: '2.2',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.9238`.
  weight: 0.9238,
  // Property / setting `score` = `0.1984`.
  score: 0.1984,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
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

// Create a new node (a data point in the graph) called `n_034` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_034:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_034'`.
  identifier: 'multimodal_06_validation_layer_1_034',
  // Property / setting `name` = `'node_034'`.
  name: 'node_034',
  // Property / setting `version` = `'3.4'`.
  version: '3.4',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.5839`.
  weight: 0.5839,
  // Property / setting `score` = `0.6838`.
  score: 0.6838,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `72`.
  epoch: 72,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_035` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_035:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_035'`.
  identifier: 'multimodal_06_validation_layer_1_035',
  // Property / setting `name` = `'node_035'`.
  name: 'node_035',
  // Property / setting `version` = `'1.5'`.
  version: '1.5',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.9746`.
  weight: 0.9746,
  // Property / setting `score` = `0.391`.
  score: 0.391,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `76`.
  epoch: 76,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_036` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_036:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_036'`.
  identifier: 'multimodal_06_validation_layer_1_036',
  // Property / setting `name` = `'node_036'`.
  name: 'node_036',
  // Property / setting `version` = `'4.6'`.
  version: '4.6',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.5801`.
  weight: 0.5801,
  // Property / setting `score` = `0.9991`.
  score: 0.9991,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
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

// Create a new node (a data point in the graph) called `n_037` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_037:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_037'`.
  identifier: 'multimodal_06_validation_layer_1_037',
  // Property / setting `name` = `'node_037'`.
  name: 'node_037',
  // Property / setting `version` = `'3.5'`.
  version: '3.5',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.7082`.
  weight: 0.7082,
  // Property / setting `score` = `0.1132`.
  score: 0.1132,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `57`.
  epoch: 57,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_038` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_038:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_038'`.
  identifier: 'multimodal_06_validation_layer_1_038',
  // Property / setting `name` = `'node_038'`.
  name: 'node_038',
  // Property / setting `version` = `'3.2'`.
  version: '3.2',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.1256`.
  weight: 0.1256,
  // Property / setting `score` = `0.528`.
  score: 0.528,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `92`.
  epoch: 92,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_039` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_039:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_06_validation_layer_1_039'`.
  identifier: 'multimodal_06_validation_layer_1_039',
  // Property / setting `name` = `'node_039'`.
  name: 'node_039',
  // Property / setting `version` = `'3.3'`.
  version: '3.3',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.7104`.
  weight: 0.7104,
  // Property / setting `score` = `0.3405`.
  score: 0.3405,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `42`.
  epoch: 42,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});
