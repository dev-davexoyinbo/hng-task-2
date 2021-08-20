import 'package:flutter/material.dart';
import 'package:task2/home.dart';

void main() {
  runApp(Task2App());
}

class Task2App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),
    );
  }
}
