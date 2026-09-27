import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'component_docs.dart';
import 'compute_affordability.dart';
import 'update_brief.dart';

List<AgentTool> homewardTools(MarketDirectory markets) => [
  const ComponentDocs(),
  const UpdateBrief(),
  ComputeAffordability(markets),
];
