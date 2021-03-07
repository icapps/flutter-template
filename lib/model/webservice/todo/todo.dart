import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(name: 'title', required: true)
  final String title;
  @JsonKey(name: 'completed', required: true)
  final bool completed;
  @JsonKey(name: 'id')
  final int? id;

  Todo({
    required this.title,
    required this.completed,
    this.id,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

}
