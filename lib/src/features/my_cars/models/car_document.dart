

import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_document.freezed.dart';
part 'car_document.g.dart';

@freezed
class CarDocument with _$CarDocument{

  const factory CarDocument({
    required String id,
    required String title,
    required String description,
    required DateTime issueDate,
    required DateTime expiryDate,
  }) = _CarDocument;

  factory CarDocument.fromJson(Map<String, dynamic> json) => _$CarDocumentFromJson(json);
}