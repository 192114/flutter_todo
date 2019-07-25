import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final _newToDoController = new TextEditingController();

  String _currentCategory = 'To Do';
  bool _checkboxSelected = false;

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
                                onTap: (){
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
                  },
                ),
              ))
        ],
      ),
    );
  }
}
