import 'package:flutter/material.dart';
// import 'package:flutter_todo/utils/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_todo/modal/todo.dart';
import 'package:path/path.dart';

class AddNew extends StatefulWidget {
  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final _newToDoController = new TextEditingController();

  String _currentCategory = 'To Do';
  bool _checkboxSelected = false;

  Future<void> insertDog(ToDo todo) async {
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      // 设置数据库的路径。注意：使用 `path` 包中的 `join` 方法是
      // 确保在多平台上路径都正确的最佳实践。
      join(await getDatabasesPath(), 'todos_database.db'),
      // When the database is first created, create a table to store dogs.
      // 当数据库第一次被创建的时候，创建一个数据表，用以存储狗狗们的数据。
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE todos(id INTEGER PRIMARY KEY, name TEXT, type TEXT ,done TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      // 设置版本。它将执行 onCreate 方法，同时提供数据库升级和降级的路径。
      version: 1,
    );
    // Get a reference to the database (获得数据库引用)
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    // 在正确的数据表里插入狗狗的数据。我们也要在这个操作中指定 `conflictAlgorithm` 策略。
    // 如果同样的狗狗数据被多次插入，后一次插入的数据将会覆盖之前的数据。
    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  submitTodos(context) async {
    var todo = ToDo(
      id: 0,
      name: '测试',
      type: 'ToDo',
      done: '11',
    );
    await insertDog(todo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 248, 250, 1),
      body: Wrap(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0),
            padding: EdgeInsets.only(top: 60),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Card(
                    elevation: 6.0, // 阴影
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            textInputAction: TextInputAction.done, // 键盘确定按钮显示
                            maxLines: null,
                            maxLength: 24,
                            controller: _newToDoController,
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'I want to ...',
                              hintText: 'I want to ...',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 20.0),
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 10.0, // 主轴边距
                            runSpacing: 10.0, // 副轴边距
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentCategory = 'To Do';
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4.0),
                                  constraints: BoxConstraints(
                                    maxWidth: 100.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: _currentCategory == 'To Do'
                                        ? Colors.blue
                                        : Colors.white,
                                    border: Border.all(
                                        color: Colors.blue,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  child: Text('To Do',
                                      style: TextStyle(
                                          color: _currentCategory == 'To Do'
                                              ? Colors.white
                                              : Colors.blue),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentCategory = 'To Buy';
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4.0),
                                  constraints: BoxConstraints(
                                    maxWidth: 100.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: _currentCategory == 'To Buy'
                                        ? Colors.blue
                                        : Colors.white,
                                    border: Border.all(
                                        color: Colors.blue,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  child: Text('To Buy',
                                      style: TextStyle(
                                          color: _currentCategory == 'To Buy'
                                              ? Colors.white
                                              : Colors.blue),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0, right: 20.0),
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                value: _checkboxSelected,
                                activeColor: Colors.blue, //选中时的颜色
                                onChanged: (value) {
                                  setState(() {
                                    _checkboxSelected = value;
                                  });
                                },
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('Mark As Important'),
                              ),
                              Icon(Icons.alarm_add),
                            ],
                          ),
                        ),
                      ],
                    )),
                Positioned(
                  top: -10.0,
                  left: 20.0,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Center(
                      child: Text(
                        'create',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(20.0),
              child: Center(
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    '添加',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop('我是返回值哦');
                    submitTodos(context);
                  },
                ),
              ))
        ],
      ),
    );
  }
}
