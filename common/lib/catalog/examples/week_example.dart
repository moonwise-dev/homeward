import 'dart:convert';

import '../../geo/geo_point.dart';
import '../../geo/travel_mode.dart';
import '../../week/place.dart';
import '../../week/week_travel.dart';

const _kth = GeoPoint(lat: 59.34978, lng: 18.07092);
const _mum = GeoPoint(lat: 59.36022, lng: 18.00135);

final stockholmWeekDataModel = {
  'places': jsonDecode(
    jsonEncode({
      'kth': const Place(
        id: 'kth',
        name: 'KTH',
        address: 'Kungliga Tekniska högskolan, Valhallavägen, Stockholm',
        point: _kth,
      ).toJson(),
      'mum': const Place(
        id: 'mum',
        name: "Mum's flat in Solna",
        address: 'Råsundavägen, Solna',
        point: _mum,
      ).toJson(),
    }),
  ),
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
              to: _kth,
              perWeek: 5,
              mode: TravelMode.transit,
              minutes: 49,
              meters: 10920,
              polyline:
                  r'se~hJcwxmB}@LBjOuAbFEtCqA`@v@|NJxm@ZbQUl\X|p@_@bK}@jFBlDqG|d@'
                  r'CdFj@hOU~K_AhGeAdC{At@mBi@sDmHmBiBO{CiCwNPQ|ArKqDpG}BfIyBrL]'
                  r'jDa@dX}BxMNPOQqBfJq@vSRvp@iLlFiEh[mAhYk@tEy@p@LdBsErEaMxTyNv'
                  r'LcD~DiHbPeC|DiDdDwCbAsCw@cBoBiHySoGiHiB_Eo@uDWyELeNt@sPWiGkI'
                  r'y`@iCgGqBmBcD_AsDPeQlJyDnDgD|IuH|e@_EaCkB~BWi@cDnFgFfBOy@cA\'
                  r'OgDSF',
            ),
            Trip(
              placeId: 'mum',
              placeName: "Mum's flat in Solna",
              to: _mum,
              perWeek: 1,
              mode: TravelMode.car,
              minutes: 23,
              meters: 13881,
              polyline:
                  r'se~hJcwxmBo@GOb@D|NsAlITzIp@dAUjQd@vj@f@~H`AnGbDdLPnBrA|Az@f'
                  r'E@jIkBpMMzEd@rElCbKLbBr@|AZlEq@dM_@|Bk@p@]`Is@vAOlBXzArAz@xA'
                  r'pClDrJlBxIfDrVl@pOBvGYtBp@hGp@ty@MpA~D~ZaB~C}HzYsBjBsAy@eAbB'
                  r'qOjI]f@g@jKu@hB{vAzj@yWlM{EdFaOb\aEzDMpC`ApIcBzImBbGkP~OoG|D'
                  r'qBjCcBlEmBtJiCzVeBzWaClVaHfd@qAtFqDpG}B|BuDhAyFGcD_CwGqNuIcO'
                  r'i@QwKzWkZp}@aAj@gDvHeAxDcDzSyG~OeJdX|@zBJvBaCZuFzMRl@|@uB',
            ),
          ],
        ).toJson(),
      ),
    ),
  },
};
