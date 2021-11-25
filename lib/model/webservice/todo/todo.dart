import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(explicitToJson: true)
class Todo {
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;
  @JsonKey(name: 'completed', required: true, includeIfNull: false)
  final bool completed;
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;

  const Todo({
    required this.title,
    required this.completed,
    this.id,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

}
