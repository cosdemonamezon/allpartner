import 'package:json_annotation/json_annotation.dart';

part 'imagesLogistic.g.dart';

@JsonSerializable()
class ImagesLogistic {
  ImagesLogistic({
    this.id,
    this.logistic_id,
    this.image,
  });

  int? id;
  String? logistic_id;
  String? image;

  factory ImagesLogistic.fromJson(Map<String, dynamic> json) => _$ImagesLogisticFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesLogisticToJson(this);
}
