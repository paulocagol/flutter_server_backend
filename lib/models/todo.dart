class Todo {
  int? id;
  String? task;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? sync;

  Todo.add({
    this.id,
    this.task,
    this.createdAt,
    this.updatedAt,
    this.sync,
  });

  Map<String, Map<String, dynamic>> toJson() => {
        'todo': {
          'id': id,
          'task': task,
          'createdAt': createdAt.toString(),
          'updatedAt': updatedAt.toString(),
          'sync': sync,
        }
      };

  @override
  String toString() {
    return 'Todo{id: $id, task: $task, $task, $createdAt, $updatedAt, $sync}';
  }
}
