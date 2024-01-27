import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/src/features/exception/ui/empty_view.dart';
import 'package:flutter_starter/src/features/exception/ui/exception_view.dart';
import 'package:flutter_starter/src/features/my_cars/logic/cubit/my_cars_cubit.dart';
import 'package:flutter_starter/src/features/my_cars/ui/car_card.dart';
import 'package:flutter_starter/src/services/router/auto_router.dart';
import 'package:flutter_starter/src/services/service_locator/locator.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  /// TODO: add search bar
  /// TODO: add filter button
  /// TODO: add sort button
  /// TODO: add add button
  /// TODO: add refresh on pull down
  /// TODO: add pagination
  /// TODO: add empty state
  /// TODO: add loading state
  /// TODO: add error state
  /// TODO: add retry button
  /// TODO: add delete button
  /// TODO: add edit button
  /// TODO: add view button
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCarsCubit, MyCarsState>(
        bloc: locator<MyCarsCubit>(),
        builder: (context, state) {
          return state.maybeMap(
            loaded: (state) {
              // check if there are no cars
              if (state.cars.isEmpty) {
                return EmptyView(
                  onClick: () {
                    // add car screen
                    AutoRouter.of(context).push(const AddCarRoute());
                  },
                );
              }

              return ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  final car = state.cars[index];
                  return CarCard(car);
                },
              );
            },
            error: (state) => ExceptionView(
              state.exception,
              onRetry: () {
                locator<MyCarsCubit>().getMyCars();
              },
            ),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        });
  }
}
