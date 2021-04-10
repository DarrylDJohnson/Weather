import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> httpRequest(String request) async {
  final completer = new Completer<Map>();

  try {
    final uri = Uri.parse("$request");

    final response = await http.get(uri);

    final result = json.decode(response.body);

    response.statusCode == 200
        ? completer.complete(result)
        : completer.completeError("HttpRequest Error: $result.body");
  } catch (e) {
    print(e);

    if (e is http.ClientException) {
      print("ClientException: ${e.message} \t ${e.uri},");
    }
  }

  return completer.future;
}
