class ToDo {
  final int id;
  final String name;
  final String type;
  final String done;

  ToDo({this.id, this.name, this.type, this.done});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'done': done,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  // 重写 toString 方法，以便使用 print 方法查看每个狗狗信息的时候能更清晰。
  @override
  String toString() {
    return 'ToDo{id: $id, name: $name, type: $type, done: $done}';
  }
}
