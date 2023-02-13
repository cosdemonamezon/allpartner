// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailServiceVender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailServiceVender _$DetailServiceVenderFromJson(Map<String, dynamic> json) =>
    DetailServiceVender(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DetailServiceVenderToJson(
        DetailServiceVender instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };
