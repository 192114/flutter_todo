import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('创建任务'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('返回，并且返回string'),
          onPressed: () {
            // 没有找到fluro返回得方法
            Navigator.of(context).pop('我是返回值哦');
          },
        ),
      ),
    );
  }
}
