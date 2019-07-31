import 'package:flutter/material.dart';
import 'package:flutter_todo/component/todo_card.dart';
import 'package:flutter_todo/component/home_header.dart';
import 'package:flutter_todo/config/navigator_util.dart';

import 'package:sqflite/sqflite.dart';
import 'package:flutter_todo/modal/todo.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _navigateToAddNew(BuildContext context) async {
    var result = await NavigatorUtil.goAddNew(context);
    // print(result);
    fetchDate();
  }

  Future<List<ToDo>> todos() async {
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
          "CREATE TABLE todos(id INTEGER PRIMARY KEY, name TEXT, type TEXT, done TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      // 设置版本。它将执行 onCreate 方法，同时提供数据库升级和降级的路径。
      version: 1,
    );
    // Get a reference to the database (获得数据库引用)
    final Database db = await database;

    // Query the table for all The Dogs (查询数据表，获取所有的狗狗们)
    final List<Map<String, dynamic>> maps = await db.query('todos');

    // Convert the List<Map<String, dynamic> into a List<Dog> (将 List<Map<String, dynamic> 转换成 List<Dog> 数据类型)
    return List.generate(maps.length, (i) {
      return ToDo(
        id: maps[i]['id'],
        name: maps[i]['name'],
        type: maps[i]['type'],
        done: maps[i]['done'],
      );
    });
  }

  fetchDate() async {
    var list = await todos();
    print(list);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 248, 250, 1),
        body: Column(
          children: <Widget>[
            Header(),
            Expanded(
                flex: 1,
                child: RefreshIndicator(
                  onRefresh: () {
                    return _navigateToAddNew(context);
                  },
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoCard(currentIndex: index);
                    },
                  ),
                )),
          ],
        ));
  }
}
