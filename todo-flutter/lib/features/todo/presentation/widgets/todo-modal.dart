// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/cores/widget/outlined-text-field.dart';

import 'package:todo_flutter/features/todo/domain/entities/todo-entity.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-bloc.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-event.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-state.dart';

class TodoModal extends StatefulWidget {
  final String title;
  final TodoEntity? todo;
  const TodoModal({Key? key, required this.title, this.todo}) : super(key: key);

  @override
  State<TodoModal> createState() => _TodoModalState();
}

class _TodoModalState extends State<TodoModal> {
  late final TextEditingController titleController;
  late final TextEditingController userIdController;
  late bool completed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    userIdController = TextEditingController();

    titleController.text = widget?.todo?.title ?? "";
    userIdController.text = "${widget?.todo?.userId ?? ""}";

    completed = widget?.todo?.completed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AlertDialog(
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedTextField(
                  //keyboardType: TextInputType.numberWithOptions(),
                  initialValue: widget?.todo?.title ?? "",
                  label: "Title",
                  placeholder: "Title",
                  controller: titleController,
                  onChanged: (value) {
                    titleController.text = value;
                  },
                  validator: (value) =>
                      value != "" ? null : "Ce champ est obligatoire",
                ),
                OutlinedTextField(
                  initialValue: '${widget?.todo?.userId ?? ""}',
                  keyboardType: TextInputType.numberWithOptions(),
                  label: "UserId",
                  placeholder: "UserId",
                  controller: userIdController,
                  onChanged: (value) {
                    userIdController.text = value;
                  },
                  validator: (value) =>
                      value != "" ? null : "Ce champ est obligatoire",
                ),
                ListTile(
                  title: Text("Completed"),
                  trailing: Checkbox(
                    value: completed,
                    onChanged: (value) {
                      setState(() {
                        completed = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text("Annuler", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        BlocConsumer<TodoBloc, TodoState>(
          listenWhen: (previous, current) =>
              current is TodoActionSuccessState ||
              current is TodoActionLoadingState ||
              current is TodoActionErrorState,
          listener: (context, state) {
            if (state is TodoActionLoadingState) {
              showDialog(
                context: context,
                builder: (context) =>
                    Center(child: CircularProgressIndicator()),
              );
            }
            if (state is TodoActionSuccessState) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                ),
              );
              context.pop();
            }

            if (state is TodoActionErrorState) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              context.pop();
            }
          },
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  TodoEntity todo = TodoEntity(
                    id: widget!.todo!.id ?? null,
                    userId: int.tryParse(userIdController.text) ?? 0,
                    title: titleController.text,
                    completed: completed,
                  );
                  print(
                    "The Skill is ${todo}",
                  ); //              //context.read<TodoBloc>().add(TodoCreateEvent(todoEntity: todo));
                  context.read<TodoBloc>()..add(
                    todo.id == null
                        ? TodoCreateEvent(todoEntity: todo)
                        : TodoUpdateEvent(todoEntity: todo),
                  );
                  // final state = context.read<TodoBloc>().state;
                }
              },
              child: Text(
                widget.todo?.id == null ? "Save" : "Update",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ],
    );
  }
}
