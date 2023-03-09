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
      expire_hour: json['expire_hour'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      No: json['No'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesScrap.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => VenderServices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScrapsToJson(Scraps instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'qty': instance.qty,
      'description': instance.description,
      'status': instance.status,
      'expire_hour': instance.expire_hour,
      'created_at': instance.created_at?.toIso8601String(),
      'No': instance.No,
      'images': instance.images,
      'services': instance.services,
    };
