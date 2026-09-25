import '../research/open_data/geo_place.dart';
import '../research/open_data/nominatim.dart';
import '../research/open_data/open_data_unavailable.dart';
import '../research/research_steps.dart';
import '../research/step_labels.dart';

Future<GeoPlace?> locatePlace(
  Nominatim nominatim,
  String query,
  String label,
  GeoBox? box,
  ResearchSteps steps,
) => steps.track(locatingLabel(label), () async {
  try {
    return await nominatim.locate(query, within: box);
  } on OpenDataUnavailable {
    return null;
  }
}, measured: (place) => place != null);
