import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/features/todo/presentation/pages/todo.page.dart';

GoRouter allRoutes = GoRouter(
  routes: [GoRoute(path: '', builder: (context, state) => TodoPage())],
);
