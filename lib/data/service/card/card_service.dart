import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/card/bank_details/bank_details.dart';
import 'package:bizkit/domain/model/card/card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/card/get_card_resposnse_model/get_card_resposnse_model.dart';
import 'package:bizkit/domain/model/card/card/personal_data/personal_details.dart';
import 'package:bizkit/domain/model/card/create_card/banking_detail/bank_details.dart';
import 'package:bizkit/domain/model/card/create_card/business_detail/business_details.dart';
import 'package:bizkit/domain/model/card/create_card/personal_details/personal_details.dart';
import 'package:bizkit/domain/model/card/create_card_by_id_model/create_card_by_id_model.dart';
import 'package:bizkit/domain/model/card/get_card_response/get_card_response.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
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
  Future<Either<Failure, SuccessResponseModel>> archiveCard({required int id}) {
    // TODO: implement archiveCard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> createCard(
      {required CreateCardByIdModel createCardByIdModel}) async {
    try {
      await apiService.post(ApiEndPoints.createCard,
          data: createCardByIdModel.toJson());
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
  Future<Either<Failure, BankDetails>> createBankingDataCard(
      {required BankDetailsCreate bankDetailsCreate}) async {
    try {
      log('createBankingDataCard creation ');
      final response = await apiService.post(ApiEndPoints.createCardBAnking,
          data: bankDetailsCreate.toJson());
      log('createBankingDataCard creation done ');
      return Right(BankDetails.fromJson(response.data));
    } on DioException catch (e) {
      log('createBankingDataCard creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('createBankingDataCard creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, BusinessDetails>> createBusinessDataCard(
      {required BusinessDetailsCreate businessDetailsCreate}) async {
    try {
      log('createBusinessDataCard creation ');
      final response = await apiService.post(ApiEndPoints.createCardBusiness,
          data: businessDetailsCreate.toJson());
      log('createBusinessDataCard creation done');
      return Right(BusinessDetails.fromJson(response.data));
    } on DioException catch (e) {
      log('createBusinessDataCard creation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('createBusinessDataCard creation exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, PersonalDetails>> createPersonalDataCard(
      {required PersonalDetailsCreate personalDetailsCreate}) async {
    try {
      log('createPersonalDataCard creation');
      final response = await apiService.post(ApiEndPoints.createCardPersonal,
          data: personalDetailsCreate.toJson());
      log('createPersonalDataCard creation done');
      return Right(PersonalDetails.fromJson(response.data));
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
      if (e.response?.statusCode == 400) {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      } else {
        return Left(Failure(message: errorMessage));
      }
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, GetCardResposnseModel>> getCardByCardId(
      {required int id}) async {
    try {
      final response = await apiService.get(ApiEndPoints.getCardByCardId
          .replaceFirst('{card_id}', id.toString()));
      return Right(GetCardResposnseModel.fromJson(response.data));
    } on DioException catch (e) {
      log(e.toString());
      if (e.response?.statusCode == 400) {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      } else {
        return Left(Failure(message: errorMessage));
      }
    } catch (e) {
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
      log(e.toString());
      if (e.response?.statusCode == 400) {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      } else {
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
      final response = await apiService.get(
          ApiEndPoints.defaultCard.replaceFirst('{card_id}', id.toString()));
      print('set default card api success');
      print(response.data);
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log(e.toString());
      if (e.response?.statusCode == 400) {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      } else {
        return Left(Failure(message: errorMessage));
      }
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
      final response = await apiService.delete(
          ApiEndPoints.deleteCard.replaceFirst('{card_id}', id.toString()));
      print('delete card api success');
      print(response.data);
      return Right(SuccessResponseModel(message: 'Card deleted successfully'));
    } on DioException catch (e) {
      log(e.toString());
      if (e.response?.statusCode == 400) {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      } else {
        return Left(Failure(message: errorMessage));
      }
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: errorMessage));
    }
  }
}
