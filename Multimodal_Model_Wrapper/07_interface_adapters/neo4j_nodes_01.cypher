// LINE-COMMENTS-ADDED
// =============================================================================================
// FLOWERBOX-HEADER
// =============================================================================================
//  1. Program Name               : Multimodal_Model_Wrapper  >  neo4j_nodes_01.cypher
//  2. Program Description        : A Neo4j Cypher script that creates the nodes (the 'dots' /
//                                  entities) of a Neo4j graph database for the 'multimodal
//                                  model wrapper' project (interface adapters area). It is one
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
//                                  - threshold = 0.772
//                                  - maxDepth = 6
//                                  - timeoutSeconds = 103
//                                  - region = 'ap-south'
//                                  - epoch = 39
//                                  - version = '1.5.6'
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
// Set the parameter `threshold` to `0.772`; later lines can use it as $threshold.
:param threshold => 0.772;
// Set the parameter `maxDepth` to `6`; later lines can use it as $maxDepth.
:param maxDepth => 6;
// Set the parameter `timeoutSeconds` to `103`; later lines can use it as $timeoutSeconds.
:param timeoutSeconds => 103;
// Set the parameter `region` to `'ap-south'`; later lines can use it as $region.
:param region => 'ap-south';
// Set the parameter `epoch` to `39`; later lines can use it as $epoch.
:param epoch => 39;
// Set the parameter `version` to `'1.5.6'`; later lines can use it as $version.
:param version => '1.5.6';

// Create a new node (a data point in the graph) called `n_000` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_000:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_000'`.
  identifier: 'multimodal_07_interface_adapters_1_000',
  // Property / setting `name` = `'node_000'`.
  name: 'node_000',
  // Property / setting `version` = `'4.5'`.
  version: '4.5',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.1711`.
  weight: 0.1711,
  // Property / setting `score` = `0.9446`.
  score: 0.9446,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `23`.
  epoch: 23,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_001` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_001:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_001'`.
  identifier: 'multimodal_07_interface_adapters_1_001',
  // Property / setting `name` = `'node_001'`.
  name: 'node_001',
  // Property / setting `version` = `'5.2'`.
  version: '5.2',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.5984`.
  weight: 0.5984,
  // Property / setting `score` = `0.3715`.
  score: 0.3715,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `22`.
  epoch: 22,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_002` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_002:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_002'`.
  identifier: 'multimodal_07_interface_adapters_1_002',
  // Property / setting `name` = `'node_002'`.
  name: 'node_002',
  // Property / setting `version` = `'3.0'`.
  version: '3.0',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.1021`.
  weight: 0.1021,
  // Property / setting `score` = `0.7458`.
  score: 0.7458,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
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

// Create a new node (a data point in the graph) called `n_003` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_003:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_003'`.
  identifier: 'multimodal_07_interface_adapters_1_003',
  // Property / setting `name` = `'node_003'`.
  name: 'node_003',
  // Property / setting `version` = `'1.0'`.
  version: '1.0',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.7231`.
  weight: 0.7231,
  // Property / setting `score` = `0.1959`.
  score: 0.1959,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
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

// Create a new node (a data point in the graph) called `n_004` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_004:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_004'`.
  identifier: 'multimodal_07_interface_adapters_1_004',
  // Property / setting `name` = `'node_004'`.
  name: 'node_004',
  // Property / setting `version` = `'4.8'`.
  version: '4.8',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.48`.
  weight: 0.48,
  // Property / setting `score` = `0.1272`.
  score: 0.1272,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `43`.
  epoch: 43,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_005` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_005:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_005'`.
  identifier: 'multimodal_07_interface_adapters_1_005',
  // Property / setting `name` = `'node_005'`.
  name: 'node_005',
  // Property / setting `version` = `'4.9'`.
  version: '4.9',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.2531`.
  weight: 0.2531,
  // Property / setting `score` = `0.1036`.
  score: 0.1036,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `11`.
  epoch: 11,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_006` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_006:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_006'`.
  identifier: 'multimodal_07_interface_adapters_1_006',
  // Property / setting `name` = `'node_006'`.
  name: 'node_006',
  // Property / setting `version` = `'4.2'`.
  version: '4.2',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.8427`.
  weight: 0.8427,
  // Property / setting `score` = `0.6573`.
  score: 0.6573,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `2`.
  epoch: 2,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_007` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_007:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_007'`.
  identifier: 'multimodal_07_interface_adapters_1_007',
  // Property / setting `name` = `'node_007'`.
  name: 'node_007',
  // Property / setting `version` = `'1.5'`.
  version: '1.5',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `2`.
  priority: 2,
  // Property / setting `weight` = `0.4028`.
  weight: 0.4028,
  // Property / setting `score` = `0.0815`.
  score: 0.0815,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
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

