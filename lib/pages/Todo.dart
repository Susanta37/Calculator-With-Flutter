import 'package:flutter/material.dart';

class Todo {
  final String name;
  bool isCompleted;

  Todo({required this.name, this.isCompleted = false});

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Todo> _todoList = [
    Todo(name: 'Make LC'),
    Todo(name: 'Task 2', isCompleted: true),
    Todo(name: 'Task 3'),
  ];

  void _toggleCompleted(int index) {
    setState(() {
      _todoList[index].toggleCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Center(
          child: Text('My ToDo List'),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          final todo = _todoList[index];
          return ListTile(
            title: Text(
              todo.name,
              style: TextStyle(
                decoration:
                    todo.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) => _toggleCompleted(index),
            ),
          );
        },
      ),
    );
  }
}
