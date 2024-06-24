import 'package:flutter/material.dart';
import 'package:mvvm_practice/model/todo_model.dart';

class CreateTodoViewModel extends ChangeNotifier {
  List<TodoModel> todos = [];

  void fetchTodos() async {
    todos = todoList;
    notifyListeners();
  }

  void addTodo(String taskName) {
    todos.add(TodoModel(
      id: todos.length + 1,
      isDeleted: false,
      taskName: taskName,
      createdAt: DateTime.now(),
      isChecked: false,
    ));
    notifyListeners();
  }
}
