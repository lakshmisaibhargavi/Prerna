import 'package:prerna/intro.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Deligne',
        // ignore: deprecated_member_use
        textTheme: TextTheme(body1: TextStyle(fontSize: 28)),
      ),
      home: Intropage(),
    );
  }
}
