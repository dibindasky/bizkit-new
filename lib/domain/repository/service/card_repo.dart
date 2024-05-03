import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/card/card/card.dart';
import 'package:bizkit/domain/model/card/card/get_card_response_model/get_card_response_model.dart';
import 'package:bizkit/domain/model/card/card/personal_data/personal_details.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/archeived_card_model/archeived_card_model.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/blocked_cards_responce_moede/blocked_cards_responce_moede.dart';
import 'package:bizkit/domain/model/card/cards_in_profile/card_action_rewuest_model/card_action_rewuest_model.dart';
import 'package:bizkit/domain/model/card/company/get_business_category_response_model/get_business_category_response_model.dart';
import 'package:bizkit/domain/model/card/company/get_company_response_model/get_companys.dart';
import 'package:bizkit/domain/model/card/get_card_response/get_card_response.dart';
import 'package:bizkit/domain/model/card/request/request_card_detail_model/request_card_detail_model.dart';
import 'package:bizkit/domain/model/card_first/creation/card_first_creation_model/card_first_creation_model.dart';
import 'package:bizkit/domain/model/card_first/creation/patch_personal_data/patch_personal_data.dart';
import 'package:bizkit/domain/model/card_first/get_views_response_model/get_views_response_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:dartz/dartz.dart';

abstract class CardRepo {
  Future<Either<Failure, SuccessResponseModel>> createCard(
      {required CardFirstCreationModel cardFirstCreationModel});
  Future<Either<Failure, PersonalDetails>> patchPersonalDetails(
      {required PatchPersonalData patchPersonalData,
      required int personalDataId});
  Future<Either<Failure, BusinessDetails>> createBusinessDataCard(
      {required BusinessDetails businessDetails, required int id});
  Future<Either<Failure, GetCardResponse>> getCards({required PageQuery qurey});
  Future<Either<Failure, GetCardResponseModel>> getCardByUserId(
      {required int id});
  Future<Either<Failure, Card>> getCardByCardId({required int id});
  Future<Either<Failure, GetViewsResponseModel>> getCardViews(
      {required int id});
  Future<Either<Failure, GetCompanysResponseModel>> getCompanies(
      {required SearchQuery? search});
  Future<Either<Failure, GetBusinessCategoryResponseModel>>
      getBusinessCategories();
  Future<Either<Failure, SuccessResponseModel>> setDefault({required int id});
  Future<Either<Failure, BlockedCardsResponceMoede>> getDeletedCardsList({
    required PageQuery pageQuery,
  });
  Future<Either<Failure, SuccessResponseModel>> cardAction({
    required int id,
    required CardActionRequestModel cardActionRewuestModel,
  });
  Future<Either<Failure, SuccessResponseModel>> restoreArchiveDeleteCard({
    required int cardId,
    required CardActionRequestModel cardActionRewuestModel,
  });
  Future<Either<Failure, BusinessDetails>> getCompnayDetails({required int id});
  Future<Either<Failure, SuccessResponseModel>> requestCompanyDetails(
      {required RequestCardDetailModel requestCardDetailModel});
  Future<Either<Failure, ArcheivedCardModel>> archievedCardsList({
    required PageQuery pageQuery,
  });
}
