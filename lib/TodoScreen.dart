import 'package:flutter/material.dart';
import 'TodoAddScreen.dart';
import 'TodoService.dart';
import 'Todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  updateListUI() {
    setState(() {});
    print("updateListUI");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: FutureBuilder<List<Products>>(
        future: TodoService.getTodos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text(todo.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Manufacturer: ${todo.manufacturer}'),
                        Text('Price: \$${todo.price}'),
                        Text('Description: ${todo.description}'),
                        Text('ID: ${todo.id}'),
                      ],
                    ),
                    leading: todo.image.isNotEmpty
                        ? Image.network(todo.image, width: 50, height: 50, fit: BoxFit.cover)
                        : Icon(Icons.image, size: 50),
                    trailing: Checkbox(
                      value: todo.selected,
                      onChanged: (value) {
                        setState(() {
                          // Create a new instance of the Products class with the updated selected value
                          final updatedTodo = Products(
                            id: todo.id,
                            name: todo.name,
                            manufacturer: todo.manufacturer,
                            image: todo.image,
                            price: todo.price,
                            description: todo.description,
                            selected: value ?? false,
                          );
                          // Update the product in the database
                          TodoService.updateTodo(updatedTodo);
                        });
                      },
                    ),

                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('add');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TodoAddScreen(callUpdateUI: updateListUI)),
          );
        },
      ),
    );
  }
}
