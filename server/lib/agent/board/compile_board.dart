import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';

import '../../markets/market_directory.dart';

typedef BoardSection = ({
  String id,
  String component,
  bool scenario,
  String? change,
});

List<Map<String, Object?>> compileBoard({
  required Plan plan,
  required MarketDirectory markets,
}) {
  final marketId = plan.marketId;
  if (marketId == null) {
    return const [];
  }
  final market = markets.resolveFor(marketId, plan.profile);
  final scenario = plan.scenario;
  final sections = <BoardSection>[
    (
      id: 'market',
      component: 'MarketSnapshotCard',
      scenario: false,
      change: 'market',
    ),
    if (market != null && scenario != null) ...[
      (
        id: 'affordability',
        component: 'AffordabilitySummary',
        scenario: true,
        change: 'scenario',
      ),
      (
        id: 'payment',
        component: 'PaymentBreakdown',
        scenario: true,
        change: null,
      ),
      (
        id: 'costs',
        component: 'PurchaseCostsTable',
        scenario: true,
        change: null,
      ),
      (
        id: 'eligibility',
        component: 'EligibilityChecklist',
        scenario: true,
        change: null,
      ),
    ],
    if (market != null && market.obstacles.isNotEmpty)
      (
        id: 'obstacles',
        component: 'ForeignBuyerObstacles',
        scenario: false,
        change: null,
      ),
  ];
  final slices = <String, Object?>{
    'market':
        market?.toJson() ??
        MarketSnapshot(
          id: marketId,
          name: markets.nameOf(marketId),
          coverage: markets.coverageOf(marketId),
        ).toJson(),
    'profile': plan.profile.toJson(),
    if (scenario != null) 'scenario': scenario.toJson(),
    'selection': {'candidates': markets.curatedCandidates},
  };
  return [
    CreateSurfaceMessage(
      surfaceId: InlineSurfaces.boardId,
      catalogId: homewardCatalogId,
      sendDataModel: true,
    ).toJson(),
    for (final MapEntry(key: slice, value: value) in slices.entries)
      UpdateDataModelMessage(
        surfaceId: InlineSurfaces.boardId,
        path: '/$slice',
        value: value,
      ).toJson(),
    UpdateComponentsMessage(
      surfaceId: InlineSurfaces.boardId,
      components: [
        {
          'id': 'root',
          'component': 'Column',
          'children': [for (final section in sections) '${section.id}-card'],
        },
        for (final section in sections) ..._card(section),
      ],
    ).toJson(),
  ];
}

List<Map<String, Object?>> _card(BoardSection section) => [
  {
    'id': '${section.id}-card',
    'component': 'Card',
    'child': '${section.id}-body',
  },
  {
    'id': '${section.id}-body',
    'component': 'Column',
    'children': [
      section.id,
      if (section.change != null) '${section.id}-change',
    ],
  },
  {
    'id': section.id,
    'component': section.component,
    if (section.scenario) 'scenario': const {'path': '/scenario'},
    'market': const {'path': '/market'},
    'profile': const {'path': '/profile'},
  },
  if (section.change case final decision?) ...[
    {
      'id': '${section.id}-change',
      'component': 'Button',
      'child': '${section.id}-change-label',
      'variant': 'borderless',
      'action': {
        'event': {
          'name': SurfaceAction.change.wireName,
          'context': {'section': decision},
        },
      },
    },
    {
      'id': '${section.id}-change-label',
      'component': 'Text',
      'text': 'Change $decision',
    },
  ],
];
