class Task {
  String task;
  String description;
  bool done;

  Task({
    required this.task,
    this.description = '',
    this.done = false,
  });
}
