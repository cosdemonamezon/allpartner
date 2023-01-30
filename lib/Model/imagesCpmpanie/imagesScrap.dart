import 'package:json_annotation/json_annotation.dart';

part 'imagesScrap.g.dart';

@JsonSerializable()
class ImagesScrap {
  ImagesScrap({
    this.id,
    this.scrap_id,
    this.image,
  });

  int? id;
  String? scrap_id;
  String? image;

  factory ImagesScrap.fromJson(Map<String, dynamic> json) => _$ImagesScrapFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesScrapToJson(this);
}
