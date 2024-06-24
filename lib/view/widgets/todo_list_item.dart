import 'package:flutter/material.dart';
import 'package:mvvm_practice/model/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(
      {super.key,
      required this.todo,
      required this.change,
      required this.delete,
      this.color = const Color.fromARGB(255, 255, 255, 255)});

  final TodoModel todo;
  final Function(bool?)? change;
  final Function() delete;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.taskName),
      subtitle: Text(todo.createdAt.toString()),
      tileColor: color,
      trailing: Row(
        mainAxisSize:
            MainAxisSize.min, // Ensures the Row takes up the minimum space
        children: [
          Checkbox(
            value: todo.isChecked,
            onChanged: change,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: delete,
          ),
        ],
      ),
    );
  }
}
