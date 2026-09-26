import 'package:common/common.dart';

import '../probe/probe_surfaces.dart';

final class SimulatedBuyer {
  const SimulatedBuyer(this.facts, {required this.photo});

  final Map<String, Object?> facts;
  final Photo? Function(String id) photo;

  ProbeAction? answer(ProbeSurface surface) {
    for (final component in surface.components) {
      final answered = switch (component['component']) {
        'Hunch' => _hunch(component),
        'PhotoLineup' => _lineup(component, surface.data),
        'TradeOff' => _tradeOff(component, surface.data),
        'HomeSwipe' => _swipe(surface.data),
        _ => null,
      };
      if (answered != null) {
        return _action(surface, component, answered, surface.data);
      }
    }
    for (final component in surface.components) {
      if (component
          case {
            'component': 'Button',
            'action': {
              'event': {
                'name': 'answer',
                'context': final Map<String, Object?> context,
              },
            },
          }
          when context['facet'] == CaseFacet.household.name ||
              context['facet'] == CaseFacet.routine.name) {
        final story = surface.data['story'] as Map<String, Object?>? ?? {};
        final household = context['facet'] == CaseFacet.household.name;
        return (
          action: ClientAction(
            name: 'answer',
            surfaceId: surface.surfaceId,
            sourceComponentId: component['id']! as String,
            context: {
              ...context,
              'label': household ? 'That is us' : 'That is my week',
            },
          ),
          surfaceData: {
            ...surface.data,
            'story': {
              ...story,
              if (household) ...{
                'adults': facts['adults'] ?? 1,
                'childAges': facts['childAges'] ?? const <int>[],
              } else
                'routine': _routine(story['routine']),
            },
          },
        );
      }
    }
    return null;
  }

  ProbeAction _action(
    ProbeSurface surface,
    Map<String, Object?> component,
    Map<String, Object?> context,
    Map<String, Object?> data,
  ) => (
    action: ClientAction(
      name: 'answer',
      surfaceId: surface.surfaceId,
      sourceComponentId: component['id']! as String,
      context: context,
    ),
    surfaceData: data,
  );

  Map<String, Object?>? _swipe(Map<String, Object?> data) {
    final homes = [
      for (final home
          in (data['swipe'] as Map<String, Object?>?)?['homes']
                  as List<Object?>? ??
              const [])
        if (home is Map<String, Object?>) home,
    ];
    if (homes.isEmpty) {
      return null;
    }
    bool wanted(Map<String, Object?> home) =>
        (facts['homeType'] == null || home['homeType'] == facts['homeType']) &&
        (facts['outdoor'] == null ||
            OutdoorSpace.values
                .byName('${home['outdoor']}')
                .satisfies(OutdoorSpace.values.byName('${facts['outdoor']}')));
    final kept = [
      for (final home in homes)
        if (wanted(home)) home['id']! as String,
    ];
    return {
      'facet': CaseFacet.swipe.name,
      'value': kept.join(','),
      'label': 'Kept ${kept.length} of ${homes.length}',
      'kept': kept,
      'passed': [
        for (final home in homes)
          if (!kept.contains(home['id'])) home['id']! as String,
      ],
    };
  }

  List<Object?> _routine(Object? seeded) {
    final places = [
      for (final place in seeded as List<Object?>? ?? const [])
        if (place is Map<String, Object?>) place,
    ];
    final wanted = [
      for (final place in facts['routine'] as List<Object?>? ?? const [])
        if (place is Map<String, Object?>) place,
    ];
    bool same(Map<String, Object?> place, Map<String, Object?> fact) =>
        '${place['label']}'.toLowerCase().contains(
          '${fact['label']}'.toLowerCase(),
        );
    return [
      for (final place in places)
        {
          ...place,
          'perWeek':
              wanted
                  .where((fact) => same(place, fact))
                  .firstOrNull?['perWeek'] ??
              place['perWeek'],
        },
      for (final (index, fact) in wanted.indexed)
        if (!places.any((place) => same(place, fact)) && fact['point'] != null)
          {
            'id': 'r${index + 1}',
            'label': fact['label'],
            'perWeek': fact['perWeek'] ?? 1,
            'pin': fact['point'],
          },
    ];
  }

