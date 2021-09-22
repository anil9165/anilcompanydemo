import 'package:anilmastertest/redux/actions/fetch_action.dart';
import 'package:anilmastertest/redux/app_state.dart';

AppState todosReducer(AppState state, action) {
  if (action is AddTokenAction) {
    return AppState(
        todos: state.todos,
        visibilityFilter: state.visibilityFilter,
        token: action.token,
        // This is the important bit! Set `isFetching` to true so our
        // UI can read this and show a loading spinner
        isFetching: false,
        // Ensure any previous error is removed
        error: null);
  } else if (action is FetchTodosAction) {
    return AppState(
        todos: state.todos,
        visibilityFilter: state.visibilityFilter,

        // This is the important bit! Set `isFetching` to true so our
        // UI can read this and show a loading spinner
        isFetching: true,
        // Ensure any previous error is removed
        error: null);
  } else if (action is FetchTodosSucceededAction) {
    return AppState(
      // Set our todos to the fetched Todos
      todos: action.fetchedTodos,
      // Toggle isFetching to false so our UI will render the todos
      // instead of a loading spinner.
      isFetching: false,
      // Ensure no error exists
      error: null,
      visibilityFilter: state.visibilityFilter,
    );
  } else if (action is FetchTodosFailedAction) {
    return AppState(
      // Set our todos to an empty value
      todos: const [],
      // Toggle isFetching to false
      isFetching: false,
      // Provide the error the state. Your UI can transform this
      // error into an error message, depending on the type of
      // Exception
      error: action.error,
      visibilityFilter: state.visibilityFilter,
    );
  }

  return state;
}
