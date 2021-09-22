import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  Todo({
    this.title,
    this.id,
    this.completed,
  });

  String? title;
  int? id;
  bool? completed;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json["title"],
        id: json["id"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "completed": completed,
      };
}
