import '../markets/market_directory.dart';
import '../research/listing_reader.dart';
import '../research/research.dart';
import 'agent_tool.dart';
import 'compare_buy_rent.dart';
import 'component_docs.dart';
import 'compute_affordability.dart';
import 'find_place.dart';
import 'keep_homes.dart';
import 'look_up_market.dart';
import 'measure_week.dart';
import 'plan_savings.dart';
import 'read_listings.dart';
import 'search_homes.dart';
import 'split_rent.dart';
import 'update_brief.dart';

List<AgentTool> homewardTools(MarketDirectory markets, Research research) => [
  const ComponentDocs(),
  const UpdateBrief(),
  LookUpMarket(markets),
  ComputeAffordability(markets),
  PlanSavings(markets),
  SearchHomes(markets),
  KeepHomes(markets),
  ReadListings(markets, ListingReader()),
  FindPlace(research),
  MeasureWeek(markets, research),
  SplitRent(markets),
  CompareBuyRent(markets),
];
