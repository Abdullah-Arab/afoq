// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Car _$$_CarFromJson(Map<String, dynamic> json) => _$_Car(
      id: json['id'] as String,
      name: json['name'] as String,
      model: json['model'] as String,
      color: json['color'] as String,
      plateNumber: json['plate_number'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      documents: (json['documents'] as List<dynamic>)
          .map((e) => CarDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CarToJson(_$_Car instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'model': instance.model,
      'color': instance.color,
      'plate_number': instance.plateNumber,
      'created_at': instance.createdAt.toIso8601String(),
      'documents': instance.documents.map((e) => e.toJson()).toList(),
    };
