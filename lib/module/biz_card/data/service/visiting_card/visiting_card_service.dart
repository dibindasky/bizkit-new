import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/create_visiting_card/create_visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/create_visiting_card_responce/create_visiting_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/get_all_visiting_cards/get_all_visiting_cards.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_details_responce/visiting_card_details_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/visiting_card_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class VisitingCardService implements VisitingCardRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, CreateVisitingCardResponce>> createVisitingCard(
      {required CreateVisitingCard createVisitingCard}) async {
    try {
      log('Create VIsiting cardd TOJOSN ==> ${createVisitingCard.toJson()}');
      final responce = await apiService.post(
        ApiEndPoints.visitingCard,
        data: createVisitingCard.toJson(),
      );
      log('createVisitingCard ==> success');
      return Right(CreateVisitingCardResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('createVisitingCard DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('createVisitingCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteVisitingCard(
      {required VisitingCardDeleteModel visitingCardDeleteModel}) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.visitingCard,
        data: visitingCardDeleteModel.toJson(),
      );
      log('deleteVisitingCard ==> success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('deleteVisitingCard DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('deleteVisitingCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> editVisitingCard(
      {required VisitingCardEditModel visitingCardEditModel}) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.visitingCard,
        data: visitingCardEditModel.toJson(),
      );
      log('editVisitingCard ==> success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('editVisitingCard DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('editVisitingCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, GetAllVisitingCards>>
      getAllDeletedVisitingCards() async {
    try {
      final responce =
          await apiService.get(ApiEndPoints.getAllDeletedVisitingCards);
      log('getAllDeletedVisitingCards ==> success');
      return Right(GetAllVisitingCards.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllDeletedVisitingCards DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllDeletedVisitingCards catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, GetAllVisitingCards>> getAllVisitingCards() async {
    try {
      final responce = await apiService.get(ApiEndPoints.getAllVisitingCards);
      log('getAllVisitingCards ==> success ');
      return Right(GetAllVisitingCards.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllVisitingCards DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllVisitingCards catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, VisitingCardDetailsResponce>> getVisitingCardDetails(
      {required String visitingCardId}) async {
    try {
      final responce = await apiService.get(ApiEndPoints.visitingCardDetails
          .replaceAll('{visitingCardId}', visitingCardId));
      log('getVisitingCardDetails ==> success ');
      return Right(VisitingCardDetailsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getVisitingCardDetails DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getVisitingCardDetails catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
