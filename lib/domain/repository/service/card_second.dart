import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_response_model/card_second_response_model.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/gate_all_card_second_model.dart';
import 'package:bizkit/domain/model/card_second/get_second_card_model/get_second_card_model.dart';
import 'package:bizkit/domain/model/card_second/update_second_card_model/update_second_card_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:dartz/dartz.dart';

abstract class CardSecondRepo {
  Future<Either<Failure, CardSecondResponseModel>> cardSecondCreation({
    required CardSecondCreateRequestModel cardSecondCreateRequestModel,
  });
  Future<Either<Failure, GetSecondCardModel>> getCardSecond();
  Future<Either<Failure, CardSecondResponseModel>> updateCardSecond({
    required UpdateSecondCardModel updateSecondCardModel,
  });
  Future<Either<Failure, GateAllCardSecondModel>> getAllCardsSecond({
    required PageQuery pageQuery,
  });
}
