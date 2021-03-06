import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1_provider/helper/db_helper.dart';
import 'package:flutter_app1_provider/model/modelTask.dart';

class NewTasks extends StatefulWidget{
  @override
  _NewTasksState createState() => _NewTasksState();
}

class _NewTasksState extends State<NewTasks> {
  int id ;
  bool isComplete = false ;
  String taskName ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ) ),
              onChanged: (value){
                this.taskName = value ;
              },
            ),
            Checkbox(value: isComplete, onChanged: (value){
              this.isComplete = value ;
              setState(() {});

            },
            ),
            RaisedButton(child: Text('Add New Task') , onPressed: (){
              // tasks.add(Task(this.taskName , this.isComplete));
              DBHelper.dbHelper.insertTask(Task(this.taskName , this.isComplete,this.id));
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}