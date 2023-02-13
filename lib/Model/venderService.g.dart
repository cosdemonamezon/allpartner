// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venderService.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenderService _$VenderServiceFromJson(Map<String, dynamic> json) =>
    VenderService(
      service_id: json['service_id'] as int,
      service_type: json['service_type'] as String,
    );

Map<String, dynamic> _$VenderServiceToJson(VenderService instance) =>
    <String, dynamic>{
      'service_id': instance.service_id,
      'service_type': instance.service_type,
    };
