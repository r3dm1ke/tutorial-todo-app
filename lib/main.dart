import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

void main() => runApp(TODOApp());

class TODOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TODO();
  }
}

class TODO extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TODOState();
  }
}

class TODOState extends State<TODO> {

  final List<Task> tasks = [];

  void onTaskCreated(String name) {
    setState(() {
      tasks.add(Task(name));
    });
  }

  void onTaskToggled(Task task) {
    setState(() {
      task.setCompleted(!task.isCompleted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO app',
      initialRoute: '/',
      routes: {
        '/': (context) => TODOList(tasks: tasks, onToggle: onTaskToggled),
        '/create': (context) => TODOCreate(onCreate: onTaskCreated,),
      },
    );
  }
}

class TODOList extends StatelessWidget {

  final List<Task> tasks;
  final onToggle;

  TODOList({@required this.tasks, @required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO app'),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(tasks[index].getName()),
              value: tasks[index].isCompleted(),
              onChanged: (_) => onToggle(tasks[index]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add)
      ),
    );
  }
}

class TODOCreate extends StatefulWidget {

  final onCreate;

  TODOCreate({@required this.onCreate});

  @override
  State<StatefulWidget> createState() {
    return TODOCreateState();
  }
}

class TODOCreateState extends State<TODOCreate> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create a task')),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              autofocus: true,
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter name for your task'
              )
            )
          )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () {
            widget.onCreate(controller.text);
            Navigator.pop(context);
          },
        ),
    );
  }
}
