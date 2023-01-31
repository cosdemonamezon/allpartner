import 'package:json_annotation/json_annotation.dart';

part 'detailVendor.g.dart';

@JsonSerializable()
class DetailVendor {
  DetailVendor({
    this.id,
    this.name,
    this.description,
    this.status,
    this.isChecked = false,
    this.No,
  });

  int? id;
  String? name;
  String? description;
  String? status;
  bool? isChecked;
  int? No;

  factory DetailVendor.fromJson(Map<String, dynamic> json) => _$DetailVendorFromJson(json);

  Map<String, dynamic> toJson() => _$DetailVendorToJson(this);
}
