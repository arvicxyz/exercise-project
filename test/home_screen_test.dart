import 'package:exercise_project/src/features/home/services/todo_service.dart';
import 'package:exercise_project/src/features/home/view_models/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Api: Todo item count should be greater than 0', () async {
    final todoService = TodoService();

    var list = await todoService.getTodos();

    expect(list?.length, greaterThan(0));
  });

  test('Input text value should be reversed', () {
    final homeViewModel = HomeViewModel();

    var inputText = "Racer";
    var reverseText = homeViewModel.reverseString(inputText);

    expect(reverseText, "recaR");
  });
}
