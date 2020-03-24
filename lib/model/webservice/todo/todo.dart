import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(name: 'id', required: true)
  final int id;
  @JsonKey(name: 'title', required: true)
  final String title;
  @JsonKey(name: 'completed', required: true)
  final bool completed;

  Todo({
    @required this.id,
    @required this.title,
    @required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

}
