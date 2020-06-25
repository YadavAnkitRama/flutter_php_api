import 'package:flutter/material.dart';
import 'package:flutter_php_api/views/home.dart';
import 'package:flutter_php_api/views/index.dart';
import 'package:flutter_php_api/views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Api',
      initialRoute: '/',
      routes: {
      '/': (context) => Home(),
      '/login': (context) => Login(),
      '/index': (context) => Index(),
    },
    );
  }
}
