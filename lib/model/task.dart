class Task {
  final String id;
  final String title;
  final String description;

  Task({required this.id, required this.title, this.description = ''});

  @override
  String toString() {
    return 'Task ID: $id';
  }
}
