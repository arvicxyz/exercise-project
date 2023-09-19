class TodoModel {
  late int id;
  late String todo;
  late bool completed;
  late int userId;

  TodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}
