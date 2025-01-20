import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo_models.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoModel> _todos = [];
  String _searchQuery = '';
// search garera list ma dekhauna provider ma data caina bhane data xaina dekhauxa
  List<TodoModel> get todos {
    if(_todos.isEmpty){
      return [];
    }
    if (_searchQuery.isEmpty) {
      return _todos;
    } else {
      return _todos
          .where((todo) =>
              todo.title.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }
 // to do xa ki xaina chaeck garne
  bool get hasTodos => _todos.isNotEmpty;

  bool get hasSearchResults {
    if (_searchQuery.isEmpty) {
      return true; 
    } else {
      return _todos.any((todo) =>
          todo.title.toLowerCase().contains(_searchQuery.toLowerCase()));
    }
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void add(TodoModel todo, BuildContext context) {
    _todos.add(todo);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('added')));
    notifyListeners();
  }

  void remove(TodoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void update(
      BuildContext context, TodoModel todo, String title, String description) {
    final index = _todos.indexOf(todo);
    _todos[index] = TodoModel(title: title, description: description);
    notifyListeners();

    Navigator.of(context).pop();

    // Show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Todo updated successfully!'),
      ),
    );
  }
}
