import 'dart:convert';

import 'package:functions_framework/functions_framework.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  var connection = PostgreSQLConnection(
    'localhost',
    5432,
    'postgres',
    username: 'postgres',
    password: 'mysecretpassword',
  );
  await connection.open();

  List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
    'SELECT id, task FROM TODO;',
  );

  // print(json.encode(results));

  return Response.ok(json.encode(results));
}
