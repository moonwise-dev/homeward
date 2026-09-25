import '../research/research.dart';
import 'agent_tool.dart';
import 'assess_story_tool.dart';
import 'compute_affordability_tool.dart';
import 'estimate_purchase_costs_tool.dart';
import 'get_obstacles_tool.dart';
import 'load_market_tool.dart';
import 'propose_areas_tool.dart';
import 'propose_profile_tool.dart';
import 'propose_scenario_tool.dart';
import 'propose_story_tool.dart';
import 'resolve_market_tool.dart';

const homewardTools = <AgentTool>[
  ResolveMarketTool(),
  LoadMarketTool(),
  ProposeProfileTool(),
  ProposeScenarioTool(),
  ComputeAffordabilityTool(),
  EstimatePurchaseCostsTool(),
  GetObstaclesTool(),
];

List<AgentTool> storyTools(Research research) => [
  ProposeStoryTool(research.nominatim),
  ProposeAreasTool(research.nominatim),
  AssessStoryTool(research.measurer),
];

List<AgentTool> allTools(Research research) => [
  ...storyTools(research),
  ...homewardTools,
];
