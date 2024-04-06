import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_response_model/card_second_response_model.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/gate_all_card_second_model.dart';
import 'package:bizkit/domain/model/card_second/get_deleted_second_cards/get_deleted_second_cards.dart';
import 'package:bizkit/domain/model/card_second/get_second_card_model/get_second_card_model.dart';
import 'package:bizkit/domain/model/card_second/update_second_card_model/update_second_card_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class CardSecondRepo {
  Future<Either<Failure, CardSecondResponseModel>> cardSecondCreation({
    required CardSecondCreateRequestModel cardSecondCreateRequestModel,
  });
  Future<Either<Failure, GetSecondCardModel>> getCardSecond({required int id});
  Future<Either<Failure, CardSecondResponseModel>> updateCardSecond({
    required UpdateSecondCardModel updateSecondCardModel,
    required String id,
  });
  Future<Either<Failure, GateAllCardSecondModel>> getAllCardsSecond({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, SuccessResponseModel>> deleteSecondCard({
    required CardActionRewuestModel cardActionRewuestModel,
    required int id,
  });
  Future<Either<Failure, GetDeletedSecondCards>> getDeleteSecondCard({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, GetDeletedSecondCards>> getDeleteSecondCardEvent({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, SuccessResponseModel>> restoreDeleteSecondCardEvent({
    required CardActionRewuestModel cardActionRewuestModel,
    required int id,
  });
}
