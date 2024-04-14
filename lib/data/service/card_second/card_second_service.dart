import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_response_model/card_second_response_model.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/gate_all_card_second_model.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/second_card.dart';
import 'package:bizkit/domain/model/card_second/get_deleted_second_cards/get_deleted_second_cards.dart';
import 'package:bizkit/domain/model/card_second/get_second_card_model/get_second_card_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/repository/service/card_second.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardSecondRepo)
@injectable
class CardSecondService implements CardSecondRepo {
  final ApiService _apiService;

  CardSecondService(this._apiService);
  @override
  Future<Either<Failure, CardSecondResponseModel>> cardSecondCreation(
      {required CardSecondCreateRequestModel
          cardSecondCreateRequestModel}) async {
    try {
      //log('cardSecondCreation  ${cardSecondCreateRequestModel.toJson()}');
      final responce = await _apiService.post(
        ApiEndPoints.createSecondCard,
        data: cardSecondCreateRequestModel.toJson(),
      );
      return Right(CardSecondResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('cardSecondCreation dio error $e');
      return Left(Failure(message: ''));
    } catch (e) {
      log('cardSecondCreation exception error');
      return Left(Failure(message: ''));
    }
  }

  @override
  Future<Either<Failure, GetSecondCardModel>> getCardSecond({
    required int id,
  }) async {
    try {
      final responce = await _apiService
          .get(ApiEndPoints.getSecondCard.replaceAll('{id}', id.toString()));
      //log('getCardSecond data ${responce.data}');
      return Right(GetSecondCardModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getCardSecond dio error $e');
      return Left(Failure(message: 'Failed'));
    } catch (e) {
      log('getCardSecond exception error');
      return Left(Failure(message: ''));
    }
  }

  @override
  Future<Either<Failure, CardSecondResponseModel>> updateCardSecond({
    required SecondCard secondCard,
    required String id,
  }) async {
    try {
      // log('updateCardSecond before ${secondCard.toJson()}');
      final responce = await _apiService.patch(
        ApiEndPoints.updateCardSecond.replaceAll('{id}', id),
        data: secondCard.toJson(),
      );
      // log('updateCardSecond data ${responce.statusCode} ${responce.data}');
      return Right(CardSecondResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('updateCardSecond dio error $e');
      return Left(Failure(message: ''));
    } catch (e) {
      log('updateCardSecond exception error');
      log(e.toString());
      return Left(Failure(message: ''));
    }
  }

  @override
  Future<Either<Failure, GateAllCardSecondModel>> getAllCardsSecond({
    required PageQuery pageQuery,
  }) async {
    try {
      final responce = await _apiService.get(
        ApiEndPoints.getAllCardSecond,
        queryParameters: pageQuery.toJson(),
      );
      return Right(GateAllCardSecondModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllCardsSecond dio error $e');
      return Left(Failure(message: ''));
    } catch (e) {
      log('getAllCardsSecond exception error');
      log(e.toString());
      return Left(Failure(message: ''));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteSecondCard({
    required CardActionRequestModel cardActionRewuestModel,
    required int id,
  }) async {
    try {
      final responce = await _apiService.patch(
        ApiEndPoints.updateCardSecond.replaceAll('{id}', id.toString()),
        data: cardActionRewuestModel.toJson(),
      );
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('deleteSecondCard dio error $e');
      return Left(Failure(message: ''));
    } catch (e) {
      log('deleteSecondCard exception error');
      log(e.toString());
      return Left(Failure(message: ''));
    }
  }

  @override
  Future<Either<Failure, GetDeletedSecondCards>> getDeleteSecondCard({
    required PageQuery pageQuery,
  }) async {
    try {
      final responce = await _apiService.get(
        ApiEndPoints.getDeletedSecondCard,
        data: pageQuery.toJson(),
      );
      return Right(GetDeletedSecondCards.fromJson(responce.data));
    } on DioException catch (e) {
      log('getDeleteSecondCard dio error $e');
      return Left(Failure(message: ''));
    } catch (e) {
      log('getDeleteSecondCard exception error');
      return Left(Failure(message: ''));
    }
  }

  @override
  Future<Either<Failure, GetDeletedSecondCards>> getDeleteSecondCardEvent({
    required PageQuery pageQuery,
  }) async {
    try {
      final responce = await _apiService.get(
        ApiEndPoints.getDeletedSecondCard,
        queryParameters: pageQuery.toJson(),
      );
      return Right(GetDeletedSecondCards.fromJson(responce.data));
    } on DioException catch (e) {
      log('getDeleteSecondCardEvent dio error $e');
      return Left(Failure(message: ''));
    } catch (e) {
      log('getDeleteSecondCardEvent exception error');
      log(e.toString());
      return Left(Failure(message: ''));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> restoreDeleteSecondCardEvent({
    required int id,
    required CardActionRequestModel cardActionRewuestModel,
  }) async {
    try {
      final responce = await _apiService.patch(
        ApiEndPoints.updateCardSecond.replaceAll('{id}', id.toString()),
        data: cardActionRewuestModel.toJson(),
      );
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('restoreDeleteSecondCardEvent dio error $e');
      return Left(Failure(message: ''));
    } catch (e) {
      log('restoreDeleteSecondCardEvent exception error');
      return Left(Failure(message: ''));
    }
  }
}
