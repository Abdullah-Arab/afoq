import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/src/features/my_cars/models/car.dart';

@RoutePage()
class CarDetailScreen extends StatelessWidget {
  final Car car;
  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
