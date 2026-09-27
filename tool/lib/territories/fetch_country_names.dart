import 'dart:convert';

import 'package:http/http.dart' as http;

const cldrVersion = '48.2.1';

const _excludedTerritories = {'EU', 'EZ', 'UN', 'QO', 'XA', 'XB', 'ZZ'};

Future<Map<String, String>> fetchCountryNames(http.Client client) async {
  final uri = Uri.parse(
    'https://raw.githubusercontent.com/unicode-org/cldr-json/$cldrVersion/'
    'cldr-json/cldr-localenames-full/main/en/territories.json',
  );
  final response = await client.get(uri);
  if (response.statusCode != 200) {
    throw http.ClientException('CLDR returned ${response.statusCode}', uri);
  }
  final json =
      jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
  final names =
      ((((json['main']! as Map<String, Object?>)['en']!
                      as Map<String, Object?>)['localeDisplayNames']!
                  as Map<String, Object?>)['territories']!
              as Map<String, Object?>)
          .cast<String, String>();
  return {
    for (final MapEntry(:key, :value) in names.entries)
      if (RegExp(r'^[A-Z]{2}$').hasMatch(key) &&
          !_excludedTerritories.contains(key))
        key: value,
  };
}
