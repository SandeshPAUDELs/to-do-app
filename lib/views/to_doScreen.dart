import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo_models.dart';
import 'package:flutter_application_1/styles/app_bar.dart';
import 'package:flutter_application_1/styles/button_styles.dart';
import 'package:flutter_application_1/styles/container_style.dart';
import 'package:flutter_application_1/styles/no_data.dart';
import 'package:flutter_application_1/viewModels/to-do_vm.dart';
import 'package:flutter_application_1/views/markdownScreen.dart';
import 'package:flutter_application_1/styles/forms_field.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();
    final todoViewModel = Provider.of<TodoViewModel>(context);
    return Scaffold(
  appBar: CustomAppBarTheme.appBarStyle(context, 'To-Do-Screen'),
  body: Stack(
    children: [
      Container(
        width: double.infinity,
        height: 20,
        color: Theme.of(context).colorScheme.primary,
      ),
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search To-Do',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (query) {
                    todoViewModel.updateSearchQuery(query);
                  },
                ),
              ),
              Expanded(
                child: todoViewModel.hasTodos
                    ? (todoViewModel.hasSearchResults
                        ? ListView.builder(
                            itemCount: todoViewModel.todos.length,
                            itemBuilder: (context, index) {
                              final todo = todoViewModel.todos[index];
                              return DefaultListTile(
                                title: todo.title,
                                subtitle: todo.description,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TodoDetailScreen(todo: todo),
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        : 
                        NoData(title: 'NO Result', subtitle: 'Your Search query not found', icon: Icons.search_off_sharp)
                        )
                    : NoData(title: 'NO ToDo Present', subtitle: 'Once you add the data they will be displayed', icon: Icons.error_outline_outlined),
              ),
            ],
          ),
        ),
      ),
    ],
  ),


    // return Scaffold(
    //   appBar: CustomAppBarTheme.appBarStyle(context, 'To-Do-Screen'),
    //   body: Stack(
    //     children: [
    //       Container(
    //           width: double.infinity,
    //           height: 20,
    //           color: Theme.of(context).colorScheme.primary),
    //       ClipRRect(
    //         borderRadius: const BorderRadius.only(
    //           topLeft: Radius.circular(15),
    //           topRight: Radius.circular(15),
    //         ),
    //         child: Container(
    //           width: double.infinity,
    //           color: Theme.of(context).colorScheme.surface,
    //           child: Column(
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: TextField(
    //                   decoration: const InputDecoration(
    //                     hintText: 'Search To-Do',
    //                     border: OutlineInputBorder(),
    //                   ),
    //                   onChanged: (query) {
    //                     todoViewModel.updateSearchQuery(query);
    //                   },
    //                 ),
    //               ),
    //               Expanded(
    //                 child: ListView.builder(
    //                   itemCount: todoViewModel.todos.length,
    //                   itemBuilder: (context, index) {
    //                     final todo = todoViewModel.todos[index];
    //                     return DefaultListTile(
    //                       title: todo.title,
    //                       subtitle: todo.description,
    //                       onTap: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                               builder: (context) =>
    //                                   TodoDetailScreen(todo: todo),
    //                             ));
    //                       },
    //                     );
    //                     // return GestureDetector(
    //                     //   onTap: () {
    //                     //     Navigator.push(
    //                     //         context,
    //                     //         MaterialPageRoute(
    //                     //           builder: (context) =>
    //                     //               TodoDetailScreen(todo: todo),
    //                     //         ));
    //                     //   },
    //                     //   child: ListTile(
    //                     //     title: Text(todo.title),
    //                     //     subtitle: Text(todo.description),
    //                     //     trailing: IconButton(
    //                     //       icon: const Icon(Icons.delete),
    //                     //       onPressed: () {
    //                     //         todoViewModel.remove(todo);
    //                     //       },
    //                     //     ),
    //                     //   ),
    //                     // );
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      'Add To-Do',
                      style: Theme.of(context).textTheme.headlineMedium!,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: FormsField.inputDecoration(
                              context, 'Enter Title'),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: FormsField.inputDecoration(
                              context, 'Enter Description'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _titleController.clear();
                          _descriptionController.clear();
                        },
                        style: ButtonStyles.textButtonStyle(context),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<TodoViewModel>(context, listen: false).add(TodoModel(title: _titleController.text, description: _descriptionController.text), context);
                          Navigator.pop(context);
                        },
                        style: ButtonStyles.textButtonStyle(context),
                        child: Text('Add'),
                      ),
                    ],
                  ));
        },
        label: const Text('Add To-Do'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
