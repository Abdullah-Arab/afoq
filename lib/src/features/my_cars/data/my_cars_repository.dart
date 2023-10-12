import '../../exception/models/custom_exception.dart';
import '../../../services/firebase/firebase_sevice.dart';
import '../../../services/service_locator/locator.dart';
import '../models/car.dart';

class MyCarsRepository {
  final FirebaseService _firebaseService = locator<FirebaseService>();

  Future<void> addCar(Car car) async {
    try {
      await _firebaseService.addCar(car);
    } catch (e) {
      throw CustomException(
        e.toString(),
        errorType: e.runtimeType.toString(),
      );
    }
  }

  Future<List<Car>> getCars() async {
    try {
      return await _firebaseService.getCars();
    } catch (e) {
      throw CustomException(
        e.toString(),
        errorType: e.runtimeType.toString(),
      );
    }
  }

  Future<void> updateCar(Car car) async {
    try {
      await _firebaseService.updateCar(car);
    } catch (e) {
      throw CustomException(
        e.toString(),
        errorType: e.runtimeType.toString(),
      );
    }
  }

  Future<void> deleteCar(String id) async {
    try {
      await _firebaseService.deleteCar(id);
    } catch (e) {
      throw CustomException(
        e.toString(),
        errorType: e.runtimeType.toString(),
      );
    }
  }
}
