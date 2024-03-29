import 'package:json_annotation/json_annotation.dart';

import 'ServiceVender/venderServices.dart';

part 'vendor.g.dart';

@JsonSerializable()
class Vendor {
  Vendor({
    this.id,
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
    this.type,
    this.status,
    this.scrap_services,
    this.logistic_services,
    this.purchase_services,
  });

  int? id;
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
  String? type;
  String? status;
  List<VenderServices>? scrap_services;
  List<VenderServices>? logistic_services;
  List<VenderServices>? purchase_services;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
