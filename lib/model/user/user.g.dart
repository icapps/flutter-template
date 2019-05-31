// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['id'] as int, json['name'] as String, json['email'] as String, json['username'] as String, Address.fromJson(json['address'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name, 'email': instance.email, 'username': instance.username, 'address': instance.address};
