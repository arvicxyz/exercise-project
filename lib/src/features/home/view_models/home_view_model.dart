import 'package:exercise_project/src/core/data_storage.dart';
import 'package:exercise_project/src/features/home/models/todo_model.dart';
import 'package:exercise_project/src/features/home/services/todo_service.dart';

class HomeViewModel {
  late TodoService _todoService;

  HomeViewModel() {
    _todoService = TodoService();
  }

  Future<List<TodoModel>?> getTodos() async {
    return await _todoService.getTodos();
  }

  void setInputText(String inputText) {
    DataStorage.instance.write(DataStorage.inputTextKey, inputText);
  }

  String? getInputText() {
    var text = DataStorage.instance.read<String>(DataStorage.inputTextKey);
    return text;
  }

  String reverseString(String input) {
    var result = "";
    for (int i = input.length - 1; i > -1; i--) {
      result += input[i];
    }
    return result;
  }
}
