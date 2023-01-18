// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
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
      No: json['No'] as int?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
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
      'No': instance.No,
    };
