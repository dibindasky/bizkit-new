import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/bizcard_id_parameter_model/bizcard_id_parameter_model.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/archived_and_deleted_cards_responce/archived_and_deleted_cards_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/scan_and_connect_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/create_card_responce/create_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_all_cards/get_all_cards.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/get_card_views_responce/get_card_views_responce.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/card/card_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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

  @override
  Future<Either<Failure, ScanAndConnectModel>> scanAndConnect(
      {required String cardId}) async {
    try {
      log('deeplink id -> $cardId');
      final responce = await apiService
          .post(ApiEndPoints.scanAndConnect, data: {'bizcard_id': cardId});
      log('scanAndConnect ==>success');
      log('mycard  ==> ${responce.data['shared_details'] == null}');
      if ((responce.data as Map<String, dynamic>)['shared_details'] == null &&
          (responce.data as Map<String, dynamic>)['new_connection'] == null) {
        final connectionId =
            (responce.data as Map<String, dynamic>)['connection_id'] as String?;
        log('own card response');
        return Right(ScanAndConnectModel(
            sharedDetails: CardDetailModel.fromJson(responce.data,
                connectionId: connectionId),
            newConnection: null));
      }
      return Right(ScanAndConnectModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('scanAndConnect DioException ${e.response?.data} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('scanAndConnect catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> setDefaultCard(
      {required String cardId}) async {
    try {
      final responce = await apiService
          .post(ApiEndPoints.cardSetDefault, data: {'card_id': cardId});
      log('setDefaultCard ==> success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('setDefaultCard DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('setDefaultCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> archiveTheCard(
      {required CardArchiveModel cardArchive}) async {
    try {
      log('archiveTheCard TOJSON = ${cardArchive.toJson()}');
      final responce = await apiService.patch(
        ApiEndPoints.cardArchiveOrDelete,
        data: cardArchive.toJson(),
      );
      log('archiveTheCard ==> success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('archiveTheCard DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('archiveTheCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteTheCard(
      {required CardDeleteModel cardDelete}) async {
    try {
      final responce = await apiService.patch(
        ApiEndPoints.cardArchiveOrDelete,
        data: cardDelete.toJson(),
      );
      log('deleteTheCard ==> success');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('deleteTheCard DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('deleteTheCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, ArchivedAndDeletedCardsResponce>>
      getAllArchivedAndDeletedCards() async {
    try {
      final responce =
          await apiService.get(ApiEndPoints.getArchievedOrDeletedCards);
      log('getAllArchivedAndDeletedCards ==> success');
      return Right(ArchivedAndDeletedCardsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllArchivedAndDeletedCards DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllArchivedAndDeletedCards catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, GetCardViewsResponce>> getCardViews(
      {required BizcardIdParameterModel bizcardIdParameterModel}) async {
    try {
      final responce = await apiService.post(
        ApiEndPoints.cardViews,
        data: bizcardIdParameterModel.toJson(),
      );
      log('getCardViews ==> success');
      return Right(GetCardViewsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getCardViews DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getCardViews catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateShareCount(
      {required BizcardIdParameterModel bizcardIdParameterModel}) async {
    try {
      await apiService.post(
        ApiEndPoints.cardShareCount,
        data: bizcardIdParameterModel.toJson(),
      );
      log('updateShareCount ==> success');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('updateShareCount DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('updateShareCount catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
