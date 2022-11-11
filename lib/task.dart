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

  factory Task.fromJson(dynamic json) {
    return Task(
      task: json['task'] as String,
      description: json['description'] as String,
      done: json['done'] as bool,
      favorite: json['favorite'] as bool,
    );
  }

  Map<dynamic, dynamic> toJson() => {
        'task': task,
        'description': description,
        'done': done,
        'favorite': favorite,
      };

  @override
  String toString() {
    return '"task": $task, "description": $description, "done": $done, "favorite": $favorite';
  }
}
