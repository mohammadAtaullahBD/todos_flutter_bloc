part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  final List<Task> todoList;

  const TaskSuccess({required this.todoList});

  @override
  List<Object> get props => [todoList];
}

final class TaskError extends TaskState {}
