import 'package:flutter/material.dart';
import 'package:todo_app/home_page.dart';

var todoColor =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(223, 140, 163, 246));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: todoColor,
        primaryColor: todoColor.background,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: todoColor.onPrimaryContainer,
            foregroundColor: todoColor.primaryContainer),
      ),
      home: HomePage(),
    );
  }
}
