part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

final class FetchTaskList extends TaskEvent {}

final class UpdateTaskList extends TaskEvent {
  final String deleteTaskByID;
  final List<Task> currentTodos;

  const UpdateTaskList(
      {required this.currentTodos, required this.deleteTaskByID});
}



// final class CreateTaskEvent extends TaskEvent {
//   final Task task;

//   const CreateTaskEvent({required this.task});
// }

// final class EditTaskEvent extends TaskEvent {
//   final Task task;

//   const EditTaskEvent({required this.task});
// }

// final class DeleteTaskEvent extends TaskEvent {
//   final String id;

//   const DeleteTaskEvent({required this.id});
// }
