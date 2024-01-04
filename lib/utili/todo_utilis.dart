import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({required this.chekbox, required this.onChanging, super.key});
  Function(bool?)? onChanging;
  final bool chekbox;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(value: chekbox, onChanged: onChanging),
          const Text('Make tutorial'),
        ],
      ),
    );
  }
}
