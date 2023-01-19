import 'package:json_annotation/json_annotation.dart';

part 'files.g.dart';

@JsonSerializable()
class Files {
  Files({this.id, this.vendor_id, this.image, x});

  int? id;
  String? vendor_id;
  String? image;

  factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);

  Map<String, dynamic> toJson() => _$FilesToJson(this);
}
