import 'package:flutter/material.dart';
import 'package:flutter_practice/view_model/dataVm.dart';
import 'package:flutter_practice/views/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create:  (context) => DataViewModel(),),
      ],
      child: const MaterialApp(home: MainScreen(), debugShowCheckedModeBanner: false,));
  }
}

