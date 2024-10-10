// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'localized_message.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalizedMessage {
  @JsonKey(name: 'en', includeIfNull: false)
  final String? en;

  const LocalizedMessage({
    this.en,
  });

  factory LocalizedMessage.fromJson(Map<String, dynamic> json) => _$LocalizedMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizedMessageToJson(this);

}
