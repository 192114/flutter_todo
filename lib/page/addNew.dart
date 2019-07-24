import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text('创建任务'),),
      body: Center(child: Text('add new'),),
    );
  }
}