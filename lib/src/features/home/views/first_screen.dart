import 'package:exercise_project/src/constants/dimens.dart';
import 'package:exercise_project/src/features/home/models/todo_model.dart';
import 'package:exercise_project/src/features/home/view_models/home_view_model.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late HomeViewModel _viewModel;
  late Future<List<TodoModel>?> _futureTodo;

  @override
  void initState() {
    _viewModel = HomeViewModel();
    _futureTodo = _viewModel.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<TodoModel>?>(
          future: _futureTodo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final todos = snapshot.data!;
              return buildTodoList(todos);
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildTodoList(List<TodoModel> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: ((context, index) {
        final todo = todos[index];
        return Container(
          color: Colors.grey.shade300,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: todo.completed
                    ? Container(
                        color: Colors.green,
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        color: Colors.red,
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
              ),
              const SizedBox(width: kDefaultWidgetSpacing),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    todo.todo,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
