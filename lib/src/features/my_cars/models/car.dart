
import 'package:flutter_starter/src/features/my_cars/models/car_document.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car.freezed.dart';
part 'car.g.dart';

@freezed
class Car with _$Car{

  const factory Car({
    required String id,
    required String name,
    required String model,
    required String color,
    required String plateNumber,
    required DateTime createdAt,
    required List<CarDocument> documents,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}