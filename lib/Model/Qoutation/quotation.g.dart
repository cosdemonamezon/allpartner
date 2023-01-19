// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quotation _$QuotationFromJson(Map<String, dynamic> json) => Quotation(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      scrap_companie_id: json['scrap_companie_id'] as String?,
      title: json['title'] as String?,
      remark: json['remark'] as String?,
      path: json['path'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$QuotationToJson(Quotation instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'scrap_companie_id': instance.scrap_companie_id,
      'title': instance.title,
      'remark': instance.remark,
      'path': instance.path,
      'status': instance.status,
    };
