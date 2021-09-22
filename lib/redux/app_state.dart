import 'package:anilmastertest/model/to_do.dart';
import 'package:anilmastertest/redux/actions/todo_actions.dart';

class AppState {
  List<Todo> todos;
  VisibilityFilter visibilityFilter;
  bool isFetching;
  Exception? error;
  String? token;
  int? page;

  AppState(
      {this.todos = const [],
      this.visibilityFilter = VisibilityFilter.showAll,
      this.isFetching = false,
      this.error,
      this.token,
      this.page = 1});
}
