import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/src/features/my_cars/models/car.dart';
import 'package:flutter_starter/src/services/router/auto_router.dart';
import 'package:flutter_starter/src/utilities/methods.dart';

class CarCard extends StatelessWidget {
  const CarCard(this.car, {super.key});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          car.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(car.model),
        trailing: CircleAvatar(
          backgroundColor: stringToColor(car.color),
        ),
        onTap: () {
          AutoRouter.of(context).push(
            CarDetailRoute(
              car: car,
            ),
          );
        },
      ),
    );
  }
}
