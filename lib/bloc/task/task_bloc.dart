import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/todos_repository.dart';
import 'package:todo/model/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoading()) {
    on<FetchTaskList>((event, emit) async {
      try {
        List<Task> todos = await getTodos();
        emit(TaskSuccess(todoList: todos));
      } catch (e) {
        emit(TaskError());
      }
    });

    on<UpdateTaskList>((event, emit) {
      List<Task> newTodos = [];
      for (Task todo in event.currentTodos) {
        if (todo.id != event.deleteTaskByID) {
          newTodos.add(todo);
        }
      }
      emit(TaskSuccess(todoList: newTodos));
    });
  }
}
