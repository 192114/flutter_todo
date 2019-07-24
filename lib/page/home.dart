import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_todo/config/application.dart';
import 'package:flutter_todo/component/todo_card.dart';
import 'package:flutter_todo/component/home_header.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

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
                  onRefresh: (){
                    Application.router.navigateTo(context, "/addNew", transition: TransitionType.fadeIn);
                  },
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoCard(currentIndex: index);
                    },
                  ),
                )),
          ],
        ));
  }
}
