import 'package:homeward_server/research/research.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

final testResearch = Research.open(
  MockClient((request) async => http.Response('[]', 200)),
  userAgent: 'Homeward test',
);
