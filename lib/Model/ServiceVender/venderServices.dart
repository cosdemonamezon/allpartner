import 'package:allpartner/Model/ServiceVender/DetailService/detailServiceVender.dart';
import 'package:allpartner/Model/imagesCpmpanie/imagesPurchase.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venderServices.g.dart';

@JsonSerializable()
class VenderServices {
  VenderServices({
    this.id,
    this.vendor_id,
    this.service_id,
    this.service_type,
    this.service_detail,
  });

  int? id;
  String? vendor_id;
  String? service_id;
  String? service_type;
  DetailServiceVender? service_detail;

  factory VenderServices.fromJson(Map<String, dynamic> json) => _$VenderServicesFromJson(json);

  Map<String, dynamic> toJson() => _$VenderServicesToJson(this);
}
