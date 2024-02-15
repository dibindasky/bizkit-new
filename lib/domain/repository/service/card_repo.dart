import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/card/get_card_resposnse_model/get_card_resposnse_model.dart';
import 'package:bizkit/domain/model/card/create_card/create_card_model/create_card_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class CardRepo {
  Future<Either<Failure, SuccessResponseModel>> createCard(
      {required CreateCardModel createCardModel});
  Future<Either<Failure, GetCardResposnseModel>> getCards(
      {required PageQuery qurey});
}
