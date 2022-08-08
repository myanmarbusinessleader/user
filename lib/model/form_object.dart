import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_object.freezed.dart';

@freezed
class FormObject with _$FormObject{
  factory FormObject({
    required String value,
    required String error,
    required bool isRequired,
  }) = _FormObject;

  factory FormObject.initial() => FormObject(value: "", error: "",isRequired: false);
}