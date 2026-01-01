import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/cores/utils/functions.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-bloc.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-event.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-state.dart';
import 'package:todo_flutter/features/todo/presentation/widgets/todo-modal.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo list")),
      body: RefreshIndicator(
        onRefresh: () async {
          /*  await context.read<TodoBloc>()
            ..add(TodoFindAllEvent()); */
        },
        child: BlocConsumer<TodoBloc, TodoState>(
          listenWhen: (previous, current) =>
              current is TodoLoadingState ||
              previous is TodoInitialState ||
              current is TodoInitialState ||
              current is TodoLoadedState ||
              current is TodoActionSuccessState ||
              current is TodoErrorState,
          listener: (context, state) {
            if (state is TodoActionLoadingState) {
              showDialog(
                context: context,
                builder: (context) =>
                    Center(child: CircularProgressIndicator()),
              );
            }
            if (state is TodoActionSuccessState) {
              showMessage(context, state);
              context.read<TodoBloc>()..add(TodoFindAllEvent());
            }

            if (state is TodoActionErrorState) showMessage(context, state);
          },
          buildWhen: (previous, current) =>
              //current is TodoLoadingState ||
              previous is TodoInitialState ||
              current is TodoInitialState ||
              current is TodoLoadedState ||
              current is TodoActionSuccessState ||
              current is TodoErrorState,
          //current is TodoErrorState ||
          //current is TodoInitialState
          builder: (context, state) {
            final bloc = context.read<TodoBloc>();
            if (state is TodoLoadingState || state is TodoActionLoadingState)
              return Center(child: CircularProgressIndicator());
            if (state is TodoLoadedState)
              return ListView.builder(
                itemBuilder: (context, index) {
                  final todo = state.todos[index];
                  return Dismissible(
                    key: GlobalKey(),
                    onDismissed: (direction) {
                      context.read<TodoBloc>()
                        ..add(TodoDeleteEvent(id: todo.id!));
                    },
                    onUpdate: (details) {},
                    confirmDismiss: (details) async {
                      (direction) {
                        if (state is TodoActionSuccessState) return true;
                        if (state is TodoErrorState) {}
                        return true;
                      };
                      return false;
                    },
                    child: ListTile(
                      /*  leading: CircleAvatar(
                            child: Text('${todo.id}'),
                            backgroundColor: Colors.grey,
                          ), */
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return BlocProvider.value(
                              value: bloc,
                              child: TodoModal(
                                title: "Update Todo",
                                todo: todo,
                              ),
                            );
                          },
                        );
                      },
                      title: Text(
                        'User ${todo.userId}',
                        style: TextStyle(fontWeight: FontWeight.w200),
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
                    ),
                  );
                },
                itemCount: state.todos.length,
              );
            if (state is TodoErrorState)
              return Center(child: Text("Impossible charger les données"));
            return SizedBox.shrink();
          },
        ),
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
