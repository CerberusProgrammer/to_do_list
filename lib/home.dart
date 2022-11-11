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
    Task(task: ''.isEmpty ? 'Do nothing' : ''),
    Task(task: 'hika'),
  ];

  List<Task> favorites = [];
  List<Task> dones = [];

  bool dense = false;
  bool isFavorite = false;

  void addTask(String task, String description) {
    if (task.isNotEmpty && task.isNotEmpty) {
      setState(() {
        tasks.add(
          Task(
            task: task,
            description: description.isEmpty ? '' : description,
          ),
        );
      });
    }
  }

  Widget favoriteTask() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            dense: dense,
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    favorites[index].favorite = false;
                    tasks.add(favorites.removeAt(index));
                  });
                },
                icon: favorites[index].favorite
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border)),
            title: Text(favorites[index].task),
            subtitle: favorites[index].task.isEmpty
                ? null
                : Text(favorites[index].description),
            onTap: () {
              setState(() {
                favorites[index].done = true;
                dones.add(favorites.removeAt(index));
              });
            },
            onLongPress: () {
              setState(() {
                favorites.removeAt(index);
              });

              const snackBar = SnackBar(
                duration: Duration(milliseconds: 500),
                content: Text('Favorite task deleted.'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          );
        },
      ),
    );
  }

  Widget allTasks() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            dense: dense,
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    tasks[index].favorite = true;
                    favorites.add(tasks.removeAt(index));
                  });
                },
                icon: tasks[index].favorite
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border)),
            title: Text(tasks[index].task),
            subtitle: tasks[index].task.isEmpty
                ? null
                : Text(tasks[index].description),
            onTap: () {
              setState(() {
                tasks[index].done = true;
                dones.add(tasks.removeAt(index));
              });
            },
            onLongPress: () {
              setState(() {
                dones.add(tasks.removeAt(index));
              });

              const snackBar = SnackBar(
                duration: Duration(milliseconds: 500),
                content: Text('Task deleted.'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          );
        },
      ),
    );
  }

  Widget doneTasks() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: dones.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            dense: dense,
            trailing: Icon(
              dones[index].favorite ? Icons.star : Icons.star_border,
            ),
            title: Text(dones[index].task),
            subtitle: dones[index].task.isEmpty
                ? null
                : Text(dones[index].description),
            onTap: () {
              setState(() {
                dones[index].done = false;
                dones[index].favorite = false;
                tasks.add(dones.removeAt(index));
                Navigator.pop(context);
              });
            },
            onLongPress: () {
              setState(() {
                dones.removeAt(index);
                Navigator.pop(context);
              });

              const snackBar = SnackBar(
                duration: Duration(milliseconds: 500),
                content: Text('Task deleted.'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabPages = [
      allTasks(),
      favoriteTask(),
    ];

    List<Tab> tabs = [
      const Tab(
        text: 'All',
      ),
      const Tab(
        icon: Icon(Icons.star, color: Colors.amber),
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Doit'),
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Colors.amber,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.list,
              ),
              onPressed: () {
                setState(() {
                  if (dense) {
                    dense = false;
                  } else {
                    dense = true;
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.archive_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (build) {
                      return Scaffold(
                        appBar:
                            AppBar(title: const Text('Done Tasks'), actions: [
                          PopupMenuButton(
                            tooltip: 'Show options',
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: const Text('Undone tasks'),
                                onTap: () {
                                  setState(() {
                                    tasks.addAll(dones);
                                  });

                                  dones.removeRange(0, dones.length);

                                  Navigator.pop(context);
                                },
                              ),
                              PopupMenuItem(
                                child: const Text('Delete All'),
                                onTap: () {
                                  dones.removeRange(0, dones.length);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          )
                        ]),
                        body: doneTasks(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
        body: TabBarView(
          children: tabPages,
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController task = TextEditingController();
                  TextEditingController subtitle = TextEditingController();

                  return AlertDialog(
                    scrollable: true,
                    title: const Text('Task to Do'),
                    content: Center(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: task,
                            autofocus: true,
                            decoration:
                                const InputDecoration(labelText: 'Task'),
                            onEditingComplete: () {
                              addTask(task.text, subtitle.text);
                              Navigator.pop(context);
                            },
                          ),
                          TextFormField(
                            maxLines: 3,
                            maxLength: 100,
                            controller: subtitle,
                            decoration:
                                const InputDecoration(hintText: 'Description'),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      OutlinedButton(
                        onPressed: () {
                          addTask(task.text, subtitle.text);
                          Navigator.pop(context);
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
