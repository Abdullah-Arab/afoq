import 'package:flutter/material.dart';
import 'package:flutter_starter/src/features/my_cars/models/car.dart';

class CarCard extends StatelessWidget {
  const CarCard(this.car, {super.key});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(car.name),
        subtitle: Text(car.model),
        trailing: Text(car.color),
      ),
    );
  }
}
