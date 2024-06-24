import 'package:flutter/material.dart';
import 'package:mvvm_practice/view/widgets/my_drawer.dart';
import 'package:mvvm_practice/view/widgets/my_textfield.dart';
import 'package:mvvm_practice/viewmodel/create_todo_viewmodel.dart';
import 'package:provider/provider.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({super.key});

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  TextEditingController controller = TextEditingController();
  final vm = CreateTodoViewModel();

  @override
  void initState() {
    super.initState();
    vm.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
      ),
      drawer: const MyDrawer(),
      body: ChangeNotifierProvider(
        create: (context) => vm,
        child: Consumer<CreateTodoViewModel>(builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MyTextField(
                  hintText: "New Todo",
                  obscureText: false,
                  controller: controller,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text != "") {
                      // Access the ViewModel and call addTodo
                      value.addTodo(controller.text);
                      controller.clear();
                    }
                  },
                  child: const Text('Add Todo'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
