import 'package:flutter/cupertino.dart';
import 'package:flutter_app1_provider/helper/db_helper.dart';
import 'package:flutter_app1_provider/model/modelTask.dart';

class MyProvider extends ChangeNotifier{
  List<Task> allTasks;
  List<Task> completeTasks;
  List<Task> inCompleteTasks;
  String msg = 'aya';
  changeMsg(String newMsg){
    this.msg = newMsg;
    notifyListeners();
  }
  setMsg(msg) {
    this.msg = msg;
    // notifyListeners();
  }
  getAllTasks() async {
    this.allTasks = await DBHelper.dbHelper.getAllTasks();
    this.completeTasks = this.allTasks.where((element) => element.isComplete).toList();
    this.inCompleteTasks = this.allTasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }
  insertTask(Task taskModel) async {
    await DBHelper.dbHelper.insertTask(taskModel);
    getAllTasks();
  }
  deleteTask(Task taskModel) async {
    await DBHelper.dbHelper.deleteTask(taskModel.id);
    getAllTasks();
  }
  updateTask(Task taskModel) async {
    await DBHelper.dbHelper.deleteTask(taskModel.id);
    getAllTasks();
  }
}