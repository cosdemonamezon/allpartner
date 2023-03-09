import 'package:allpartner/Model/imagesCpmpanie/imagesScrap.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ServiceVender/venderServices.dart';

part 'scraps.g.dart';

@JsonSerializable()
class Scraps {
  Scraps({
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
  List<ImagesScrap>? images;
  List<VenderServices>? services;

  factory Scraps.fromJson(Map<String, dynamic> json) => _$ScrapsFromJson(json);

  Map<String, dynamic> toJson() => _$ScrapsToJson(this);
}
