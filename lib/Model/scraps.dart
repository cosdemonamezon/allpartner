import 'package:json_annotation/json_annotation.dart';

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
  });

  int? id;
  String? user_id;
  String? name;
  String? qty;
  String? description;
  String? status;

  factory Scraps.fromJson(Map<String, dynamic> json) => _$ScrapsFromJson(json);

  Map<String, dynamic> toJson() => _$ScrapsToJson(this);
}
