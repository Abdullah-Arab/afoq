// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CarDocument _$$_CarDocumentFromJson(Map<String, dynamic> json) =>
    _$_CarDocument(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      issueDate: DateTime.parse(json['issue_date'] as String),
      expiryDate: DateTime.parse(json['expiry_date'] as String),
    );

Map<String, dynamic> _$$_CarDocumentToJson(_$_CarDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'issue_date': instance.issueDate.toIso8601String(),
      'expiry_date': instance.expiryDate.toIso8601String(),
    };
