import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/page_query/page_query.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/add_selfie_model/add_selfie_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/card_second_response_model/card_second_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/get_all_second_card_model/get_all_second_card_model.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/get_all_second_card_model/seond_card_new.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/get_deleted_second_cards/get_deleted_second_cards.dart';
import 'package:bizkit/module/biz_card/domain/model/card_second/get_second_card_model/get_second_card_model.dart';
import 'package:dartz/dartz.dart';

abstract class CardSecondRepo {
  Future<Either<Failure, CardSecondResponseModel>> cardSecondCreation({
    required CardSecondCreateRequestModel cardSecondCreateRequestModel,
  });
  Future<Either<Failure, GetSecondCardModel>> getCardSecond({required int id});
  Future<Either<Failure, CardSecondResponseModel>> updateCardSecond({
    required SecondCardNew secondCard,
    required String id,
  });
  Future<Either<Failure, GetAllSecondCardModel>> getAllCardsSecond({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, SuccessResponseModel>> deleteSecondCard({
    required CardActionRequestModel cardActionRewuestModel,
    required int id,
  });
  Future<Either<Failure, GetDeletedSecondCards>> getDeleteSecondCard({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, GetDeletedSecondCards>> getDeleteSecondCardEvent({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, SuccessResponseModel>> restoreDeleteSecondCardEvent({
    required CardActionRequestModel cardActionRewuestModel,
    required int id,
  });
  Future<Either<Failure, SuccessResponseModel>> removeSelfieImage({
    required int id,
  });
  Future<Either<Failure, SuccessResponseModel>> addSelfieImage(
      {required AddSelfieModel selfies});
  Future<Either<Failure, SuccessResponseModel>> secondCardShareAsAImage({
    required int id,
  });
}