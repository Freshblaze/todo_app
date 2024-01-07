import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList(
      {required this.taskName,
      required this.chekbox,
      required this.onChanging,
      super.key});
  Function(bool?)? onChanging;
  final bool chekbox;
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(1),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Checkbox(
              value: chekbox,
              onChanged: onChanging,
            ),
            Text(
              taskName,
              style: TextStyle(
                decoration:
                    chekbox ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
