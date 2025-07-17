import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {

  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('todoBox');

  // init the database
  void createInitialData() {
    toDoList = [
      ['Study', false],
      ['Make a Lunch', false],
    ];
  }

  // Load data from database
  void loadData() {
    toDoList = _myBox.get('todoList');
  }

  // Update the database
  void updateDatabase() {
    _myBox.put('todoList', toDoList);
  }
}