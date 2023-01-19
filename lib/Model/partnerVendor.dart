import 'package:allpartner/Model/files/files.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partnerVendor.g.dart';

@JsonSerializable()
class PartnerVendor {
  PartnerVendor({
    this.id,
    this.user_id,
    this.name,
    this.email,
    this.phone,
    this.tax,
    this.address1,
    this.address2,
    this.address3,
    this.country,
    this.postcode,
    this.fax,
    this.image,
    this.status,
    this.type,
    this.files,
  });

  int? id;
  String? user_id;
  String? name;
  String? email;
  String? phone;
  String? tax;
  String? address1;
  String? address2;
  String? address3;
  String? country;
  String? postcode;
  String? fax;
  String? image;
  String? status;
  String? type;
  List<Files>? files;

  factory PartnerVendor.fromJson(Map<String, dynamic> json) => _$PartnerVendorFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerVendorToJson(this);
}
