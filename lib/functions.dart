import 'dart:convert';

import 'package:flutter_server_backend/models/owner.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';

import 'models/todo.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  var connection = PostgreSQLConnection(
    'localhost',
    5432,
    'postgres',
    username: 'postgres',
    password: 'docker',
    timeZone: 'America/Sao_Paulo',
  );
  await connection.open();
  var resultRow = await connection.query('select * from todo');
  await connection.close();
  List<Todo> todos;
  todos = [];
  for (var row in resultRow) {
    todos.add(
      Todo.add(
        id: row[0],
        task: row[1],
        createdAt: row[2],
        updatedAt: row[3],
        sync: row[4],
      ),
    );
  }

  return Response.ok(jsonEncode(todos));
}
