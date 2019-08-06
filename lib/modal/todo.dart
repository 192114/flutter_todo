class ToDo {
  int id;
  String name;
  String type;
  String done;

  ToDo({this.id, this.name, this.type, this.done});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'done': done,
    };
  }

  static ToDo fromMap(Map<String, dynamic> map) {
    ToDo user = new ToDo();
    user.name = map['name'];
    user.type = map['type'];
    user.done = map['done'];
    user.id = map['id'];
    return user;
  }

  @override
  String toString() {
    return 'ToDo{id: $id, name: $name, type: $type, done: $done}';
  }
}
