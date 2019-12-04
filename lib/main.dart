import 'package:flutter/material.dart';
// Importing our Task class
import 'package:todo_app/task.dart';

void main() => runApp(TODOApp());

class TODOApp extends StatelessWidget {

  // Creating a list of tasks with some dummy values
  final List<Task> tasks = [
    Task('Do homework'),
    Task('Laundry'),
    Task('Finish this tutorial')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO app',
        home: Scaffold(
            appBar: AppBar(
              title: Text('TODO app'),
            ),
            // Using ListView.builder to render a list of tasks
            body: ListView.builder(
              // How many items to render
              itemCount: tasks.length,
              // Functions that accepts an index and renders a task
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index].getName()),
                );
              }
            )
        )
    );
  }
}