import 'package:json_annotation/json_annotation.dart';

part 'imagesPurchase.g.dart';

@JsonSerializable()
class ImagesPurchase {
  ImagesPurchase({
    this.id,
    this.purchase_id,
    this.image,
  });

  int? id;
  String? purchase_id;
  String? image;

  factory ImagesPurchase.fromJson(Map<String, dynamic> json) => _$ImagesPurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesPurchaseToJson(this);
}
