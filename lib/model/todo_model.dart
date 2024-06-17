var todoList = <TodoModel>[
  TodoModel(
      id: 1,
      isDeleted: false,
      createdAt: DateTime.now(),
      isChecked: false,
      taskName: "Task 1")
];

class TodoModel {
  int id;
  String taskName;
  bool isChecked;
  bool isDeleted;
  DateTime createdAt;

  TodoModel({
    required this.id,
    required this.isDeleted,
    required this.createdAt,
    required this.isChecked,
    required this.taskName,
  });
}
