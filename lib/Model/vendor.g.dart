// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vendor _$VendorFromJson(Map<String, dynamic> json) => Vendor(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      tax: json['tax'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      address3: json['address3'] as String?,
      country: json['country'] as String?,
      postcode: json['postcode'] as String?,
      fax: json['fax'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      scrap_services: (json['scrap_services'] as List<dynamic>?)
          ?.map((e) => VenderServices.fromJson(e as Map<String, dynamic>))
          .toList(),
      logistic_services: (json['logistic_services'] as List<dynamic>?)
          ?.map((e) => VenderServices.fromJson(e as Map<String, dynamic>))
          .toList(),
      purchase_services: (json['purchase_services'] as List<dynamic>?)
          ?.map((e) => VenderServices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'tax': instance.tax,
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'country': instance.country,
      'postcode': instance.postcode,
      'fax': instance.fax,
      'type': instance.type,
      'status': instance.status,
      'scrap_services': instance.scrap_services,
      'logistic_services': instance.logistic_services,
      'purchase_services': instance.purchase_services,
    };
