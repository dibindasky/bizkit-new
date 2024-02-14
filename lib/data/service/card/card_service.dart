import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/card/get_card_resposnse_model/get_card_resposnse_model.dart';
import 'package:bizkit/domain/model/card/create_card/create_card_model/create_card_model.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/repository/service/card_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardRepo)
@injectable
class CardService implements CardRepo {
  final ApiService apiService ;
  // =ApiService(dio: Dio(), baseUrl: ApiEndPoints.baseUrl);

  CardService(this.apiService);

  @override
  Future<Either<Failure, SuccessResponseModel>> createCard(
      {required CreateCardModel createCardModel}) async {
    try {
      await apiService.post(ApiEndPoints.createCard,
          data: createCardModel.toJson());
      return Right(SuccessResponseModel(message: 'Card created successfully'));
    } on DioException catch (e) {
      log(e.toString());
      return Left(Failure(message: 'Failed to create card'));
    } catch (e) {
      return Left(Failure(message: 'Failed to create card'));
    }
  }

  @override
  Future<Either<Failure, GetCardResposnseModel>> getCards(
      {required PageQuery qurey}) async {
    try {
      final response = await apiService.get(ApiEndPoints.card,
          queryParameters: qurey.toJson());
      return Right(GetCardResposnseModel.fromJson(response.data));
    } on DioException catch (e) {
      log(e.toString());
      return Left(Failure(message: e.response?.data['error'] ?? errorMessage));
    } catch (e) {
      return Left(Failure(message: errorMessage));
    }
  }
}
