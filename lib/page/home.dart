import 'package:flutter/material.dart';
import 'package:flutter_todo/component/todo_card.dart';
import 'package:flutter_todo/component/home_header.dart';
import 'package:flutter_todo/config/navigator_util.dart';
import 'package:flutter_todo/modal/db_helper.dart';
import 'package:flutter_todo/modal/todo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = DatabaseHelper();
  List todoList = List();

  Future _navigateToAddNew(BuildContext context) async {
    await NavigatorUtil.goAddNew(context);
    // print(result);
    fetchDate();
  }

  todos() async {
    final List<Map<String, dynamic>> maps = await db.getTotalList();
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
    setState(() {
      todoList = list;
    });
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
                    itemCount: todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoCard(currentIndex: index, currentToDo: todoList[index]);
                    },
                  ),
                )),
          ],
        ));
  }
}
