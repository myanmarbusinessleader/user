import 'package:json_annotation/json_annotation.dart';

part 'image_item.g.dart';

@JsonSerializable()
class ImageItem{
  final String imagePath;
  final int height;
  final int width;
  ImageItem({
    required this.imagePath,
    required this.height,
    required this.width,
  });

  factory ImageItem.fromJson(Map<String,dynamic> json) => _$ImageItemFromJson(json);
  Map<String,dynamic> toJson() => _$ImageItemToJson(this);
}