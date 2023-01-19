// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnerVendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerVendor _$PartnerVendorFromJson(Map<String, dynamic> json) =>
    PartnerVendor(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
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
      image: json['image'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => Files.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PartnerVendorToJson(PartnerVendor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
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
      'image': instance.image,
      'status': instance.status,
      'type': instance.type,
      'files': instance.files,
    };
