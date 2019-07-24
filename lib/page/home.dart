import 'package:flutter/material.dart';
import 'package:flutter_todo/component/todo_card.dart';
import 'package:flutter_todo/component/home_header.dart';
import 'package:flutter_todo/config/navigator_util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future _navigateToAddNew(BuildContext context) async{
    var result = await NavigatorUtil.goAddNew(context);
    print(result);
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
                  onRefresh: (){
                    return _navigateToAddNew(context);
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
