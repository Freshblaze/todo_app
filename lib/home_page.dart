import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/utili/dialog_box.dart';
import 'package:todo_app/utili/todo_utilis.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // if this is the first time opening the app, default task
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // they already exits a data
      db.loadData();
    }
    super.initState();
  }

  // To refrence the box created by Hive
  final _mybox = Hive.openBox('myBox');
  ToDoDataBase db = ToDoDataBase();

  //method to clik the checkbox
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.upDateDataBase();
  }

  //method for adding to list of task
  void addTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.upDateDataBase();
  }

  //method for deleteTask
  void deleteTask(int index) {
    setState(
      () {
        db.toDoList.removeAt(index);
      },
    );
    db.upDateDataBase();
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
      },
    );
    db.upDateDataBase();
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
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoList(
              chekbox: db.toDoList[index][1],
              onChanging: (value) => checkBoxChange(value, index),
              taskName: db.toDoList[index][0],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
