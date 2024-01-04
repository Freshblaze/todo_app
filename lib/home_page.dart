import 'package:flutter/material.dart';
import 'package:todo_app/utili/todo_utilis.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TODO APP',
        ),
      ),
      body: ListView(
        children: [
          TodoList(
            chekbox: false,
            onChanging: null,
          ),
        ],
      ),
    );
  }
}
