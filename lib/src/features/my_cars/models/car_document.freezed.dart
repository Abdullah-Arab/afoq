// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CarDocument _$CarDocumentFromJson(Map<String, dynamic> json) {
  return _CarDocument.fromJson(json);
}

/// @nodoc
mixin _$CarDocument {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get issueDate => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarDocumentCopyWith<CarDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarDocumentCopyWith<$Res> {
  factory $CarDocumentCopyWith(
          CarDocument value, $Res Function(CarDocument) then) =
      _$CarDocumentCopyWithImpl<$Res, CarDocument>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime issueDate,
      DateTime expiryDate});
}

/// @nodoc
class _$CarDocumentCopyWithImpl<$Res, $Val extends CarDocument>
    implements $CarDocumentCopyWith<$Res> {
  _$CarDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? issueDate = null,
    Object? expiryDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CarDocumentCopyWith<$Res>
    implements $CarDocumentCopyWith<$Res> {
  factory _$$_CarDocumentCopyWith(
          _$_CarDocument value, $Res Function(_$_CarDocument) then) =
      __$$_CarDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime issueDate,
      DateTime expiryDate});
}

/// @nodoc
class __$$_CarDocumentCopyWithImpl<$Res>
    extends _$CarDocumentCopyWithImpl<$Res, _$_CarDocument>
    implements _$$_CarDocumentCopyWith<$Res> {
  __$$_CarDocumentCopyWithImpl(
      _$_CarDocument _value, $Res Function(_$_CarDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? issueDate = null,
    Object? expiryDate = null,
  }) {
    return _then(_$_CarDocument(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CarDocument implements _CarDocument {
  const _$_CarDocument(
      {required this.id,
      required this.title,
      required this.description,
      required this.issueDate,
      required this.expiryDate});

  factory _$_CarDocument.fromJson(Map<String, dynamic> json) =>
      _$$_CarDocumentFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime issueDate;
  @override
  final DateTime expiryDate;

  @override
  String toString() {
    return 'CarDocument(id: $id, title: $title, description: $description, issueDate: $issueDate, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarDocument &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, issueDate, expiryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarDocumentCopyWith<_$_CarDocument> get copyWith =>
      __$$_CarDocumentCopyWithImpl<_$_CarDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CarDocumentToJson(
      this,
    );
  }
}

abstract class _CarDocument implements CarDocument {
  const factory _CarDocument(
      {required final String id,
      required final String title,
      required final String description,
      required final DateTime issueDate,
      required final DateTime expiryDate}) = _$_CarDocument;

  factory _CarDocument.fromJson(Map<String, dynamic> json) =
      _$_CarDocument.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get issueDate;
  @override
  DateTime get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$$_CarDocumentCopyWith<_$_CarDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
