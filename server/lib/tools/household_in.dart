import 'package:common/common.dart';

AffordabilitySlice? householdIn(Map<String, Object?> slices) =>
    switch (slices[affordabilityDataSlice.name]) {
      final Map<String, Object?> json => AffordabilitySlice.fromJson(json),
      _ => null,
    };
