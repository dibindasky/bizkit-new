import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card/create_card.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/create_card_responce/create_card_responce.dart';
import 'package:bizkit/module/biz_card/domain/modell/cards/get_all_cards/get_all_cards.dart';
import 'package:dartz/dartz.dart';

abstract class CardRepo {
  // Future<Either<Failure, SuccessResponseModel>> createCard(
  // //     {required CardFirstCreationModel cardFirstCreationModel});
  // Future<Either<Failure, PersonalDetails>> patchPersonalDetails(
  //     {required PatchPersonalData patchPersonalData,
  //     required int personalDataId});
  // Future<Either<Failure, BusinessDetails>> createBusinessDataCard(
  //     {required BusinessDetails businessDetails, required int id});
  // Future<Either<Failure, GetCardResponse>> getCards({required PageQuery qurey});
  // Future<Either<Failure, GetCardResponseModel>> getCardByUserId(
  //     {required int id});
  // Future<Either<Failure, Card>> getCardByCardId({required int id});
  // Future<Either<Failure, GetViewsResponseModel>> getCardViews(
  //     {required int id});
  // Future<Either<Failure, GetCompanysResponseModel>> getCompanies(
  //     {required SearchQuery? search});
  // Future<Either<Failure, GetBusinessCategoryResponseModel>>
  //     getBusinessCategories();
  // Future<Either<Failure, SuccessResponseModel>> setDefault({required int id});
  // Future<Either<Failure, BlockedCardsResponceMoede>> getDeletedCardsList({
  //   required PageQuery pageQuery,
  // });
  // Future<Either<Failure, SuccessResponseModel>> cardAction({
  //   required int id,
  //   required CardActionRequestModel cardActionRewuestModel,
  // });
  // Future<Either<Failure, SuccessResponseModel>> restoreArchiveDeleteCard({
  //   required int cardId,
  //   required CardActionRequestModel cardActionRewuestModel,
  // });
  // Future<Either<Failure, BusinessDetails>> getCompnayDetails({required int id});
  // Future<Either<Failure, SuccessResponseModel>> removeCompanyDetailRequest(
  //     {required int id});
  // Future<Either<Failure, SuccessResponseModel>> requestCompanyDetails(
  //     {required RequestCardDetailModel requestCardDetailModel});
  // Future<Either<Failure, ArcheivedCardModel>> archievedCardsList({
  //   required PageQuery pageQuery,
  // });

  // New Card creation
  Future<Either<Failure, CreateCardResponce>> createCard(
      {required CreateCard createCard});
  Future<Either<Failure, GetAllCards>> getAllCards();
  Future<Either<Failure, GetAllCards>> getCardDetail({required String cardId});
}
