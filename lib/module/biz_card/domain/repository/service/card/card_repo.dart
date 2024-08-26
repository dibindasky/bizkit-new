import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/archived_and_deleted_cards_responce/archived_and_deleted_cards_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_archive_model/card_archive_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_delete_model/card_delete_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card_responce/create_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/get_all_cards.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/personal_details_request_model/personal_details_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class CardRepo {
  // New Card creation
  Future<Either<Failure, CreateCardResponce>> createCard(
      {required CreateCard createCard});
  Future<Either<Failure, GetAllCards>> getAllCards();
  Future<Either<Failure, CardDetailModel>> getCardDetail(
      {required String cardId});

  // Set default card
  Future<Either<Failure, SuccessResponseModel>> setDefaultCard(
      {required String cardId});

  // Archive a  card
  Future<Either<Failure, SuccessResponseModel>> archiveTheCard(
      {required CardArchiveModel cardArchive});

  // Delete a Card
  Future<Either<Failure, SuccessResponseModel>> deleteTheCard(
      {required CardDeleteModel cardDelete});

  Future<Either<Failure, SuccessResponseModel>> personalDetailsAdding(
      {required PersonalDetailsRequestModel personalDetailsRequestModel});

  // fetch all archived & deleted cards
  Future<Either<Failure, ArchivedAndDeletedCardsResponce>>
      getAllArchivedAndDeletedCards();
}
