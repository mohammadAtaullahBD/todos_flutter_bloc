import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task/task_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => TaskBloc()..add(FetchTaskList()),
      ),
    ],
    child: const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TaskBloc, TaskState>(
          builder: (BuildContext context, TaskState state) {
        switch (state) {
          case TaskLoading():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case TaskSuccess():
            return Column(
              children: [
                const Text('Todos:'),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.todoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            BlocProvider.of<TaskBloc>(context)
                                .add(UpdateTaskList(
                              currentTodos: state.todoList,
                              deleteTaskByID: state.todoList[index].id,
                            ));
                          },
                        ),
                        leading: Text(state.todoList[index].id),
                        title: Text(state.todoList[index].title),
                      );
                    },
                  ),
                )
              ],
            );
          case TaskError():
            return const Center(
              child: Text('Network Issu'),
            );
        }
      }),
    );
  }
}
