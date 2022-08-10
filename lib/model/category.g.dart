// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      name: json['name'] as String,
      isGrid: json['isGrid'] as bool? ?? false,
      searchList: (json['searchList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'searchList': instance.searchList,
      'isGrid': instance.isGrid,
      'image': instance.image,
    };
