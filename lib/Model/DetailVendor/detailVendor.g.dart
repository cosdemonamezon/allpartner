// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailVendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailVendor _$DetailVendorFromJson(Map<String, dynamic> json) => DetailVendor(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      isChecked: json['isChecked'] as bool? ?? false,
      No: json['No'] as int?,
    );

Map<String, dynamic> _$DetailVendorToJson(DetailVendor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'isChecked': instance.isChecked,
      'No': instance.No,
    };
