import 'package:flutter/material.dart';

class Todo {
  bool completed = false;
  String title = '';

  Todo({
    required this.title,
    this.completed = false,
  });
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todos = [
    Todo(title: 'test 1', completed: true),
    Todo(title: 'test 2', completed: false),
    Todo(title: 'test 1', completed: true)
  ];

  @override
  Widget build(BuildContext context) {
    void toggleTodo(int index) {
      setState(() {
        todos[index].completed = !(todos[index].completed);
      });
    }

    void addTodo(Todo todo) {
      setState(() {
        todos.add(todo);
      });
    }

    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TaskIt',
          style: TextStyle(
            color: Color(0xffd76542),
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) =>
              TodoTile(todos[index], index, toggleTodo),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SizedBox(
              height: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: controller,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter title',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Todo todo = Todo(title: controller.text);
                      addTodo(todo);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add Todo'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: const Color(0xffd76542),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        backgroundColor: const Color(0xffd76542),
      ),
    );
  }
}

class TodoTile extends StatelessWidget {
  final Todo todo;
  final int index;
  final Function toggleTodos;

  TodoTile(this.todo, this.index, this.toggleTodos);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: todo.completed,
        onChanged: (checked) {
          toggleTodos(index);
        },
        activeColor: const Color(0xffd76542),
        title: Text(todo.title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color(0xffd76542),
          ),
        ),
      ),
    );
  }
}
