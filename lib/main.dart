import 'package:flutter/material.dart';
import 'package:flutter_practice/views/main_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainScreen(), debugShowCheckedModeBanner: false,);
  }
}

