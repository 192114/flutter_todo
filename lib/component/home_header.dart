import 'package:flutter/material.dart';
import 'dart:async';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String yy = '----';
  String mm = '--';
  String dd = '--';
  String hh = '--';
  String mins = '--';

  Timer _timer;

  var monthMap = {
    '1': 'JAN',
    '2': 'FEB',
    '3': 'MAR',
    '4': 'APR',
    '5': 'MAY',
    '6': 'JUN',
    '7': 'JUL',
    '8': 'AUG',
    '9': 'SEP',
    '10': 'OCT',
    '11': 'NOV',
    '12': 'DEC',
  };

  // 时间格式化 自动补0
  String _autoFixed0(String param) {
    return param.length > 1 ? param : '0$param';
  }

  // 数字转为英文月份缩写
  String _numberToEn(String param) {
    return monthMap[param];
  }

  // 获取当前时间
  void _getCurrentDate() {
    DateTime now = new DateTime.now();
    setState(() {
      yy = now.year.toString();
      mm = _numberToEn(now.month.toString());
      dd = _autoFixed0(now.day.toString());
      hh = _autoFixed0(now.hour.toString());
      mins = _autoFixed0(now.minute.toString());
    });
  }

  void _startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);

    var callback = (timer) => _getCurrentDate();

    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  void initState() {
    _getCurrentDate();
    // 启动定时器
    _startCountdownTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.only(left: 30.0, right: 10.0, top: 30.0),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    dd,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.black54,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        mm,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black26,
                        ),
                      ),
                      Text(
                        yy,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black26,
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(right: 30.0, left: 10.0, top: 30.0),
            alignment: Alignment.bottomRight,
            child: Text(
              '$hh:$mins',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
