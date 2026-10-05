import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const weekSlice = DataSlice(
  'week',
  "The buyer's week measured with measure_week: an object by starting point, "
      'a sample home or a place ID.',
  [
    SliceField(
      '<from>',
      FieldKind.record,
      'One week: { fromId, fromName, from, trips }. Bind it whole to a '
          'WeeklyTravel, or to the routes of a WeekMap.',
    ),
    SliceField(
      '<from>/trips/<n>',
      FieldKind.record,
      'One trip: { placeName, perWeek, mode, minutes, meters, polyline }, '
          'the route it was measured on as an encoded polyline. Bind it to a '
          'RouteSummary.',
    ),
  ],
  seededBy: 'measure_week',
);
