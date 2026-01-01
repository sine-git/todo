import 'package:flutter/material.dart';
import 'package:todo_flutter/cores/mixins/action-state.dart';
import 'package:todo_flutter/features/todo/presentation/bloc/todo-state.dart';

void showMessage(BuildContext context, ActionState state) {
  final color = state is TodoActionSuccessState
      ? Theme.of(context).colorScheme.onTertiary
      : Theme.of(context).colorScheme.onError;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(state.message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
    ),
  );
}
