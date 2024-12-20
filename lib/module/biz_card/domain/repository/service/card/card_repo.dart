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
import 'package:dartz/dartz.dart';

abstract class CardRepo {
  /// New Card creation
  Future<Either<Failure, CreateCardResponce>> createCard(
      {required CreateCard createCard});

  /// get all cards list
  Future<Either<Failure, GetAllCards>> getAllCards();

  /// get bizcard details
  Future<Either<Failure, CardDetailModel>> getCardDetail(
      {required String cardId});

  /// scan and make connection
  Future<Either<Failure, ScanAndConnectModel>> scanAndConnect(
      {required String cardId});

  /// Set default card
  Future<Either<Failure, SuccessResponseModel>> setDefaultCard(
      {required String cardId});

  /// Archive a  card
  Future<Either<Failure, SuccessResponseModel>> archiveTheCard(
      {required CardArchiveModel cardArchive});

  /// Delete a Card
  Future<Either<Failure, SuccessResponseModel>> deleteTheCard(
      {required CardDeleteModel cardDelete});

  /// fetch all archived & deleted cards
  Future<Either<Failure, ArchivedAndDeletedCardsResponce>>
      getAllArchivedAndDeletedCards();

  /// get the list of users who viewd my card
  Future<Either<Failure, GetCardViewsResponce>> getCardViews(
      {required BizcardIdParameterModel bizcardIdParameterModel});

  /// update the number of share
  Future<Either<Failure, SuccessResponseModel>> updateShareCount(
      {required BizcardIdParameterModel bizcardIdParameterModel});
}
