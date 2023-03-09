import 'package:allpartner/Model/ServiceVender/DetailService/detailServiceVender.dart';
import 'package:allpartner/Model/imagesCpmpanie/imagesPurchase.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venderServices.g.dart';

@JsonSerializable()
class VenderServices {
  VenderServices({
    this.id,
    this.vendor_id,
    this.order_id,
    this.order_type,
    this.service_id,
    this.service_type,
    this.service_detail,
    this.service,
  });

  int? id;
  String? vendor_id;
  String? order_id;
  String? order_type;
  String? service_id;
  String? service_type;
  DetailServiceVender? service_detail;
  DetailServiceVender? service;

  factory VenderServices.fromJson(Map<String, dynamic> json) => _$VenderServicesFromJson(json);

  Map<String, dynamic> toJson() => _$VenderServicesToJson(this);
}
