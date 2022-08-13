// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'business_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusinessListing _$BusinessListingFromJson(Map<String, dynamic> json) {
  return _BusinessListing.fromJson(json);
}

/// @nodoc
mixin _$BusinessListing {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(nullable: true)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(nullable: true)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(nullable: true)
  String? get website => throw _privateConstructorUsedError;
  String get businessAddress => throw _privateConstructorUsedError;
  @JsonKey(nullable: true, defaultValue: "All States")
  String? get state => throw _privateConstructorUsedError;
  String get township => throw _privateConstructorUsedError;
  String get categoryID => throw _privateConstructorUsedError;
  String get contactPersonName => throw _privateConstructorUsedError;
  String get contactPhoneNumer => throw _privateConstructorUsedError;
  @JsonKey(nullable: true)
  String? get contactEmail => throw _privateConstructorUsedError;
  ImageItem get businessLogo => throw _privateConstructorUsedError;
  @JsonKey(nullable: true)
  List<String>? get geoPoint => throw _privateConstructorUsedError;
  @JsonKey(nullable: true, defaultValue: false)
  bool? get isGrid => throw _privateConstructorUsedError;
  List<String> get searchList => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessListingCopyWith<BusinessListing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessListingCopyWith<$Res> {
  factory $BusinessListingCopyWith(
          BusinessListing value, $Res Function(BusinessListing) then) =
      _$BusinessListingCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @JsonKey(nullable: true) String? phoneNumber,
      @JsonKey(nullable: true) String? email,
      @JsonKey(nullable: true) String? website,
      String businessAddress,
      @JsonKey(nullable: true, defaultValue: "All States") String? state,
      String township,
      String categoryID,
      String contactPersonName,
      String contactPhoneNumer,
      @JsonKey(nullable: true) String? contactEmail,
      ImageItem businessLogo,
      @JsonKey(nullable: true) List<String>? geoPoint,
      @JsonKey(nullable: true, defaultValue: false) bool? isGrid,
      List<String> searchList,
      DateTime dateTime});
}

/// @nodoc
class _$BusinessListingCopyWithImpl<$Res>
    implements $BusinessListingCopyWith<$Res> {
  _$BusinessListingCopyWithImpl(this._value, this._then);

  final BusinessListing _value;
  // ignore: unused_field
  final $Res Function(BusinessListing) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? businessAddress = freezed,
    Object? state = freezed,
    Object? township = freezed,
    Object? categoryID = freezed,
    Object? contactPersonName = freezed,
    Object? contactPhoneNumer = freezed,
    Object? contactEmail = freezed,
    Object? businessLogo = freezed,
    Object? geoPoint = freezed,
    Object? isGrid = freezed,
    Object? searchList = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAddress: businessAddress == freezed
          ? _value.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      township: township == freezed
          ? _value.township
          : township // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: categoryID == freezed
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      contactPersonName: contactPersonName == freezed
          ? _value.contactPersonName
          : contactPersonName // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhoneNumer: contactPhoneNumer == freezed
          ? _value.contactPhoneNumer
          : contactPhoneNumer // ignore: cast_nullable_to_non_nullable
              as String,
      contactEmail: contactEmail == freezed
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLogo: businessLogo == freezed
          ? _value.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as ImageItem,
      geoPoint: geoPoint == freezed
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isGrid: isGrid == freezed
          ? _value.isGrid
          : isGrid // ignore: cast_nullable_to_non_nullable
              as bool?,
      searchList: searchList == freezed
          ? _value.searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_BusinessListingCopyWith<$Res>
    implements $BusinessListingCopyWith<$Res> {
  factory _$$_BusinessListingCopyWith(
          _$_BusinessListing value, $Res Function(_$_BusinessListing) then) =
      __$$_BusinessListingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(nullable: true) String? phoneNumber,
      @JsonKey(nullable: true) String? email,
      @JsonKey(nullable: true) String? website,
      String businessAddress,
      @JsonKey(nullable: true, defaultValue: "All States") String? state,
      String township,
      String categoryID,
      String contactPersonName,
      String contactPhoneNumer,
      @JsonKey(nullable: true) String? contactEmail,
      ImageItem businessLogo,
      @JsonKey(nullable: true) List<String>? geoPoint,
      @JsonKey(nullable: true, defaultValue: false) bool? isGrid,
      List<String> searchList,
      DateTime dateTime});
}

