import 'agent_tool.dart';
import 'compute_affordability_tool.dart';
import 'load_market_tool.dart';
import 'propose_profile_tool.dart';
import 'propose_scenario_tool.dart';
import 'resolve_market_tool.dart';

const homewardTools = <AgentTool>[
  ResolveMarketTool(),
  LoadMarketTool(),
  ProposeProfileTool(),
  ProposeScenarioTool(),
  ComputeAffordabilityTool(),
];
