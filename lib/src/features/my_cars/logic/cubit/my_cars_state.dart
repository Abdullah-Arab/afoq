part of 'my_cars_cubit.dart';

@freezed
class MyCarsState with _$MyCarsState {
  const factory MyCarsState.initial() = _Initial;
  const factory MyCarsState.loading() = _Loading;
  const factory MyCarsState.loaded(List<Car> cars) = _Loaded;
  const factory MyCarsState.error(CustomException exception) = _Error;
}
