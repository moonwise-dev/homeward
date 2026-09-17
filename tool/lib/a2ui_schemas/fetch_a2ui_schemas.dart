import 'package:http/http.dart' as http;

const a2uiSpecCommit = '11894222949ef5418096fe0adf537d23e2358754';

typedef A2uiSchemaFile = ({String constant, String path});

const a2uiSchemaFiles = <A2uiSchemaFile>[
  (
    constant: 'a2uiCommonTypesJson',
    path: 'specification/v0_9/json/common_types.json',
  ),
  (
    constant: 'a2uiBasicCatalogJson',
    path: 'specification/v0_9/catalogs/basic/catalog.json',
  ),
];

Future<Map<A2uiSchemaFile, String>> fetchA2uiSchemas(http.Client client) async {
  final contents = <A2uiSchemaFile, String>{};
  for (final file in a2uiSchemaFiles) {
    final uri = Uri.parse(
      'https://raw.githubusercontent.com/a2ui-project/a2ui/$a2uiSpecCommit/${file.path}',
    );
    final response = await client.get(uri);
    if (response.statusCode != 200) {
      throw http.ClientException(
        '${file.path} returned ${response.statusCode}',
        uri,
      );
    }
    contents[file] = response.body;
  }
  return contents;
}
