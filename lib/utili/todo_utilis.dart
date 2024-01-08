import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {required this.taskName,
      required this.chekbox,
      required this.onChanging,
      required this.deleteFunction,
      super.key});
  final Function(bool?)? onChanging;
  final bool chekbox;
  final String taskName;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        dragDismissible: true,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ],
      ),
      child: Card(
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
                  decoration: chekbox
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
