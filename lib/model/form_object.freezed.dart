// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormObject {
  String get value => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormObjectCopyWith<FormObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormObjectCopyWith<$Res> {
  factory $FormObjectCopyWith(
          FormObject value, $Res Function(FormObject) then) =
      _$FormObjectCopyWithImpl<$Res>;
  $Res call({String value, String error, bool isRequired});
}

/// @nodoc
class _$FormObjectCopyWithImpl<$Res> implements $FormObjectCopyWith<$Res> {
  _$FormObjectCopyWithImpl(this._value, this._then);

  final FormObject _value;
  // ignore: unused_field
  final $Res Function(FormObject) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? error = freezed,
    Object? isRequired = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: isRequired == freezed
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FormObjectCopyWith<$Res>
    implements $FormObjectCopyWith<$Res> {
  factory _$$_FormObjectCopyWith(
          _$_FormObject value, $Res Function(_$_FormObject) then) =
      __$$_FormObjectCopyWithImpl<$Res>;
  @override
  $Res call({String value, String error, bool isRequired});
}

/// @nodoc
class __$$_FormObjectCopyWithImpl<$Res> extends _$FormObjectCopyWithImpl<$Res>
    implements _$$_FormObjectCopyWith<$Res> {
  __$$_FormObjectCopyWithImpl(
      _$_FormObject _value, $Res Function(_$_FormObject) _then)
      : super(_value, (v) => _then(v as _$_FormObject));

  @override
  _$_FormObject get _value => super._value as _$_FormObject;

  @override
  $Res call({
    Object? value = freezed,
    Object? error = freezed,
    Object? isRequired = freezed,
  }) {
    return _then(_$_FormObject(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: isRequired == freezed
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FormObject implements _FormObject {
  _$_FormObject(
      {required this.value, required this.error, required this.isRequired});

  @override
  final String value;
  @override
  final String error;
  @override
  final bool isRequired;

  @override
  String toString() {
    return 'FormObject(value: $value, error: $error, isRequired: $isRequired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormObject &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.isRequired, isRequired));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isRequired));

  @JsonKey(ignore: true)
  @override
  _$$_FormObjectCopyWith<_$_FormObject> get copyWith =>
      __$$_FormObjectCopyWithImpl<_$_FormObject>(this, _$identity);
}

abstract class _FormObject implements FormObject {
  factory _FormObject(
      {required final String value,
      required final String error,
      required final bool isRequired}) = _$_FormObject;

  @override
  String get value;
  @override
  String get error;
  @override
  bool get isRequired;
  @override
  @JsonKey(ignore: true)
  _$$_FormObjectCopyWith<_$_FormObject> get copyWith =>
      throw _privateConstructorUsedError;
}
