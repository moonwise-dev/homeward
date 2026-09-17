import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/markets/load_markets.dart';
import 'package:homeward_server/markets/market_directory.dart';
import 'package:homeward_server/tools/agent_tool.dart';

final realMarkets = MarketDirectory(loadMarkets(Directory('../markets')));

ToolContext contextWith({Plan plan = const Plan()}) =>
    ToolContext(markets: realMarkets, plan: plan);
