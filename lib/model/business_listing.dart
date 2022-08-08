import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_listing.freezed.dart';
part 'business_listing.g.dart';

@freezed
class BusinessListing with _$BusinessListing {
  factory BusinessListing({
    required String name,
    @JsonKey(nullable: true)
    String? phoneNumber,
    @JsonKey(nullable: true)
    String? email,
    @JsonKey(nullable: true)
    String? website,
    required String businessAddress,
    @JsonKey(nullable: true,defaultValue: "All States")
    String? state,
    required String township,
    required String categoryID,
    required String contactPersonName,
    required String contactPhoneNumer,
    @JsonKey(nullable: true)
    String? contactEmail,
    @JsonKey(nullable: true)
    String? businessLogo,
    @JsonKey(nullable: true)
    List<String>? geoPoint,
    @JsonKey(nullable: true,defaultValue: false)
    bool? isGrid,
    required List<String> searchList,
  }) = _BusinessListing;

  factory BusinessListing.fromJson(Map<String,dynamic> json) => _$BusinessListingFromJson(json);

}