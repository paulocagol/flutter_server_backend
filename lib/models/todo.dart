import 'package:flutter_server_backend/models/owner.dart';

class Todo {
  int id = 0;
  String task = '';
  Owner? owner;
  ListOwners? listOwner;

  Todo.add({
    this.id = 0,
    this.task = '',
    this.owner,
    this.listOwner,
  });

  Map<String, Map<String, dynamic>> toJson() => {
        'todo': {
          'id': id,
          'task': task,
          'owner': owner?.toJson(),
          'ownerlist': listOwner?.toJson(),
        }
      };

  @override
  String toString() {
    return 'Todo{id: $id, task: $task}';
  }
}
