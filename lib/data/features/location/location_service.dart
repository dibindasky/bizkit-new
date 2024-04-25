import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/repository/feature/location.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocationRepo)
@injectable
class LocationService implements LocationRepo {
  @override
  Future<Either<Failure, String>> getLoation() async {
    try {
      bool servicePermission = false;
      servicePermission == await Geolocator.isLocationServiceEnabled();
      LocationPermission locationPermission;
      if (!servicePermission) {
        print('no location permision');
      }
      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;
      String address = await getAddressFromLatLng(latitude, longitude);
      print('Latitude: $latitude, Longitude: $longitude');
      print('address $address');
      return Right(address);
    } on DioException catch (e) {
      return Left(Failure(message: e.toString()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

Future<String> getAddressFromLatLng(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    String address =
        "${place.street}, ${place.locality}, ${place.country} ${place.subAdministrativeArea} ${place.subLocality}";
    return address;
  } catch (e) {
    return "Unable to fetch address";
  }
}
