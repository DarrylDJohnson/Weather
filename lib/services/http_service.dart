import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

Future<Map> httpRequest(String request) async {
  final completer = new Completer<Map>();

  Map<String, String> requestHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
  };

  try {
    final uri = Uri.parse("$request");

    final response = await http.get(uri, headers: requestHeaders);

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
