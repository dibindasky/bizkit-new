import 'dart:developer';
import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_model/get_contact_model.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/get_contact_responce_model.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/share_card_contact/share_card_contact_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/contact/contact_repo.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ContactService implements ContactsRepo {
  ApiService apiService = ApiService();

  @override
  Future<Either<Failure, GetContactResponceModel>> getBizkitUserByContact(
      {required GetContactModel getContactModel}) async {
    try {
      final response = await apiService.post(ApiEndPoints.contacts,
          data: getContactModel.toJson());
      log('getBizkitUserByContact success==> ${response.statusCode.toString()}');
      log('getBizkitUserByContact success==> ${response.data.toString()}');
      return Right(GetContactResponceModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getBizkitUserByContact dioException==> ${e.toString()}');
      log('getBizkitUserByContact dioException==> ${e.response?.statusCode.toString()}');
      log('getBizkitUserByContact dioException==> ${e.response?.data['error'].toString()}');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> shareBizcardToContacts(
      {required ShareCardContactModel shareCardContactModel}) async {
    try {
      print(shareCardContactModel.toJson());
      final response = await apiService.post(ApiEndPoints.shareCardToContacts,
          data: shareCardContactModel.toJson());
      log('shareBizcardToContacts success==> ${response.statusCode.toString()}');
      log('shareBizcardToContacts success==> ${response.data.toString()}');
      return Right(SuccessResponce.fromJson(response.data));
    } on DioException catch (e) {
      log('shareBizcardToContacts dioException==> ${e.toString()}');
      log('shareBizcardToContacts dioException==> ${e.response?.statusCode.toString()}');
      log('shareBizcardToContacts dioException==> ${e.response?.data['error'].toString()}');
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }
}
