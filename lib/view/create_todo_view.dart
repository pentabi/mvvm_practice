import 'package:flutter/material.dart';
import 'package:mvvm_practice/view/widgets/my_drawer.dart';
import 'package:mvvm_practice/viewmodel/create_todo_viewmodel.dart';
import 'package:provider/provider.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({super.key});

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Task Name'),
                onSaved: (value) {
                  _taskName = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Use the viewmodel to add the new todo
                    Provider.of<CreateTodoViewModel>(context, listen: false)
                        .addTodo(_taskName);
                    // Navigate back to the previous screen
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}