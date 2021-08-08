import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier{
  String msg = 'aya';
  changeMsg(String newMsg){
    this.msg = newMsg;
    notifyListeners();
  }
  setMsg(msg) {
    this.msg = msg;
    // notifyListeners();
  }
}