abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoErrorState extends TodoState {
  final String message;
  TodoErrorState({required this.message});
}

class TodoSuccessState extends TodoState {
  final String message;

  TodoSuccessState({required this.message});
}
