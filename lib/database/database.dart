import 'package:hive/hive.dart';
import 'package:todo_app/utili/todo_utilis.dart';

class ToDoDataBase {
  List toDoList = [];
  // reference box
  final _myBox = Hive.box('myBox');

  //method if it is first time opening the app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Excersice", false]
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // Update the dataBase
  void upDateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
