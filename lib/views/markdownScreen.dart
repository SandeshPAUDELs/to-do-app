import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo_models.dart';
import 'package:flutter_application_1/styles/app_bar.dart';
import 'package:flutter_application_1/styles/button_styles.dart';
import 'package:flutter_application_1/styles/forms_field.dart';
import 'package:flutter_application_1/viewModels/to-do_vm.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

class TodoDetailScreen extends StatelessWidget {
  final TodoModel todo;

  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    String _markdownData = """
  #  Markdown Test of my todo app
  ---
  This is a simple Markdown test. Provide a text string with Markdown tags
  to the Markdown widget and it will display the formatted output in a
  scrollable widget.
  
  ## Section 1
There are altogether  ${Provider.of<TodoViewModel>(context).todos.length} Todo's in this list.
My title is ${todo.title}
## Todos List



  This is a paragraph. *This is a sentence in italics.* **This is a sentence in bold.**
  
  
  ### Subsection A
 **__I am going to  add the image in markdown__**


  
  ![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/512px-Google-flutter-logo.svg.png)
  ## I think Markdown is same like**flutter-html pacakge**


""";
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
                child: Markdown(data: _markdownData),
                // child: Column(
                //   children: [
                //     Text(todo.title),
                //     Text(todo.description),
                //   ],
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
