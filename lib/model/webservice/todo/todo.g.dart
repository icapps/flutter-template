// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['title', 'completed'],
  );
  return Todo(
    title: json['title'] as String,
    completed: json['completed'] as bool,
    id: (json['id'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
      if (instance.id case final value?) 'id': value,
    };
