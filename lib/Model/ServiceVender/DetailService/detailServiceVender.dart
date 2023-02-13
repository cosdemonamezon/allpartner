import 'package:allpartner/Model/imagesCpmpanie/imagesPurchase.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detailServiceVender.g.dart';

@JsonSerializable()
class DetailServiceVender {
  DetailServiceVender({
    this.id,
    this.name,
    this.description,
    this.status,
  });

  int? id;
  String? name;
  String? description;
  String? status;

  factory DetailServiceVender.fromJson(Map<String, dynamic> json) => _$DetailServiceVenderFromJson(json);

  Map<String, dynamic> toJson() => _$DetailServiceVenderToJson(this);
}
