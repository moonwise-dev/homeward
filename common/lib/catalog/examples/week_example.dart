import 'dart:convert';

import '../../geo/geo_point.dart';
import '../../geo/travel_mode.dart';
import '../../week/week_travel.dart';

final stockholmWeekDataModel = {
  'week': {
    'sto-12': jsonDecode(
      jsonEncode(
        const WeekTravel(
          fromId: 'sto-12',
          fromName: 'Järla Gårdsväg 12, Nacka',
          from: GeoPoint(lat: 59.3060154, lng: 18.1542551),
          trips: [
            Trip(
              placeId: 'kth',
              placeName: 'KTH',
              to: GeoPoint(lat: 59.3498, lng: 18.0707),
              perWeek: 5,
              mode: TravelMode.transit,
              minutes: 34,
              meters: 10400,
            ),
            Trip(
              placeId: 'mum',
              placeName: "Mum's flat in Solna",
              to: GeoPoint(lat: 59.3600, lng: 18.0009),
              perWeek: 1,
              mode: TravelMode.car,
              minutes: 24,
              meters: 18900,
            ),
          ],
        ).toJson(),
      ),
    ),
  },
};
