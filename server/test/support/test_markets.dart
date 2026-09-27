import 'dart:io';

import 'package:homeward_server/markets/load_markets.dart';
import 'package:homeward_server/markets/market_directory.dart';

final testMarkets = MarketDirectory(loadMarkets(Directory('../markets')));
