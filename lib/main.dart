import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_todo/config/application.dart';
import 'package:flutter_todo/config/routes.dart';
import 'package:sqflite/sqflite.dart';

// https://github.com/xinwii/flutter_sqlite_demo

void main() {
   // 注册 fluro routes
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'TODO',
      theme: ThemeData.light(),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}