  Map<String, Object?>? _hunch(Map<String, Object?> component) {
    final facet = component['facet'] as String?;
    final options = [
      for (final option in component['options'] as List<Object?>? ?? const [])
        if (option is Map<String, Object?>) option,
    ];
    if (facet == null || options.isEmpty) {
      return null;
    }
    final wanted = facts[facet];
    Map<String, Object?> chosen = options.first;
    if (facet == CaseFacet.place.name && wanted is String) {
      final named = options.where(
        (option) => '${option['label']} ${option['value']}'
            .toLowerCase()
            .contains(wanted.toLowerCase()),
      );
      final pin = options.where((option) => option['pin'] == true);
      if (named.isNotEmpty) {
        chosen = named.first;
      } else if (pin.isNotEmpty && facts['placePoint'] is Map) {
        return {
          'facet': facet,
          'value': '',
          'label': wanted,
          'pin': facts['placePoint'],
        };
      }
    } else if (facet == CaseFacet.needs.name) {
      final needs = {
        for (final need in wanted as List<Object?>? ?? const []) '$need',
      };
      int overlap(Map<String, Object?> option) {
        final offered = {
          for (final need
              in HomeNeed.parse(option['value']) ?? const <HomeNeed>[])
            need.name,
        };
        return offered.intersection(needs).length * 2 -
            offered.difference(needs).length -
            needs.difference(offered).length;
      }

      chosen = ([
        ...options,
      ]..sort((a, b) => overlap(b).compareTo(overlap(a)))).first;
    } else if (wanted is num) {
      num gap(Map<String, Object?> option) =>
          ((num.tryParse('${option['value']}') ?? 1e9) - wanted).abs();
      chosen = ([...options]..sort((a, b) => gap(a).compareTo(gap(b)))).first;
    } else if (wanted != null) {
      chosen = options.firstWhere(
        (option) => option['value'] == '$wanted',
        orElse: () => options.first,
      );
    }
    return {
      'facet': facet,
      'value': '${chosen['value']}',
      'label': chosen['label'],
    };
  }

  Map<String, Object?>? _lineup(
    Map<String, Object?> component,
    Map<String, Object?> data,
  ) {
    final path = (component['photos'] as Map<String, Object?>?)?['path'];
    if (path is! String) {
      return null;
    }
    final photos = [
      for (final item in _at(data, path) as List<Object?>? ?? const [])
        if (item case {'id': final String id, 'caption': final String caption})
          (id: id, caption: caption),
    ];
    if (photos.isEmpty) {
      return null;
    }
    int fit(String id) {
      final traits = photo(id)?.traits ?? const PhotoTraits();
      return [
        traits.homeType?.name == facts['homeType'],
        traits.outdoor?.name == facts['outdoor'],
        traits.style?.name == facts['style'],
        traits.areaIds.any(_areas.contains),
        traits.areaIds.any(_areas.contains),
      ].where((matches) => matches).length;
    }

    final best = [...photos]..sort((a, b) => fit(b.id).compareTo(fit(a.id)));
    return {
      'facet': CaseFacet.photo.name,
      'value': best.first.id,
      'label': best.first.caption,
    };
  }

  Map<String, Object?>? _tradeOff(
    Map<String, Object?> component,
    Map<String, Object?> data,
  ) {
    final options = [
      for (final item
          in _at(data, '/tradeoff/options') as List<Object?>? ?? const [])
        if (item is Map<String, Object?>) item,
    ];
    if (options.isEmpty) {
      return null;
    }
    int fit(Map<String, Object?> option) =>
        (_areas.contains(option['areaId']) ? 2 : 0) +
        (option['homeType'] == facts['homeType'] ? 1 : 0);
    final best = [...options]..sort((a, b) => fit(b).compareTo(fit(a)));
    return {
      'facet': CaseFacet.area.name,
      'value': best.first['id'],
      'label': '${best.first['homeType']} in ${best.first['areaName']}',
    };
  }

  List<Object?> get _areas => facts['areas'] as List<Object?>? ?? const [];

  Object? _at(Map<String, Object?> data, String path) {
    Object? current = data;
    for (final segment in path.split('/').skip(1)) {
      current = current is Map<String, Object?> ? current[segment] : null;
    }
    return current;
  }
}
