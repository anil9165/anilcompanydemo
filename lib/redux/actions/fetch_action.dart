import 'package:anilmastertest/model/to_do.dart';

class FetchTodosAction {}

class FetchTodosSucceededAction {
  final List<Todo> fetchedTodos;

  FetchTodosSucceededAction(this.fetchedTodos);
}

class FetchTodosFailedAction {
  final Exception error;

  FetchTodosFailedAction(this.error);
}

class AddTokenAction {
  final String? token;

  AddTokenAction(this.token);
}
