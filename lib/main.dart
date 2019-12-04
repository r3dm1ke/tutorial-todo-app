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

  // At this point we can remove the dummy data
  final List<Task> tasks = [];

  // Function that modifies the state when a new task is created
  void onTaskCreated(String name) {
    // All state modifications have to be wrapped in setState
    // This way Flutter knows that something has changed
    setState(() {
      tasks.add(Task(name));
    });
  }

  // A new callback function to toggle task's completion
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
        // Passing the function as a callback
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
            // Changed ListTile to CheckboxListTile to have
            // the checkbox capability
            return CheckboxListTile(
              title: Text(tasks[index].getName()),
              // Passing a value and a callback for the checkbox
              value: tasks[index].isCompleted(),
              // The _ in the argument list is there because onChanged expects it
              // But we are not using it
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

// Since we are handling user input, state is used
class TODOCreate extends StatefulWidget {

  // Callback function that gets called when user submits a new task
  final onCreate;

  TODOCreate({@required this.onCreate});

  @override
  State<StatefulWidget> createState() {
    return TODOCreateState();
  }
}

class TODOCreateState extends State<TODOCreate> {

  // Controller that handles the TextField
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create a task')),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              // Opens the keyboard automatically
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
            // Call the callback with the new task name
            widget.onCreate(controller.text);
            // Go back to list screen
            Navigator.pop(context);
          },
        ),
    );
  }
}
