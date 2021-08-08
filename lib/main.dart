import 'package:flutter/material.dart';
import 'package:flutter_app1_provider/provider/my_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return MyProvider();
    },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Provider.of<MyProvider>(context,listen: false).changeMsg('Hi guys ... ');
            }, child: Text(
              'Change Msg'
            )),
            Text(Provider.of<MyProvider>(context).msg),
          ],
        ),
      ),
    );
  }

}


