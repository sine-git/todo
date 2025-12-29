import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-bloc.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-state.dart';
import 'package:todo_flutter/features/todo/presentation/widgets/todo-modal.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo list")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadingState)
            return Center(child: CircularProgressIndicator());
          else if (state is TodoLoadedState)
            return ListView.builder(
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  /*  leading: CircleAvatar(
                    child: Text('${todo.id}'),
                    backgroundColor: Colors.grey,
                  ), */
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          TodoModal(title: "Update Todo", todo: todo),
                    );
                  },
                  title: Text(
                    'User ${todo.userId}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(todo.title),
                  trailing: Chip(
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                    label: Text(
                      todo.completed ? "Completed" : "On going",
                      style: TextStyle(
                        color: todo.completed
                            ? Theme.of(context).colorScheme.onTertiary
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    backgroundColor: todo.completed
                        ? Theme.of(
                            context,
                          ).colorScheme.onTertiary.withValues(alpha: 0.1)
                        : Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1),
                  ),
                  //Checkbox(value: todo.completed, onChanged: null),
                );
              },
              itemCount: state.todos.length,
            );
          else
            return Center(child: Text("Impossible charger les données"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TodoModal(title: "Create Todo"),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
