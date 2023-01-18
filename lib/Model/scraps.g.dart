// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scraps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scraps _$ScrapsFromJson(Map<String, dynamic> json) => Scraps(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      name: json['name'] as String?,
      qty: json['qty'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ScrapsToJson(Scraps instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'qty': instance.qty,
      'description': instance.description,
      'status': instance.status,
    };
