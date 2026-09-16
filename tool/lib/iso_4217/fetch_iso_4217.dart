import 'package:http/http.dart' as http;

final iso4217ListUri = Uri.parse(
  'https://www.six-group.com/dam/download/financial-information/data-center/iso-currrency/lists/list-one.xml',
);

Future<String> fetchIso4217(http.Client client) async {
  final response = await client.get(iso4217ListUri);
  if (response.statusCode != 200) {
    throw http.ClientException(
      'ISO 4217 list returned ${response.statusCode}',
      iso4217ListUri,
    );
  }
  return response.body;
}
