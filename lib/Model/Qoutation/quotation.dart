import 'package:json_annotation/json_annotation.dart';

part 'quotation.g.dart';

@JsonSerializable()
class Quotation {
  Quotation({
    this.id,
    this.user_id,
    this.scrap_companie_id,
    this.title,
    this.remark,
    this.path,
    this.status,
  });

  int? id;
  String? user_id;
  String? scrap_companie_id;
  String? title;
  String? remark;
  String? path;
  String? status;

  factory Quotation.fromJson(Map<String, dynamic> json) => _$QuotationFromJson(json);

  Map<String, dynamic> toJson() => _$QuotationToJson(this);
}