/// @nodoc
class __$$_BusinessListingCopyWithImpl<$Res>
    extends _$BusinessListingCopyWithImpl<$Res>
    implements _$$_BusinessListingCopyWith<$Res> {
  __$$_BusinessListingCopyWithImpl(
      _$_BusinessListing _value, $Res Function(_$_BusinessListing) _then)
      : super(_value, (v) => _then(v as _$_BusinessListing));

  @override
  _$_BusinessListing get _value => super._value as _$_BusinessListing;

  @override
  $Res call({
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? businessAddress = freezed,
    Object? state = freezed,
    Object? township = freezed,
    Object? categoryID = freezed,
    Object? contactPersonName = freezed,
    Object? contactPhoneNumer = freezed,
    Object? contactEmail = freezed,
    Object? businessLogo = freezed,
    Object? geoPoint = freezed,
    Object? isGrid = freezed,
    Object? searchList = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$_BusinessListing(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAddress: businessAddress == freezed
          ? _value.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      township: township == freezed
          ? _value.township
          : township // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: categoryID == freezed
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      contactPersonName: contactPersonName == freezed
          ? _value.contactPersonName
          : contactPersonName // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhoneNumer: contactPhoneNumer == freezed
          ? _value.contactPhoneNumer
          : contactPhoneNumer // ignore: cast_nullable_to_non_nullable
              as String,
      contactEmail: contactEmail == freezed
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLogo: businessLogo == freezed
          ? _value.businessLogo
          : businessLogo // ignore: cast_nullable_to_non_nullable
              as ImageItem,
      geoPoint: geoPoint == freezed
          ? _value._geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isGrid: isGrid == freezed
          ? _value.isGrid
          : isGrid // ignore: cast_nullable_to_non_nullable
              as bool?,
      searchList: searchList == freezed
          ? _value._searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BusinessListing implements _BusinessListing {
  _$_BusinessListing(
      {required this.name,
      @JsonKey(nullable: true) this.phoneNumber,
      @JsonKey(nullable: true) this.email,
      @JsonKey(nullable: true) this.website,
      required this.businessAddress,
      @JsonKey(nullable: true, defaultValue: "All States") this.state,
      required this.township,
      required this.categoryID,
      required this.contactPersonName,
      required this.contactPhoneNumer,
      @JsonKey(nullable: true) this.contactEmail,
      required this.businessLogo,
      @JsonKey(nullable: true) final List<String>? geoPoint,
      @JsonKey(nullable: true, defaultValue: false) this.isGrid,
      required final List<String> searchList,
      required this.dateTime})
      : _geoPoint = geoPoint,
        _searchList = searchList;

  factory _$_BusinessListing.fromJson(Map<String, dynamic> json) =>
      _$$_BusinessListingFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(nullable: true)
  final String? phoneNumber;
  @override
  @JsonKey(nullable: true)
  final String? email;
  @override
  @JsonKey(nullable: true)
  final String? website;
  @override
  final String businessAddress;
  @override
  @JsonKey(nullable: true, defaultValue: "All States")
  final String? state;
  @override
  final String township;
  @override
  final String categoryID;
  @override
  final String contactPersonName;
  @override
  final String contactPhoneNumer;
  @override
  @JsonKey(nullable: true)
  final String? contactEmail;
  @override
  final ImageItem businessLogo;
  final List<String>? _geoPoint;
  @override
  @JsonKey(nullable: true)
  List<String>? get geoPoint {
    final value = _geoPoint;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(nullable: true, defaultValue: false)
  final bool? isGrid;
  final List<String> _searchList;
  @override
  List<String> get searchList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchList);
  }

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'BusinessListing(name: $name, phoneNumber: $phoneNumber, email: $email, website: $website, businessAddress: $businessAddress, state: $state, township: $township, categoryID: $categoryID, contactPersonName: $contactPersonName, contactPhoneNumer: $contactPhoneNumer, contactEmail: $contactEmail, businessLogo: $businessLogo, geoPoint: $geoPoint, isGrid: $isGrid, searchList: $searchList, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessListing &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.website, website) &&
            const DeepCollectionEquality()
                .equals(other.businessAddress, businessAddress) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.township, township) &&
            const DeepCollectionEquality()
                .equals(other.categoryID, categoryID) &&
            const DeepCollectionEquality()
                .equals(other.contactPersonName, contactPersonName) &&
            const DeepCollectionEquality()
                .equals(other.contactPhoneNumer, contactPhoneNumer) &&
            const DeepCollectionEquality()
                .equals(other.contactEmail, contactEmail) &&
            const DeepCollectionEquality()
                .equals(other.businessLogo, businessLogo) &&
            const DeepCollectionEquality().equals(other._geoPoint, _geoPoint) &&
            const DeepCollectionEquality().equals(other.isGrid, isGrid) &&
            const DeepCollectionEquality()
                .equals(other._searchList, _searchList) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(website),
      const DeepCollectionEquality().hash(businessAddress),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(township),
      const DeepCollectionEquality().hash(categoryID),
      const DeepCollectionEquality().hash(contactPersonName),
      const DeepCollectionEquality().hash(contactPhoneNumer),
      const DeepCollectionEquality().hash(contactEmail),
      const DeepCollectionEquality().hash(businessLogo),
      const DeepCollectionEquality().hash(_geoPoint),
      const DeepCollectionEquality().hash(isGrid),
      const DeepCollectionEquality().hash(_searchList),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$$_BusinessListingCopyWith<_$_BusinessListing> get copyWith =>
      __$$_BusinessListingCopyWithImpl<_$_BusinessListing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessListingToJson(
      this,
    );
  }
}

abstract class _BusinessListing implements BusinessListing {
  factory _BusinessListing(
      {required final String name,
      @JsonKey(nullable: true) final String? phoneNumber,
      @JsonKey(nullable: true) final String? email,
      @JsonKey(nullable: true) final String? website,
      required final String businessAddress,
      @JsonKey(nullable: true, defaultValue: "All States") final String? state,
      required final String township,
      required final String categoryID,
      required final String contactPersonName,
      required final String contactPhoneNumer,
      @JsonKey(nullable: true) final String? contactEmail,
      required final ImageItem businessLogo,
      @JsonKey(nullable: true) final List<String>? geoPoint,
      @JsonKey(nullable: true, defaultValue: false) final bool? isGrid,
      required final List<String> searchList,
      required final DateTime dateTime}) = _$_BusinessListing;

  factory _BusinessListing.fromJson(Map<String, dynamic> json) =
      _$_BusinessListing.fromJson;

  @override
  String get name;
  @override
  @JsonKey(nullable: true)
  String? get phoneNumber;
  @override
  @JsonKey(nullable: true)
  String? get email;
  @override
  @JsonKey(nullable: true)
  String? get website;
  @override
  String get businessAddress;
  @override
  @JsonKey(nullable: true, defaultValue: "All States")
  String? get state;
  @override
  String get township;
  @override
  String get categoryID;
  @override
  String get contactPersonName;
  @override
  String get contactPhoneNumer;
  @override
  @JsonKey(nullable: true)
  String? get contactEmail;
  @override
  ImageItem get businessLogo;
  @override
  @JsonKey(nullable: true)
  List<String>? get geoPoint;
  @override
  @JsonKey(nullable: true, defaultValue: false)
  bool? get isGrid;
  @override
  List<String> get searchList;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessListingCopyWith<_$_BusinessListing> get copyWith =>
      throw _privateConstructorUsedError;
}
