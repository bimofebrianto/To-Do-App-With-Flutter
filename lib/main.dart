import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> tasks = [];  // Menyimpan daftar tugas
  final TextEditingController controller = TextEditingController();

  // Menambah tugas baru
  void _addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasks.add(controller.text);
      });
      controller.clear();
    }
  }

  // Menghapus tugas dari daftar
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Input untuk menambah tugas
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Add a new task'),
            ),
            SizedBox(height: 10),
            // Tombol untuk menambah tugas
            ElevatedButton(
              onPressed: _addTask,
              child: Text('Add Task'),
            ),
            // Daftar tugas
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
