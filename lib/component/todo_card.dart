import 'package:flutter/material.dart';
import 'package:flutter_todo/modal/db_helper.dart';
import 'package:flutter_todo/modal/todo.dart';

class ToDoCard extends StatefulWidget {
  int currentIndex;
  var currentToDo;

  ToDoCard({Key key, this.currentIndex, this.currentToDo}) : super(key: key);

  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  var db = DatabaseHelper();

  bool _checkboxSelected = true; //维护复选框状态
  int currentIndex;
  double cardPadding;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    cardPadding = currentIndex == 0 ? 10.0 : 30.0;
    _checkboxSelected = widget.currentToDo.done == '1';
    super.initState();
  }

  updateItem(value) async {
    var todo = ToDo(
      id: widget.currentToDo.id,
      name: widget.currentToDo.name,
      type: widget.currentToDo.type,
      done: value ? '1' : '0',
    );
    await db.updateItem(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      padding: EdgeInsets.only(top: cardPadding),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
              elevation: 6.0, // 阴影
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(widget.currentToDo.name),
                            flex: 1,
                          ),
                          Checkbox(
                              value: _checkboxSelected,
                              activeColor: Colors.grey, //选中时的颜色
                              onChanged: (value) {
                                setState(() {
                                  updateItem(value);
                                  _checkboxSelected = value;
                                });
                              })
                        ],
                      ),
                    ],
                  ))),
          Positioned(
            top: -10.0,
            left: 20.0,
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Center(
                child: Text(
                  'TODO',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
