import 'package:shelf/shelf.dart';

import '../http/json_response.dart';

Response healthHandler(Request request) => jsonResponse(200, {'status': 'ok'});
