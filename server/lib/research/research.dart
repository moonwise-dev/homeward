import 'package:http/http.dart' as http;

import 'open_data/nominatim.dart';
import 'open_data/overpass.dart';
import 'open_data/polite_client.dart';
import 'open_data/research_cache.dart';
import 'open_data/routing.dart';
import 'story_measurer.dart';

final class Research {
  Research({
    required this.nominatim,
    required this.measurer,
    required this.routing,
  });

  factory Research.open(
    http.Client client, {
    required String userAgent,
    ResearchCache cache = const NoResearchCache(),
  }) {
    final polite = PoliteClient(client, userAgent: userAgent, store: cache);
    final routing = Routing(polite);
    return Research(
      nominatim: Nominatim(polite),
      measurer: StoryMeasurer(overpass: Overpass(polite), routing: routing),
      routing: routing,
    );
  }

  final Nominatim nominatim;
  final StoryMeasurer measurer;
  final Routing routing;
}
