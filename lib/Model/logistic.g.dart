// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Logistic _$LogisticFromJson(Map<String, dynamic> json) => Logistic(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      name: json['name'] as String?,
      width: json['width'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      qty: json['qty'] as String?,
      description: json['description'] as String?,
      transport_type: json['transport_type'] as String?,
      start_lat: json['start_lat'] as String?,
      start_lon: json['start_lon'] as String?,
      start_location: json['start_location'] as String?,
      end_lat: json['end_lat'] as String?,
      end_lon: json['end_lon'] as String?,
      end_location: json['end_location'] as String?,
      status: json['status'] as String?,
      No: json['No'] as int?,
      expire_hour: json['expire_hour'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesLogistic.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => VenderServices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LogisticToJson(Logistic instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'weight': instance.weight,
      'qty': instance.qty,
      'description': instance.description,
      'transport_type': instance.transport_type,
      'start_lat': instance.start_lat,
      'start_lon': instance.start_lon,
      'start_location': instance.start_location,
      'end_lat': instance.end_lat,
      'end_lon': instance.end_lon,
      'end_location': instance.end_location,
      'status': instance.status,
      'expire_hour': instance.expire_hour,
      'created_at': instance.created_at?.toIso8601String(),
      'No': instance.No,
      'images': instance.images,
      'services': instance.services,
    };
