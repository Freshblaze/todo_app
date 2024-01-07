import 'package:flutter/material.dart';
import 'package:todo_app/utili/dialog_box.dart';
import 'package:todo_app/utili/todo_utilis.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['make tutoria', false],
    ['Do exercise ', false]
  ];

  //method to clik the checkbox
  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //method for adding to list of task
  void addTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  final _controller = TextEditingController();

  //method to add new tast
  void addtolist() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: addTask,
            onCancel: Navigator.of(context).pop,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addtolist,
        elevation: 0.5,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TODO APP',
        ),
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return TodoList(
              chekbox: toDoList[index][1],
              onChanging: (value) => checkBoxChange(value, index),
              taskName: toDoList[index][0],
            );
          }),
    );
  }
}
