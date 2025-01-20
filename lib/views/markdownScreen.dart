import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo_models.dart';
import 'package:flutter_application_1/styles/app_bar.dart';
import 'package:flutter_application_1/styles/button_styles.dart';
import 'package:flutter_application_1/styles/forms_field.dart';
import 'package:flutter_application_1/viewModels/to-do_vm.dart';
import 'package:provider/provider.dart';

class TodoDetailScreen extends StatelessWidget {
  final TodoModel todo;

  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController(text: todo.title);
    final _descriptionController =
        TextEditingController(text: todo.description);
    final todoViewModel = Provider.of<TodoViewModel>(context);
    return Scaffold(
      appBar: CustomAppBarTheme.appBarWithEditIcon(
          context, 'Markdown Screen', true, () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    'Edit To-Do',
                    style: Theme.of(context).textTheme.headlineMedium!,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration:
                            FormsField.inputDecoration(context, 'Enter Title'),
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
                        todoViewModel.update(context, todo,
                            _titleController.text, _descriptionController.text);
                        Navigator.pop(context);
                      },
                      style: ButtonStyles.textButtonStyle(context),
                      child: Text('Edit'),
                    ),
                  ],
                ));
      }),
      body: Stack(
        children: [
          Container(
            height: 10,
            color: Theme.of(context).colorScheme.primary,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(todo.title),
                    Text(todo.description),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
