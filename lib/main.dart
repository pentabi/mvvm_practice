import 'package:flutter/material.dart';
import 'package:mvvm_practice/view/create_todo_view.dart';
import 'package:mvvm_practice/view/todo_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoListView(),
        routes: {
          'todo_list_page': (context) => const TodoListView(),
          'create_todo_page': (context) => const CreateTodoView(),
        });
  }
}
