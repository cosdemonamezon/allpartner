// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      permission_id: json['permission_id'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      line_token: json['line_token'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      scraps: (json['scraps'] as List<dynamic>?)
          ?.map((e) => Scraps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'permission_id': instance.permission_id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'line_token': instance.line_token,
      'image': instance.image,
      'status': instance.status,
      'type': instance.type,
      'scraps': instance.scraps,
    };
