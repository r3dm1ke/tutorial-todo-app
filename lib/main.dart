import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

void main() => runApp(TODOApp());

// The sole reason we keep this extra component is
// because runApp will only take a StatelessWidget as its argument
class TODOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TODO();
  }
}

// Here we are defining a StatefulWidget
class TODO extends StatefulWidget {

  // Every stateful widget must override createState
  @override
  State<StatefulWidget> createState() {
    return TODOState();
  }
}

// This is the state for then TODO widget
class TODOState extends State<TODO> {

  // We define the properties for the widget in its state
  final List<Task> tasks = [
    Task('Do homework'),
    Task('Laundry'),
    Task('Finish this tutorial')
  ];

  // Now state is responsible for building the widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO app',
      initialRoute: '/',
      routes: {
        '/': (context) => TODOList(tasks: tasks),
        '/create': (context) => TODOCreate(),
      },
    );
  }
}

class TODOList extends StatelessWidget {

  final List<Task> tasks;

  TODOList({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO app'),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].getName()),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add)
      ),
    );
  }
}

class TODOCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create a task')),
        body: Center(child: Text('Not yet')));
  }
}
