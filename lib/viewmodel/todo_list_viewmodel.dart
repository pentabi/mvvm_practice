import 'package:flutter/material.dart';
import 'package:mvvm_practice/model/todo_model.dart';

class TodoListViewModel extends ChangeNotifier {
  List<TodoModel> todos = [];

  void fetchTodos() async {
    todos = todoList;
    notifyListeners();
  }

  void deleteTodo(int index) async {
    if (index >= 0 && index <= todoList.length) {
      todoList.removeAt(index);
    } else {
      print("invalid index for deleteTodo!");
    }
    fetchTodos();
  }

  void checkTodo(int index, bool isChecked) async {
    todos[index].isChecked = isChecked;
    todoList = todos;
    notifyListeners();
  }

  void createTodo() async {
    todoList.add(
      TodoModel(
          id: todos.length + 1,
          isDeleted: false,
          createdAt: DateTime.now(),
          isChecked: false,
          taskName: "Task ${todoList.length + 1}"),
    );
    fetchTodos();
  }
}
