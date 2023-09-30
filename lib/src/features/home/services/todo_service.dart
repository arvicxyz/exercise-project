import 'dart:convert';
import 'dart:isolate';
import 'package:exercise_project/src/constants/api.dart';
import 'package:exercise_project/src/core/logger.dart';
import 'package:exercise_project/src/features/home/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<TodoModel>?> getTodos() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.todoEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<TodoModel> result = (json.decode(response.body)["todos"] as List)
            .map((data) => TodoModel.fromJson(data))
            .toList();
        return result;
      }
    } on Exception catch (e) {
      Logger.logException(e);
    }
    return null;
  }

  void callOnMain() async {
    final resultPort = ReceivePort();
    const jsonString = '[{"name":"java"},{"name":"kotlin"}]';

    await Isolate.spawn(
      jsonDecodeIsolate,
      [resultPort.sendPort, jsonString],
      onError: resultPort.sendPort,
      onExit: resultPort.sendPort,
    );

    resultPort.listen((jsons) {
      if (jsons == null) return;
      for (final json in jsons) {
        print("object : $json");
      }
    });
  }

  Future<void> jsonDecodeIsolate(List<dynamic> args) async {
    final SendPort resultPort = args[0];
    final String jsonData = args[1];

    final data = await json.decode(jsonData);

    // kill isolate and return data
    Isolate.exit(resultPort, data);
  }
}
