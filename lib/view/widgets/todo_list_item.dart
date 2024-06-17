import 'package:flutter/material.dart';
import 'package:mvvm_practice/model/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo, required this.change});

  final TodoModel todo;
  final Function(bool?)? change;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.taskName),
      subtitle: Text(
        todo.createdAt.toString(),
      ),
      trailing: Checkbox(
        value: todo.isChecked,
        onChanged: change,
      ),
    );
  }
}
