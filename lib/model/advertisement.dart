import 'package:json_annotation/json_annotation.dart';

part 'advertisement.g.dart';

@JsonSerializable()
class  Advertisement {
  final String id;
  // ignore: deprecated_member_use
  @JsonKey(nullable: true)
  final String? name;
  final String image;
  final DateTime dateTime;
  Advertisement({
    required this.id,
    this.name,
    required this.image,
    required this.dateTime,
  });

  factory Advertisement.fromJson(Map<String,dynamic> json) => _$AdvertisementFromJson(json);

  Map<String,dynamic> toJson() => _$AdvertisementToJson(this);
}