import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-bloc.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-state.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo list")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadingState)
            return CircularProgressIndicator();
          else if (state is TodoLoadedState)
            return ListView.builder(
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${todo.userId}'),
                    backgroundColor: Colors.grey,
                  ),
                  title: Text('${todo.userId}'),
                  subtitle: Text(todo.title),
                );
              },
              itemCount: state.todos.length,
            );
          else
            return Center(child: Text("Impossible charger les données"));
        },
      ),
    );
  }
}
