// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessListing _$$_BusinessListingFromJson(Map<String, dynamic> json) =>
    _$_BusinessListing(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      businessAddress: json['businessAddress'] as String,
      state: json['state'] as String? ?? 'All States',
      township: json['township'] as String,
      categoryID: json['categoryID'] as String,
      contactPersonName: json['contactPersonName'] as String,
      contactPhoneNumer: json['contactPhoneNumer'] as String,
      contactEmail: json['contactEmail'] as String?,
      businessLogo:
          ImageItem.fromJson(json['businessLogo'] as Map<String, dynamic>),
      geoPoint: (json['geoPoint'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isGrid: json['isGrid'] as bool? ?? false,
      searchList: (json['searchList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_BusinessListingToJson(_$_BusinessListing instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'website': instance.website,
      'businessAddress': instance.businessAddress,
      'state': instance.state,
      'township': instance.township,
      'categoryID': instance.categoryID,
      'contactPersonName': instance.contactPersonName,
      'contactPhoneNumer': instance.contactPhoneNumer,
      'contactEmail': instance.contactEmail,
      'businessLogo': instance.businessLogo.toJson(),
      'geoPoint': instance.geoPoint,
      'isGrid': instance.isGrid,
      'searchList': instance.searchList,
    };
