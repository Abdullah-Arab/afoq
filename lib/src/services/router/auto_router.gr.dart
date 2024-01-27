// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddCarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddCarScreen(),
      );
    },
    AppContainerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppContainerScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    CarDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CarDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CarDetailScreen(
          key: args.key,
          car: args.car,
        ),
      );
    },
  };
}

/// generated route for
/// [AddCarScreen]
class AddCarRoute extends PageRouteInfo<void> {
  const AddCarRoute({List<PageRouteInfo>? children})
      : super(
          AddCarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppContainerScreen]
class AppContainerRoute extends PageRouteInfo<void> {
  const AppContainerRoute({List<PageRouteInfo>? children})
      : super(
          AppContainerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppContainerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CarDetailScreen]
class CarDetailRoute extends PageRouteInfo<CarDetailRouteArgs> {
  CarDetailRoute({
    Key? key,
    required Car car,
    List<PageRouteInfo>? children,
  }) : super(
          CarDetailRoute.name,
          args: CarDetailRouteArgs(
            key: key,
            car: car,
          ),
          initialChildren: children,
        );

  static const String name = 'CarDetailRoute';

  static const PageInfo<CarDetailRouteArgs> page =
      PageInfo<CarDetailRouteArgs>(name);
}

class CarDetailRouteArgs {
  const CarDetailRouteArgs({
    this.key,
    required this.car,
  });

  final Key? key;

  final Car car;

  @override
  String toString() {
    return 'CarDetailRouteArgs{key: $key, car: $car}';
  }
}
