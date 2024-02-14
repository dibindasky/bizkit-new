import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/contact/get_contact_model/get_contact_model.dart';
import 'package:bizkit/domain/model/contact/get_contacts_response_model/get_contacts_response_model.dart';
import 'package:bizkit/domain/repository/service/contact_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ContactServiceImpl implements ContactsRepo {
  final ApiService apiService;

  ContactServiceImpl(this.apiService);

  @override
  Future<Either<Failure, GetContactsResponseModel>> getBizkitUserByContact(
      {required GetContactModel getContactModel}) async {
    try {
      final response = await apiService.get(ApiEndPoints.card,
          data: getContactModel.toJson());
      return Right(GetContactsResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }
}
