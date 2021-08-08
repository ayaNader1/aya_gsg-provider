import 'package:flutter_app1_provider/helper/db_helper.dart';

class Task{
  int id;
  String taskName;
  bool isComplete;
  Task(this.taskName , this.isComplete, [this.id]);
  Task.fromJson(Map map){
    this.id = map[DBHelper.idColumnName];
    this.taskName = map[DBHelper.nameColumnName];
    this.isComplete = map[DBHelper.isCompleteColumnName] == 1?true:false;
  }
  toJson() {
    return {
      DBHelper.idColumnName : this.id,
      DBHelper.nameColumnName : this.taskName,
      DBHelper.isCompleteColumnName : this.isComplete ? 1 : 0,
    };
  }


}