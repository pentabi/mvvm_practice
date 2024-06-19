import 'package:flutter/material.dart';
import 'package:mvvm_practice/view/widgets/my_drawer.dart';
import 'package:mvvm_practice/view/widgets/todo_list_item.dart';
import 'package:mvvm_practice/viewmodel/todo_list_viewmodel.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final vm = TodoListViewModel();

  @override
  void initState() {
    super.initState();
    vm.fetchTodos();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => vm.createTodo(),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Todo List"),
        ),
        drawer: const MyDrawer(),
        body: ChangeNotifierProvider(
            create: (context) => vm,
            child:
                Consumer<TodoListViewModel>(builder: (context, value, child) {
              //違いを連絡する
              return ListView.builder(
                itemCount: value.todos.length,
                itemBuilder: (context, index) {
                  return TodoListItem(
                      todo: value.todos[index],
                      change: (isChecked) {
                        value.checkTodo(index, isChecked ?? false);
                      },
                      delete: () {
                        value.deleteTodo(index);
                      });
                },
              );
            })));
  }
}
