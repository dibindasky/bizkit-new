import 'dart:developer';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
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
      String? address = await getAddressFromLatLng(latitude, longitude);
      //log('Latitude: $latitude, Longitude: $longitude');
      return Right(address ?? '');
    } on DioException catch (e) {
      return Left(Failure(message: e.toString()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<List<double>?> getLatLong() async {
    try {
      bool servicePermission = false;
      servicePermission == await Geolocator.isLocationServiceEnabled();
      LocationPermission locationPermission;
      if (!servicePermission) {
        print('no location permision');
      }
      print('location => 1');
      locationPermission = await Geolocator.checkPermission();
      print('location => 2');
      if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      print('location => 3');
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print('location => 4');
      double latitude = position.latitude;
      double longitude = position.longitude;
      return [latitude, longitude];
    } catch (e) {
      print('error location =>$e');
      return null;
    }
  }

  Future<String?> getAddressFromLatLng(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      String address =
          "${place.street}, ${place.locality}, ${place.country} ${place.subAdministrativeArea} ${place.subLocality}";
      log('Address $address');
      return address;
    } catch (e) {
      return null;
    }
  }
}
