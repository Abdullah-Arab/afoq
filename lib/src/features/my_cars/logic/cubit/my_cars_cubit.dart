import 'package:bloc/bloc.dart';
import 'package:flutter_starter/src/features/my_cars/data/my_cars_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../exception/models/custom_exception.dart';
import '../../models/car.dart';

part 'my_cars_state.dart';
part 'my_cars_cubit.freezed.dart';

class MyCarsCubit extends Cubit<MyCarsState> {
  final MyCarsRepository _myCarsRepository;
  MyCarsCubit(this._myCarsRepository) : super(const MyCarsState.initial()) {
    getMyCars();
  }

  Future<void> getMyCars() async {
    emit(const MyCarsState.loading());
    try {
      final cars = await _myCarsRepository.getCars();
      emit(MyCarsState.loaded(cars));
    } on CustomException catch (e) {
      emit(MyCarsState.error(e));
    }
  }

  Future<void> addCar(Car car) async {
    try {
      await _myCarsRepository.addCar(car);
      getMyCars();
    } on CustomException catch (e) {
      emit(MyCarsState.error(e));
    }
  }

  Future<void> updateCar(Car car) async {
    try {
      await _myCarsRepository.updateCar(car);
      getMyCars();
    } on CustomException catch (e) {
      emit(MyCarsState.error(e));
    }
  }

  Future<void> deleteCar(String id) async {
    try {
      await _myCarsRepository.deleteCar(id);
      getMyCars();
    } on CustomException catch (e) {
      emit(MyCarsState.error(e));
    }
  }
}
