import 'dart:convert';
import 'dart:io';

import 'package:to_do_list/task.dart';

class Data {
  static List<Task> importData() {
    List<Task> tasks = [];
    File file = File('tasks.json');

    if (!file.existsSync()) {
      return tasks;
    }

    String content = file.readAsStringSync();
    if (content.isEmpty) {
      return tasks;
    }

    final decoded = jsonDecode(content) as List<dynamic>;

    for (var element in decoded) {
      Task task = Task.fromJson(element);
      tasks.add(task);
    }

    return tasks;
  }

  static void exportTask(List<Task> tasks) {
    File file = File('tasks.json');

    if (!file.existsSync()) {
      file.createSync();
    }

    file.writeAsStringSync(jsonEncode(tasks));
  }
}
