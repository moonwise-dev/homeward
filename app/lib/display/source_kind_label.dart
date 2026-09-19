import 'package:common/common.dart';

String sourceKindLabel(SourceKind kind) => switch (kind) {
  SourceKind.law => 'Law',
  SourceKind.regulator => 'Regulator',
  SourceKind.taxAuthority => 'Tax authority',
  SourceKind.officialStatistics => 'Official statistics',
  SourceKind.lenderNorm => 'Lender norm',
  SourceKind.secondary => 'Secondary source',
};
