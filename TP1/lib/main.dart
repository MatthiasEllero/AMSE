import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP1 Media',
      theme: ThemeData(
      primarySwatch: Colors.blue,
        ),
      home: HomePage()
    );
  }
}
