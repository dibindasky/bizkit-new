import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/create_visiting_card/create_visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/create_visiting_card_responce/create_visiting_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/get_all_visiting_cards/get_all_visiting_cards.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_details_responce/visiting_card_details_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/received_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/received_card_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ReceivedCardService implements ReceivedCardRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, CreateVisitingCardResponce>> createReceivedCard(
      {required CreateVisitingCard receivedCard}) async {
    try {
      log('Create received card TOJOSN ==> ${receivedCard.toJson()}');
      final responce = await apiService.post(
        ApiEndPoints.visitingCard,
        data: receivedCard.toJson(),
      );
      log('create received card Responce ==> success');
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
      // log('Visiting card Edit To Json ----- > ${visitingCardEditModel.toJson()}');
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
      log('getAllDeletedVisitingCards Responce ==> success');
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
  Future<Either<Failure, GetAllVisitingCards>> getAllReceivedCards() async {
    try {
      final responce = await apiService.get(ApiEndPoints.getAllVisitingCards);
      log('get all received cards Responce ==> success ');
      return Right(GetAllVisitingCards.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllReceivedCards DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllReceivedCards catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, VisitingCardDetailsResponce>> getReceivedCardDetails(
      {required String receivedCardId}) async {
    try {
      final responce = await apiService.get(ApiEndPoints.visitingCardDetails
          .replaceAll('{visitingCardId}', receivedCardId));
      log('get received card details Responce  ==> success ');
      return Right(VisitingCardDetailsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('get received card details DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('get received card details catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
