import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_todo/page/addNew.dart';
import 'package:flutter_todo/page/home.dart';

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Home();
});

var addNewHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AddNew();
});
