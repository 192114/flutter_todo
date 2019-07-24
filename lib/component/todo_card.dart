import 'package:flutter/material.dart';

class ToDoCard extends StatefulWidget {
  int currentIndex;

  ToDoCard({Key key, this.currentIndex}) : super(key: key);

  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool _checkboxSelected = true; //维护复选框状态
  int currentIndex;
  double cardPadding;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    cardPadding = currentIndex == 0 ? 10.0 : 30.0;
    super.initState();
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
                            child: Text('111'),
                            flex: 1,
                          ),
                          Checkbox(
                              value: _checkboxSelected,
                              activeColor: Colors.grey, //选中时的颜色
                              onChanged: (value) {
                                setState(() {
                                  _checkboxSelected = value;
                                });
                              })
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('111'),
                            flex: 1,
                          ),
                          Checkbox(
                              value: _checkboxSelected,
                              activeColor: Colors.red, //选中时的颜色
                              onChanged: (value) {
                                setState(() {
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
