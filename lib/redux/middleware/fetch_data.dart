import 'dart:convert';

import 'package:anilmastertest/controller/test_controller.dart';
import 'package:anilmastertest/model/to_do.dart';
import 'package:anilmastertest/redux/actions/fetch_action.dart';
import 'package:anilmastertest/redux/app_state.dart';
import 'package:redux/redux.dart';

void fetchTodosMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  // If our Middleware encounters a `FetchTodoAction`
  if (action is FetchTodosAction) {
    // final api = new TodosApi(); // Create our pseudo-api for fetching todos

    // Use the api to fetch the todos
    var res = await TestController().getData();
    print("Fetching data...");
    print(jsonDecode(res).length);
    List<Todo> newTodo = [];
    for (var item in jsonDecode(res)) {
      newTodo.add(new Todo.fromJson(item));
    }
    // If it succeeds, dispatch a success action with the todos.
    // Our reducer will then update the State using these todos.
    store.dispatch(FetchTodosSucceededAction(newTodo));
  }

  // Make sure our actions continue on to the reducer.
  next(action);
}
