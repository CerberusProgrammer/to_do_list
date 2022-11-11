class Task {
  String task;
  String description;
  bool done;
  bool favorite;

  Task({
    required this.task,
    this.description = '',
    this.done = false,
    this.favorite = false,
  });
}
