import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category{
  final String id;
  final String name;
  final List<String> searchList;
  // ignore: deprecated_member_use
  @JsonKey(nullable: true,defaultValue: false)
  bool? isGrid;

  Category({required this.id,required this.name,this.isGrid,required this.searchList});

  factory Category.fromJson(Map<String,dynamic> json) => _$CategoryFromJson(json);

  Map<String,dynamic> toJson() => _$CategoryToJson(this);
}