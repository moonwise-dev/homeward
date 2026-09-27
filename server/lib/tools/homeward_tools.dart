import '../markets/market_directory.dart';
import '../research/research.dart';
import 'agent_tool.dart';
import 'component_docs.dart';
import 'compute_affordability.dart';
import 'find_place.dart';
import 'keep_homes.dart';
import 'measure_week.dart';
import 'search_homes.dart';
import 'update_brief.dart';

List<AgentTool> homewardTools(MarketDirectory markets, Research research) => [
  const ComponentDocs(),
  const UpdateBrief(),
  ComputeAffordability(markets),
  SearchHomes(markets),
  KeepHomes(markets),
  FindPlace(research),
  MeasureWeek(markets, research),
];
