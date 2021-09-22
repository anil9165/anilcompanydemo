import 'package:anilmastertest/model/to_do.dart';

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);
}



enum VisibilityFilter { showAll, showActive, showCompleted }
