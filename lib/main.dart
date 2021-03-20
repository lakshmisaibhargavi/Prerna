import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prerna/intro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

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
