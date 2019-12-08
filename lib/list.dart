// Importing firestore package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

class TODOList extends StatelessWidget {

  final List<Task> tasks;
  final onToggle;
  // Setting reference to 'tasks' collection
  final collection = Firestore.instance.collection('tasks');

  TODOList({@required this.tasks, @required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO app'),
      ),
      // Making a StreamBuilder to listen to changes in real time
      body: StreamBuilder<QuerySnapshot>(
        stream: collection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // Handling errors from firebase
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            // Display if still loading data
            case ConnectionState.waiting: return Text('Loading...');
            default:
              return ListView(
                // Got rid of Task class
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return CheckboxListTile(
                    title:  Text(document['name']),
                    value: document['completed'],
                    // Updating the database on task completion
                    onChanged: (newValue) => collection.document(document.documentID).updateData({'completed': newValue})
                  );
                }).toList(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/create'),
          child: Icon(Icons.add)
      ),
    );
  }
}