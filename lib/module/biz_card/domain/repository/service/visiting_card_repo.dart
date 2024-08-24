import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/create_visiting_card/create_visiting_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/create_visiting_card_responce/create_visiting_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/get_all_visiting_cards/get_all_visiting_cards.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_delete_model/visiting_card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_details_responce/visiting_card_details_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/visiting_cards/visiting_card_edit_model/visiting_card_edit_model.dart';
import 'package:dartz/dartz.dart';

abstract class VisitingCardRepo {
  Future<Either<Failure, CreateVisitingCardResponce>> createVisitingCard(
      {required CreateVisitingCard createVisitingCard});

  Future<Either<Failure, SuccessResponseModel>> editVisitingCard(
      {required VisitingCardEditModel visitingCardEditModel});

  Future<Either<Failure, SuccessResponseModel>> deleteVisitingCard(
      {required VisitingCardDeleteModel visitingCardDeleteModel});

  Future<Either<Failure, GetAllVisitingCards>> getAllVisitingCards();

  Future<Either<Failure, VisitingCardDetailsResponce>> getVisitingCardDetails();

  Future<Either<Failure, GetAllVisitingCards>> getAllDeletedVisitingCards();
}
