import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            //drawer header
            const DrawerHeader(
              child: Icon(
                Icons.favorite,
                color: Color(0xFF42A5F5),
              ),
            ),

            //home
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                  leading: Icon(Icons.list,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text("T O D O  L I S T"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'todo_list_page');
                  }),
            ),

            //new todo
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                  leading: Icon(Icons.new_label,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: const Text("N E W  T O D O"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'create_todo_page');
                  }),
            ),
          ]),
        ],
      ),
    );
  }
}
