import 'dart:convert';
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
}
