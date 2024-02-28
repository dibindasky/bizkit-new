import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/card/card/card.dart';
import 'package:bizkit/domain/model/card/card/get_card_resposnse_model/get_card_resposnse_model.dart';
import 'package:bizkit/domain/model/card/card/personal_data/personal_details.dart';
import 'package:bizkit/domain/model/card/create_card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/create_card/company/get_business_category_response_model/get_business_category_response_model.dart';
import 'package:bizkit/domain/model/card/create_card/company/get_companys/get_companys.dart';
import 'package:bizkit/domain/model/card/create_card/personal_details/personal_details.dart';
import 'package:bizkit/domain/model/card/create_card_by_id_model/create_card_by_id_model.dart';
import 'package:bizkit/domain/model/card/get_card_response/get_card_response.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:dartz/dartz.dart';

abstract class CardRepo {
  Future<Either<Failure, SuccessResponseModel>> createCard(
      {required CreateCardByIdModel createCardByIdModel});
  Future<Either<Failure, PersonalDetails>> createPersonalDataCard(
      {required PersonalDetailsCreate personalDetailsCreate});
  Future<Either<Failure, BusinessDetails>> createBusinessDataCard(
      {required BusinessDetailsCreate businessDetailsCreate});
  Future<Either<Failure, GetCardResponse>> getCards({required PageQuery qurey});
  Future<Either<Failure, GetCardResposnseModel>> getCardByUserId(
      {required int id});
  Future<Either<Failure, Card>> getCardByCardId({required int id});
  Future<Either<Failure, GetCompanysResponseModel>> getCompanies(
      {required SearchQuery? search});
  Future<Either<Failure, GetBusinessCategoryResponseModel>>
      getBusinessCategories();
  Future<Either<Failure, SuccessResponseModel>> setDefault({required int id});
  Future<Either<Failure, SuccessResponseModel>> deleteCard({required int id});
  Future<Either<Failure, SuccessResponseModel>> archiveCard({required int id});
  Future<Either<Failure, BusinessDetails>> getCompnayDetails({required int id});
}
