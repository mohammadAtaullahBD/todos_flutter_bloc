import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/model/task.dart';

Future<List<Task>> getTodos() async {
  http.Response res =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (res.statusCode == 200) {
    List x = jsonDecode(res.body);
    List<Task> result = x
        .map((task) => Task(id: task['id'].toString(), title: task['title']))
        .toList();
    return result;
  }

  throw Exception('Server Error!');
}
