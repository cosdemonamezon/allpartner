import 'package:allpartner/Model/imagesCpmpanie/imagesPurchase.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ServiceVender/venderServices.dart';

part 'purchase.g.dart';

@JsonSerializable()
class Purchase {
  Purchase({
    this.id,
    this.user_id,
    this.name,
    this.qty,
    this.description,
    this.status,
    this.expire_hour,
    this.created_at,
    this.No,
    this.images,
    this.services,
  });

  int? id;
  String? user_id;
  String? name;
  String? qty;
  String? description;
  String? status;
  String? expire_hour;
  DateTime? created_at;
  int? No;
  List<ImagesPurchase>? images;
  List<VenderServices>? services;

  factory Purchase.fromJson(Map<String, dynamic> json) => _$PurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}
