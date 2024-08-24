import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card_responce/create_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/get_all_cards.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardRepo)
@injectable
class CardService implements CardRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<Failure, GetAllCards>> getAllCards() async {
    try {
      final responce = await apiService.get(ApiEndPoints.card);
      log('getAllCards ==>success');
      return Right(GetAllCards.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllCards DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllCards catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, CreateCardResponce>> createCard(
      {required CreateCard createCard}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.cardCreationInital,
          data: createCard.toJson());
      log('createCard ==>success');
      return Right(CreateCardResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('createCard DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('createCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, CardDetailModel>> getCardDetail(
      {required String cardId}) async {
    try {
      final responce = await apiService
          .post(ApiEndPoints.cardDetail, data: {'bizcard_id': cardId});
      log('getCardDetail ==>success');
      return Right(CardDetailModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getCardDetail DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getCardDetail catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
