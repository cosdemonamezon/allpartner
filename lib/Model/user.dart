import 'package:allpartner/Model/Qoutation/quotation.dart';
import 'package:allpartner/Model/partnerVendor.dart';
import 'package:allpartner/Model/purchase.dart';
import 'package:allpartner/Model/scraps.dart';
import 'package:json_annotation/json_annotation.dart';

import 'logistic.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(
      {this.id,
      this.permission_id,
      this.username,
      this.name,
      this.email,
      this.phone,
      this.line_token,
      this.image,
      this.status,
      this.type,
      this.qoutations,
      this.scraps,
      this.logistics,
      this.partner_detail});

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
  List<Quotation>? qoutations;
  List<Scraps>? scraps;
  List<Logistic>? logistics;
  List<Purchase>? puchases;
  PartnerVendor? partner_detail;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
