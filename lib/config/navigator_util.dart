import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_todo/config/application.dart';

class NavigatorUtil {
  static Future goAddNew(BuildContext context) {
    return Application.router.navigateTo(context, '/addNew', transition: TransitionType.fadeIn);
  }
}
