import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TODOCreate extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TODOCreateState();
  }
}

class TODOCreateState extends State<TODOCreate> {

  final collection = Firestore.instance.collection('tasks');
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
        onPressed: () async {
          // Creating a new document
          await collection.add({'name': controller.text, 'completed': false});
          Navigator.pop(context);
        },
      ),
    );
  }
}