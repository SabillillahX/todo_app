import 'package:flutter/material.dart';
import 'package:flutter_lab/core/utils/dialog_box.dart';
import 'package:flutter_lab/core/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text controller for the dialog input
  final _controller = TextEditingController();

  // Daftar tugas
  List toDoList = [
    ['Belajar Flutter', false],
    ['Membuat Aplikasi Todo', false],
  ];

  // Checkbox untuk mengubah status tugas
  void CheckboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1]; // Update status tugas
    });
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
      toDoList.add([_controller.text, false]);
      _controller.clear(); 
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App', style: TextStyle(color: Colors.black)),
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
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) {
              CheckboxChanged(value, index);
            },
          );
        },
      ),
    );
  }
}
