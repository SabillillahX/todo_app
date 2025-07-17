import 'package:flutter/material.dart';
import 'package:flutter_lab/core/data/database.dart';
import 'package:flutter_lab/core/utils/dialog_box.dart';
import 'package:flutter_lab/core/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // reference to the Hive box
  final _myBox = Hive.box('todoBox');
  TodoDatabase db = TodoDatabase();

  // Initialize the database
  @override
  void initState() {
    // if this is 1st time opening the app, create initial data
    if (_myBox.get('todoList') == null) {
      db.createInitialData();
    }  else {
      db.loadData(); // Load existing data
    }


    super.initState(); // Load data from the database
  }

  // Text controller for the dialog input
  final _controller = TextEditingController();

  // Checkbox untuk mengubah status tugas
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1]; // Update status tugas
    });
    db.updateDatabase(); // Update the database
  }

  // Create a new task
  void addNewTask(String taskName) {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () {
          Navigator.of(context).pop(); // Close the dialog
          _controller.clear(); // Clear the input field
        },
      );
    });
  }

  // Save the new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear(); 
    });
    Navigator.of(context).pop();
    db.updateDatabase(); // Update the database with the new task
  }

  // Delete a task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index); // Remove the task at the specified index
    });
    db.updateDatabase(); // Update the database after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waydo', style: TextStyle(color: Colors.black)),
        
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTask(_controller.text);
        },
        child: const Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.yellow,
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) {
              checkboxChanged(value, index);
            },
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
