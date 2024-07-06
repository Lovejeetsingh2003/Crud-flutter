class TaskObject {
  int? id;
  String? task;
  int? taskId;
  bool? isCompleted;

  TaskObject({
    this.id,
    this.task,
    this.taskId,
    this.isCompleted,
  });

  factory TaskObject.fromJson(Map<String, dynamic> json) => TaskObject(
        id: json["id"],
        task: json["task"],
        taskId: json["taskId"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
        "taskId": taskId,
        "isCompleted": isCompleted,
      };
}
