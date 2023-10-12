
import 'package:flutter_starter/src/features/my_cars/data/my_cars_repository.dart';
import 'package:flutter_starter/src/features/my_cars/logic/cubit/my_cars_cubit.dart';

import '../../features/auth/logic/auth_cubit.dart';
import '/src/services/firebase/firebase_sevice.dart';
import '/src/services/logger/logger.dart';
import '/src/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> configureDependencies() async {
  // locator.registerSingletonAsync<StorageService>(()=>StorageService.getInstance());
  //await _setupStorage();
  locator.registerSingleton<StorageService>(StorageService());
  locator.registerSingleton<Log>(Log());
  locator.registerSingleton<FirebaseService>(FirebaseService());
  locator.registerLazySingleton<AuthCubit>(() => AuthCubit());
  locator.registerLazySingleton<MyCarsCubit>(() => MyCarsCubit(MyCarsRepository()));
}

// Future<void> _setupStorage() async {
//   final instance = await StorageService.getInstance();
//   locator.registerSingleton<StorageService>( instance!);
// }
