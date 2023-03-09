// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venderServices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenderServices _$VenderServicesFromJson(Map<String, dynamic> json) =>
    VenderServices(
      id: json['id'] as int?,
      vendor_id: json['vendor_id'] as String?,
      order_id: json['order_id'] as String?,
      order_type: json['order_type'] as String?,
      service_id: json['service_id'] as String?,
      service_type: json['service_type'] as String?,
      service_detail: json['service_detail'] == null
          ? null
          : DetailServiceVender.fromJson(
              json['service_detail'] as Map<String, dynamic>),
      service: json['service'] == null
          ? null
          : DetailServiceVender.fromJson(
              json['service'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VenderServicesToJson(VenderServices instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendor_id': instance.vendor_id,
      'order_id': instance.order_id,
      'order_type': instance.order_type,
      'service_id': instance.service_id,
      'service_type': instance.service_type,
      'service_detail': instance.service_detail,
      'service': instance.service,
    };
