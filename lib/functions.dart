import 'dart:convert';

import 'package:flutter_server_backend/models/owner.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

import 'models/todo.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  // var connection = PostgreSQLConnection(
  //   'localhost',
  //   5432,
  //   'postgres',
  //   username: 'postgres',
  //   password: 'docker',
  //   timeZone: 'America/Sao_Paulo',
  // );
  // await connection.open();

  // PostgreSQLResult resultRow = await connection.query(
  //   "select timestamp_iso8601(now()::timestamptz, 'America/Sao_Paulo') as createdAt from todo",
  // );
  List<Todo> todos;
  todos = [];

  ListOwners ownersList;
  ownersList = ListOwners();

  for (var n = 0; n <= 5; n++) {
    ownersList.owners.add(Owner(
      id: n,
      name: 'TESTE $n',
    ));
  }

  for (var i = 0; i <= 10; i++) {
    todos.add(
      Todo.add(
        id: i,
        task: 'TESTE',
        owner: Owner(id: i, name: 'Paulo'),
        listOwner: ownersList,
      ),
    );
  }

  return Response.ok(jsonEncode(todos));
}
