import 'package:flutter/material.dart';
import 'package:mvvm_practice/model/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.todo,
    required this.change,
    required this.delete,
  });

  final TodoModel todo;
  final Function(bool?)? change;
  final Function() delete;

  @override
  Widget build(BuildContext context) {
    // Determine the color based on todo.isChecked
    final itemColor = todo.isChecked
        ? const Color.fromARGB(255, 196, 246, 255)
        : const Color.fromARGB(255, 255, 255, 255);

    return ListTile(
      title: Text(todo.taskName),
      subtitle: Text(todo.createdAt.toString()),
      tileColor: itemColor,
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
