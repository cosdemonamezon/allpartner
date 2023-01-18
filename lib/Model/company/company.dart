import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  Company({
    this.id,
    this.permission_id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.line_token,
    this.image,
    this.status,
    this.type,
    this.No,
  });

  int? id;
  String? permission_id;
  String? username;
  String? name;
  String? email;
  String? phone;
  String? line_token;
  String? image;
  String? status;
  String? type;
  int? No;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
