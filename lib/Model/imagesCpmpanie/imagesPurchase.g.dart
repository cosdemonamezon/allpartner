// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagesPurchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesPurchase _$ImagesPurchaseFromJson(Map<String, dynamic> json) =>
    ImagesPurchase(
      id: json['id'] as int?,
      purchase_id: json['purchase_id'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ImagesPurchaseToJson(ImagesPurchase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchase_id': instance.purchase_id,
      'image': instance.image,
    };
