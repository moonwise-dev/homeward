import 'dart:convert';

import 'package:http/http.dart' as http;

const cldrVersion = '48.2.1';

typedef Territories = ({
  Map<String, String> countries,
  Map<String, String> subdivisions,
});

const _excludedTerritories = {'EU', 'EZ', 'UN', 'QO', 'XA', 'XB', 'ZZ'};

Future<Territories> fetchTerritories(http.Client client) async {
  final territories = await _json(
    client,
    'cldr-localenames-full/main/en/territories.json',
  );
  final subdivisions = await _json(
    client,
    'cldr-subdivisions-full/subdivisions/en/en.json',
  );
  final territoryNames = _namesAt(territories, const [
    'main',
    'en',
    'localeDisplayNames',
    'territories',
  ]);
  final subdivisionNames = _namesAt(subdivisions, const [
    'subdivisions',
    'localeDisplayNames',
    'subdivisions',
  ]);
  final countries = {
    for (final MapEntry(:key, :value) in territoryNames.entries)
      if (RegExp(r'^[A-Z]{2}$').hasMatch(key) &&
          !_excludedTerritories.contains(key))
        key: value,
  };
  return (
    countries: countries,
    subdivisions: {
      for (final MapEntry(:key, :value) in subdivisionNames.entries)
        if (RegExp(r'^[a-z]{2}[a-z0-9]{1,3}$').hasMatch(key) &&
            countries.containsKey(key.substring(0, 2).toUpperCase()))
          '${key.substring(0, 2).toUpperCase()}-${key.substring(2).toUpperCase()}':
              value,
    },
  );
}

Future<Map<String, Object?>> _json(http.Client client, String path) async {
  final uri = Uri.parse(
    'https://raw.githubusercontent.com/unicode-org/cldr-json/$cldrVersion/cldr-json/$path',
  );
  final response = await client.get(uri);
  if (response.statusCode != 200) {
    throw http.ClientException('$path returned ${response.statusCode}', uri);
  }
  return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
}

Map<String, String> _namesAt(Map<String, Object?> json, List<String> path) {
  Object? current = json;
  for (final key in path) {
    current = (current! as Map<String, Object?>)[key];
  }
  return (current! as Map<String, Object?>).cast<String, String>();
}
