import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

db() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    // 设置数据库的路径。注意：使用 `path` 包中的 `join` 方法是
    // 确保在多平台上路径都正确的最佳实践。
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    // 当数据库第一次被创建的时候，创建一个数据表，用以存储狗狗们的数据。
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    // 设置版本。它将执行 onCreate 方法，同时提供数据库升级和降级的路径。
    version: 1,
  );

  return database;
}
