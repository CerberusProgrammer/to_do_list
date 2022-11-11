import 'package:flutter/material.dart';

import 'task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  List<Task> tasks = [
    Task(task: 'Do homework'),
    Task(task: 'Send a message', description: 'To Jacqueline'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doit'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(tasks[index].task),
                subtitle: tasks[index].task.isEmpty
                    ? null
                    : Text(tasks[index].description),
                onTap: () {
                  setState(() {
                    tasks[index].done = true;
                  });
                },
                onLongPress: () {
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Task'),
                  content: Center(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Task'),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          tasks.add(
                            Task(task: ''),
                          );
                        });
                      },
                      child: const Text('Add task'),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
