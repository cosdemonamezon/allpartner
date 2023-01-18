import 'package:json_annotation/json_annotation.dart';

part 'logistic.g.dart';

@JsonSerializable()
class Logistic {
  Logistic({
    this.id,
    this.user_id,
    this.name,
    this.width,
    this.height,
    this.weight,
    this.qty,
    this.description,
    this.transport_type,
    this.start_lat,
    this.start_lon,
    this.start_location,
    this.end_lat,
    this.end_lon,
    this.end_location,
    this.status,
    this.No,
  });

  int? id;
  String? user_id;
  String? name;
  String? width;
  String? height;
  String? weight;
  String? qty;
  String? description;
  String? transport_type;
  String? start_lat;
  String? start_lon;
  String? start_location;
  String? end_lat;
  String? end_lon;
  String? end_location;
  String? status;
  int? No;

  factory Logistic.fromJson(Map<String, dynamic> json) => _$LogisticFromJson(json);

  Map<String, dynamic> toJson() => _$LogisticToJson(this);
}
