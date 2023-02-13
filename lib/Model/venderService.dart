import 'package:allpartner/Model/imagesCpmpanie/imagesPurchase.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venderService.g.dart';

@JsonSerializable()
class VenderService {
  VenderService({
    required this.service_id,
    required this.service_type,
  });

  final int service_id;
  final String service_type;

  factory VenderService.fromJson(Map<String, dynamic> json) => _$VenderServiceFromJson(json);

  Map<String, dynamic> toJson() => _$VenderServiceToJson(this);
}
