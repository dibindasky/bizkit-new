import 'dart:developer';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
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
import 'package:bizkit/domain/repository/service/card_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardRepo)
@injectable
class CardService implements CardRepo {
  final ApiService apiService;

  CardService(this.apiService);

  @override
  Future<Either<Failure, SuccessResponseModel>> archiveCard(
      {required int id}) async {
    try {
      print('delete card apiicall');
      final response = await apiService.patch(ApiEndPoints.deleteArchiveCard
          .replaceFirst('{card_id}', id.toString()));
      print('delete card api success');
      print(response.data);
      return Right(SuccessResponseModel(message: 'Card deleted successfully'));
    } on DioException catch (e) {
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> createCard(
      {required CreateCardByIdModel createCardByIdModel}) async {
    try {
      await apiService.post(ApiEndPoints.createCard,
          data: createCardByIdModel.toJson());
      print('create card ${createCardByIdModel.toJson()}');
      return Right(SuccessResponseModel(message: 'Card created successfully'));
    } on DioException catch (e) {
      log('card creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure(message: 'Failed to create card'));
    } catch (e) {
      log('card creation exception error');
      log(e.toString());
      return Left(Failure(message: 'Failed to create card'));
    }
  }

  @override
  Future<Either<Failure, BusinessDetails>> createBusinessDataCard(
      {required BusinessDetailsCreate businessDetailsCreate}) async {
    try {
      log('createBusinessDataCard creation ');
      print(
          'createBusinessDataCard creation  ${businessDetailsCreate.toJson()}');
      final response = await apiService.post(ApiEndPoints.createCardBusiness,
          data: businessDetailsCreate.toJson());
      log('createBusinessDataCard creation done');
      var data = response.data as Map<String, dynamic>;
      return Right(BusinessDetails(id: data['id'] as int?));
    } on DioException catch (e) {
      log('createBusinessDataCard creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(
          Failure(message: 'Failed to create business data please try again'));
    } catch (e) {
      log('createBusinessDataCard creation exception error');
      log(e.toString());
      return Left(
          Failure(message: 'Failed to create business data please try again'));
    }
  }

  @override
  Future<Either<Failure, PersonalDetails>> createPersonalDataCard(
      {required PersonalDetailsCreate personalDetailsCreate}) async {
    try {
      log('createPersonalDataCard creation ${personalDetailsCreate.toJson()}');
      final response = await apiService.post(ApiEndPoints.createCardPersonal,
          data: personalDetailsCreate.toJson());
      log('createPersonalDataCard creation done');
      final data = response.data as Map<String, dynamic>;
      return Right(PersonalDetails(id: data['id'] as int?));
    } on DioException catch (e) {
      log('createPersonalDataCard creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('createPersonalDataCard creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetCardResposnseModel>> getCardByUserId(
      {required int id}) async {
    try {
      final response = await apiService.get(ApiEndPoints.getCardByUserId
          .replaceFirst('{user_id}', id.toString()));
      return Right(GetCardResposnseModel.fromJson(response.data));
    } on DioException catch (e) {
      log(e.toString());
      log('dio exception getCardByUserId');
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, Card>> getCardByCardId({required int id}) async {
    try {
      final response = await apiService.get(ApiEndPoints.getCardByCardId
          .replaceFirst('{card_id}', id.toString()));
      log('get card by id success');
      log(Card.fromJson(response.data).connectionRequestId.toString());
      return Right(Card.fromJson(response.data));
    } on DioException catch (e) {
      log('dio exception getCardByCardId');
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log('exception getCardByCardId');
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, GetCardResponse>> getCards(
      {required PageQuery qurey}) async {
    try {
      print('get card apiicall');
      final response = await apiService.get(ApiEndPoints.card,
          queryParameters: qurey.toJson());
      print('get card api success');
      print(response.data);
      return Right(GetCardResponse.fromJson(response.data));
    } on DioException catch (e) {
      log('dio exception get cards');
      log(e.toString());
      try {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      } catch (e) {
        return Left(Failure(message: errorMessage));
      }
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> setDefault(
      {required int id}) async {
    try {
      print('delete card apiicall');
      final response = await apiService.patch(
          ApiEndPoints.defaultCard.replaceFirst('{card_id}', id.toString()));
      print('set default card api success');
      print(response.data);
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('dio exception setDefault card');
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteCard(
      {required int id}) async {
    try {
      print('delete card apiicall');
      final response = await apiService.delete(ApiEndPoints.deleteArchiveCard
          .replaceFirst('{card_id}', id.toString()));
      print('delete card api success');
      print(response.data);
      return Right(SuccessResponseModel(message: 'Card deleted successfully'));
    } on DioException catch (e) {
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, GetCompanysResponseModel>> getCompanies(
      {required SearchQuery? search}) async {
    try {
      print('get company apiicall');
      final response = await apiService.get(ApiEndPoints.getCompanies,
          queryParameters: search?.toJson());
      print('get company success');
      print(response.data);
      return Right(GetCompanysResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, BusinessDetails>> getCompnayDetails(
      {required int id}) async {
    try {
      print('get companyDetail apiicall');
      final response = await apiService.get(ApiEndPoints.getCompanyDetails
          .replaceFirst('{company_id}', id.toString()));
      print('get companyDetail success');
      print(response.data);
      return Right(BusinessDetails.fromJson(response.data['business_details']));
    } on DioException catch (e) {
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, GetBusinessCategoryResponseModel>>
      getBusinessCategories() async {
    try {
      print('get company apiicall');
      final response = await apiService.get(ApiEndPoints.getBusinessCategory);
      print('get company success');
      print(response.data);
      return Right(GetBusinessCategoryResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }
}
