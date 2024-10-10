// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizedMessage _$LocalizedMessageFromJson(Map<String, dynamic> json) =>
    LocalizedMessage(
      en: json['en'] as String?,
    );

Map<String, dynamic> _$LocalizedMessageToJson(LocalizedMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('en', instance.en);
  return val;
}
