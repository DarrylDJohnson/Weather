import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

Future<Map> httpRequest(String request) async {
  final completer = new Completer<Map>();

  final response = await Client().get(request);

  final result = json.decode(response.body);

  response.statusCode == 200
      ? completer.complete(result)
      : completer.completeError("HttpRequest Error: $result");

  return completer.future;
}