// Create a new node (a data point in the graph) called `n_008` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_008:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_008'`.
  identifier: 'multimodal_07_interface_adapters_1_008',
  // Property / setting `name` = `'node_008'`.
  name: 'node_008',
  // Property / setting `version` = `'4.6'`.
  version: '4.6',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.6257`.
  weight: 0.6257,
  // Property / setting `score` = `0.6215`.
  score: 0.6215,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `75`.
  epoch: 75,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_009` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_009:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_009'`.
  identifier: 'multimodal_07_interface_adapters_1_009',
  // Property / setting `name` = `'node_009'`.
  name: 'node_009',
  // Property / setting `version` = `'5.7'`.
  version: '5.7',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `5`.
  priority: 5,
  // Property / setting `weight` = `0.9095`.
  weight: 0.9095,
  // Property / setting `score` = `0.4406`.
  score: 0.4406,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `77`.
  epoch: 77,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_010` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_010:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_010'`.
  identifier: 'multimodal_07_interface_adapters_1_010',
  // Property / setting `name` = `'node_010'`.
  name: 'node_010',
  // Property / setting `version` = `'3.3'`.
  version: '3.3',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.5157`.
  weight: 0.5157,
  // Property / setting `score` = `0.8036`.
  score: 0.8036,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `68`.
  epoch: 68,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_011` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_011:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_011'`.
  identifier: 'multimodal_07_interface_adapters_1_011',
  // Property / setting `name` = `'node_011'`.
  name: 'node_011',
  // Property / setting `version` = `'5.4'`.
  version: '5.4',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.5788`.
  weight: 0.5788,
  // Property / setting `score` = `0.8521`.
  score: 0.8521,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
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

// Create a new node (a data point in the graph) called `n_012` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_012:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_012'`.
  identifier: 'multimodal_07_interface_adapters_1_012',
  // Property / setting `name` = `'node_012'`.
  name: 'node_012',
  // Property / setting `version` = `'5.8'`.
  version: '5.8',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.9119`.
  weight: 0.9119,
  // Property / setting `score` = `0.5565`.
  score: 0.5565,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
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

// Create a new node (a data point in the graph) called `n_013` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_013:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_013'`.
  identifier: 'multimodal_07_interface_adapters_1_013',
  // Property / setting `name` = `'node_013'`.
  name: 'node_013',
  // Property / setting `version` = `'5.6'`.
  version: '5.6',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.6094`.
  weight: 0.6094,
  // Property / setting `score` = `0.4581`.
  score: 0.4581,
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

// Create a new node (a data point in the graph) called `n_014` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_014:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_014'`.
  identifier: 'multimodal_07_interface_adapters_1_014',
  // Property / setting `name` = `'node_014'`.
  name: 'node_014',
  // Property / setting `version` = `'4.0'`.
  version: '4.0',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.8671`.
  weight: 0.8671,
  // Property / setting `score` = `0.2318`.
  score: 0.2318,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `78`.
  epoch: 78,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_015` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_015:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_015'`.
  identifier: 'multimodal_07_interface_adapters_1_015',
  // Property / setting `name` = `'node_015'`.
  name: 'node_015',
  // Property / setting `version` = `'3.0'`.
  version: '3.0',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.5839`.
  weight: 0.5839,
  // Property / setting `score` = `0.2247`.
  score: 0.2247,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `55`.
  epoch: 55,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_016` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_016:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_016'`.
  identifier: 'multimodal_07_interface_adapters_1_016',
  // Property / setting `name` = `'node_016'`.
  name: 'node_016',
  // Property / setting `version` = `'2.1'`.
  version: '2.1',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `10`.
  priority: 10,
  // Property / setting `weight` = `0.5864`.
  weight: 0.5864,
  // Property / setting `score` = `0.5924`.
  score: 0.5924,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `82`.
  epoch: 82,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_017` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_017:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_017'`.
  identifier: 'multimodal_07_interface_adapters_1_017',
  // Property / setting `name` = `'node_017'`.
  name: 'node_017',
  // Property / setting `version` = `'1.2'`.
  version: '1.2',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.7905`.
  weight: 0.7905,
  // Property / setting `score` = `0.1966`.
  score: 0.1966,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `90`.
  epoch: 90,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_018` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_018:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_018'`.
  identifier: 'multimodal_07_interface_adapters_1_018',
  // Property / setting `name` = `'node_018'`.
  name: 'node_018',
  // Property / setting `version` = `'2.1'`.
  version: '2.1',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.3696`.
  weight: 0.3696,
  // Property / setting `score` = `0.9504`.
  score: 0.9504,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
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

// Create a new node (a data point in the graph) called `n_019` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_019:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_019'`.
  identifier: 'multimodal_07_interface_adapters_1_019',
  // Property / setting `name` = `'node_019'`.
  name: 'node_019',
  // Property / setting `version` = `'3.9'`.
  version: '3.9',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.7528`.
  weight: 0.7528,
  // Property / setting `score` = `0.5237`.
  score: 0.5237,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `41`.
  epoch: 41,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_020` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_020:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_020'`.
  identifier: 'multimodal_07_interface_adapters_1_020',
  // Property / setting `name` = `'node_020'`.
  name: 'node_020',
  // Property / setting `version` = `'1.2'`.
  version: '1.2',
  // Property / setting `status` = `'pending'`.
  status: 'pending',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.4994`.
  weight: 0.4994,
  // Property / setting `score` = `0.8913`.
  score: 0.8913,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `17`.
  epoch: 17,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_021` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_021:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_021'`.
  identifier: 'multimodal_07_interface_adapters_1_021',
  // Property / setting `name` = `'node_021'`.
  name: 'node_021',
  // Property / setting `version` = `'1.0'`.
  version: '1.0',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.2704`.
  weight: 0.2704,
  // Property / setting `score` = `0.1205`.
  score: 0.1205,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `68`.
  epoch: 68,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_022` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_022:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_022'`.
  identifier: 'multimodal_07_interface_adapters_1_022',
  // Property / setting `name` = `'node_022'`.
  name: 'node_022',
  // Property / setting `version` = `'3.5'`.
  version: '3.5',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.728`.
  weight: 0.728,
  // Property / setting `score` = `0.071`.
  score: 0.071,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `18`.
  epoch: 18,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_023` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_023:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_023'`.
  identifier: 'multimodal_07_interface_adapters_1_023',
  // Property / setting `name` = `'node_023'`.
  name: 'node_023',
  // Property / setting `version` = `'2.2'`.
  version: '2.2',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.572`.
  weight: 0.572,
  // Property / setting `score` = `0.736`.
  score: 0.736,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `93`.
  epoch: 93,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_024` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_024:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_024'`.
  identifier: 'multimodal_07_interface_adapters_1_024',
  // Property / setting `name` = `'node_024'`.
  name: 'node_024',
  // Property / setting `version` = `'5.7'`.
  version: '5.7',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.5773`.
  weight: 0.5773,
  // Property / setting `score` = `0.4859`.
  score: 0.4859,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `50`.
  epoch: 50,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_025` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_025:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_025'`.
  identifier: 'multimodal_07_interface_adapters_1_025',
  // Property / setting `name` = `'node_025'`.
  name: 'node_025',
  // Property / setting `version` = `'1.6'`.
  version: '1.6',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.5074`.
  weight: 0.5074,
  // Property / setting `score` = `0.7737`.
  score: 0.7737,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
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

// Create a new node (a data point in the graph) called `n_026` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_026:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_026'`.
  identifier: 'multimodal_07_interface_adapters_1_026',
  // Property / setting `name` = `'node_026'`.
  name: 'node_026',
  // Property / setting `version` = `'5.1'`.
  version: '5.1',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.6877`.
  weight: 0.6877,
  // Property / setting `score` = `0.0022`.
  score: 0.0022,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'experimental'`.
  mode: 'experimental',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `98`.
  epoch: 98,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_027` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_027:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_027'`.
  identifier: 'multimodal_07_interface_adapters_1_027',
  // Property / setting `name` = `'node_027'`.
  name: 'node_027',
  // Property / setting `version` = `'4.8'`.
  version: '4.8',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.8519`.
  weight: 0.8519,
  // Property / setting `score` = `0.7843`.
  score: 0.7843,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `64`.
  epoch: 64,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_028` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_028:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_028'`.
  identifier: 'multimodal_07_interface_adapters_1_028',
  // Property / setting `name` = `'node_028'`.
  name: 'node_028',
  // Property / setting `version` = `'5.6'`.
  version: '5.6',
  // Property / setting `status` = `'degraded'`.
  status: 'degraded',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.2355`.
  weight: 0.2355,
  // Property / setting `score` = `0.6649`.
  score: 0.6649,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
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

// Create a new node (a data point in the graph) called `n_029` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_029:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_029'`.
  identifier: 'multimodal_07_interface_adapters_1_029',
  // Property / setting `name` = `'node_029'`.
  name: 'node_029',
  // Property / setting `version` = `'1.1'`.
  version: '1.1',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `3`.
  priority: 3,
  // Property / setting `weight` = `0.7695`.
  weight: 0.7695,
  // Property / setting `score` = `0.9645`.
  score: 0.9645,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `12`.
  epoch: 12,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_030` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_030:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_030'`.
  identifier: 'multimodal_07_interface_adapters_1_030',
  // Property / setting `name` = `'node_030'`.
  name: 'node_030',
  // Property / setting `version` = `'3.1'`.
  version: '3.1',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.5523`.
  weight: 0.5523,
  // Property / setting `score` = `0.0861`.
  score: 0.0861,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
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

// Create a new node (a data point in the graph) called `n_031` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_031:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_031'`.
  identifier: 'multimodal_07_interface_adapters_1_031',
  // Property / setting `name` = `'node_031'`.
  name: 'node_031',
  // Property / setting `version` = `'1.0'`.
  version: '1.0',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `1`.
  priority: 1,
  // Property / setting `weight` = `0.8013`.
  weight: 0.8013,
  // Property / setting `score` = `0.7197`.
  score: 0.7197,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
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

