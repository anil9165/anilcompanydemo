import 'package:anilmastertest/redux/app_state.dart';
import 'package:anilmastertest/redux/middleware/fetch_data.dart';
import 'package:anilmastertest/redux/reducers/todo_reducer.dart';
import 'package:redux/redux.dart';

final store = Store<AppState>(todosReducer,
    initialState: AppState(), middleware: [fetchTodosMiddleware]);
