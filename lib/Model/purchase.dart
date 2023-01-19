import 'package:json_annotation/json_annotation.dart';

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
    this.No,
  });

  int? id;
  String? user_id;
  String? name;
  String? qty;
  String? description;
  String? status;
  int? No;

  factory Purchase.fromJson(Map<String, dynamic> json) => _$PurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}