// Create a new node (a data point in the graph) called `n_032` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_032:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_032'`.
  identifier: 'multimodal_07_interface_adapters_1_032',
  // Property / setting `name` = `'node_032'`.
  name: 'node_032',
  // Property / setting `version` = `'2.7'`.
  version: '2.7',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.6121`.
  weight: 0.6121,
  // Property / setting `score` = `0.1182`.
  score: 0.1182,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `78`.
  epoch: 78,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_033` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_033:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_033'`.
  identifier: 'multimodal_07_interface_adapters_1_033',
  // Property / setting `name` = `'node_033'`.
  name: 'node_033',
  // Property / setting `version` = `'3.2'`.
  version: '3.2',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `6`.
  priority: 6,
  // Property / setting `weight` = `0.7894`.
  weight: 0.7894,
  // Property / setting `score` = `0.994`.
  score: 0.994,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'strict'`.
  mode: 'strict',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `64`.
  epoch: 64,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_034` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_034:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_034'`.
  identifier: 'multimodal_07_interface_adapters_1_034',
  // Property / setting `name` = `'node_034'`.
  name: 'node_034',
  // Property / setting `version` = `'1.6'`.
  version: '1.6',
  // Property / setting `status` = `'completed'`.
  status: 'completed',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.989`.
  weight: 0.989,
  // Property / setting `score` = `0.6521`.
  score: 0.6521,
  // Property / setting `tier` = `'secondary'`.
  tier: 'secondary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `23`.
  epoch: 23,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_035` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_035:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_035'`.
  identifier: 'multimodal_07_interface_adapters_1_035',
  // Property / setting `name` = `'node_035'`.
  name: 'node_035',
  // Property / setting `version` = `'5.2'`.
  version: '5.2',
  // Property / setting `status` = `'failed'`.
  status: 'failed',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.8891`.
  weight: 0.8891,
  // Property / setting `score` = `0.2625`.
  score: 0.2625,
  // Property / setting `tier` = `'tertiary'`.
  tier: 'tertiary',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_0'`.
  category: 'category_0',
  // Property / setting `region` = `'eu-west'`.
  region: 'eu-west',
  // Property / setting `epoch` = `45`.
  epoch: 45,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_036` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_036:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_036'`.
  identifier: 'multimodal_07_interface_adapters_1_036',
  // Property / setting `name` = `'node_036'`.
  name: 'node_036',
  // Property / setting `version` = `'1.3'`.
  version: '1.3',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `4`.
  priority: 4,
  // Property / setting `weight` = `0.8395`.
  weight: 0.8395,
  // Property / setting `score` = `0.9331`.
  score: 0.9331,
  // Property / setting `tier` = `'primary'`.
  tier: 'primary',
  // Property / setting `mode` = `'relaxed'`.
  mode: 'relaxed',
  // Property / setting `category` = `'category_1'`.
  category: 'category_1',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `11`.
  epoch: 11,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_037` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_037:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_037'`.
  identifier: 'multimodal_07_interface_adapters_1_037',
  // Property / setting `name` = `'node_037'`.
  name: 'node_037',
  // Property / setting `version` = `'2.4'`.
  version: '2.4',
  // Property / setting `status` = `'recovered'`.
  status: 'recovered',
  // Property / setting `priority` = `7`.
  priority: 7,
  // Property / setting `weight` = `0.5557`.
  weight: 0.5557,
  // Property / setting `score` = `0.1205`.
  score: 0.1205,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_2'`.
  category: 'category_2',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `46`.
  epoch: 46,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_038` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_038:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_038'`.
  identifier: 'multimodal_07_interface_adapters_1_038',
  // Property / setting `name` = `'node_038'`.
  name: 'node_038',
  // Property / setting `version` = `'4.9'`.
  version: '4.9',
  // Property / setting `status` = `'active'`.
  status: 'active',
  // Property / setting `priority` = `8`.
  priority: 8,
  // Property / setting `weight` = `0.352`.
  weight: 0.352,
  // Property / setting `score` = `0.5704`.
  score: 0.5704,
  // Property / setting `tier` = `'edge'`.
  tier: 'edge',
  // Property / setting `mode` = `'shadow'`.
  mode: 'shadow',
  // Property / setting `category` = `'category_3'`.
  category: 'category_3',
  // Property / setting `region` = `'ap-south'`.
  region: 'ap-south',
  // Property / setting `epoch` = `78`.
  epoch: 78,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = false (no).
  active: false
