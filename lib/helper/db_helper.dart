import 'dart:io';
import 'package:flutter_app1_provider/model/modelTask.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  static final String dbaseName = 'tasksDb.db';
  static final String tableName = 'Tasks';
  static final String idColumnName = 'tasksDb.db';
  static final String nameColumnName = 'tasksDb.db';
  static final String isCompleteColumnName = 'tasksDb.db';
  Database database;
  initDatabase() async {
    database = await getDatabaseConnection();
  }
  Future<Database> getDatabaseConnection() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/dbaseName';
    Database database = await openDatabase(path,
        onOpen: (database){
          print('the database has been opened');
        },
        onCreate: (db,v){
          print('the database has been created');
          db.execute('''CREATE TABLE Tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, value INTEGER,isComplete INTEGER, num REAL)');
  Dart Packages''');
        }
    );
    return database;
  }

  insertTask(Task taskModel) async {
    int rowNum = await database.insert(tableName, taskModel.toJson());
    print(rowNum);
  }

  Future<List<Task>> getAllTasks() async{
    List<Map<String,Object>> results = await database.query(tableName);
    List<Task> tasks = results.map((e) {
      return Task.fromJson(e);
    }).toList();
    return tasks;
  }

  deleteTask(int id) async {
    database.delete(tableName,where: 'id=?' , whereArgs: [id]);
  }
  updateTask(Task taskModel) async {
    database.update(tableName, taskModel.toJson(),
        where: 'id=?',whereArgs: [taskModel.id]);
  }

}