// End of this node's properties and end of the statement.
});

// Create a new node (a data point in the graph) called `n_039` with the label(s) `Multimodal,
// Node`. Its properties are listed below.
CREATE (n_039:Multimodal:Node {
  // Property / setting `identifier` = `'multimodal_07_interface_adapters_1_039'`.
  identifier: 'multimodal_07_interface_adapters_1_039',
  // Property / setting `name` = `'node_039'`.
  name: 'node_039',
  // Property / setting `version` = `'1.9'`.
  version: '1.9',
  // Property / setting `status` = `'stable'`.
  status: 'stable',
  // Property / setting `priority` = `9`.
  priority: 9,
  // Property / setting `weight` = `0.2277`.
  weight: 0.2277,
  // Property / setting `score` = `0.0237`.
  score: 0.0237,
  // Property / setting `tier` = `'backup'`.
  tier: 'backup',
  // Property / setting `mode` = `'safe'`.
  mode: 'safe',
  // Property / setting `category` = `'category_4'`.
  category: 'category_4',
  // Property / setting `region` = `'us-east'`.
  region: 'us-east',
  // Property / setting `epoch` = `39`.
  epoch: 39,
  // Property / setting `createdAt` = the current date and time.
  createdAt: datetime(),
  // Property / setting `active` = true (yes).
  active: true
// End of this node's properties and end of the statement.
});
