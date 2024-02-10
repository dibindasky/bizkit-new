import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/create_card/card_adding_model/card_adding_model.dart';
import 'package:bizkit/domain/model/success_response_model/success_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class CardService {
  final ApiService apiService =
      ApiService(dio: Dio(), baseUrl: ApiEndPoints.baseUrl);
  Future<Either<Failure, SuccessResponseModel>> createCard(
      {required CardAddingModel createCardModel}) async {
    try {
      final response = await apiService.post(ApiEndPoints.createCard,
          data: createCardModel.toJson());
      print('card creation successfull $response');
      return Right(SuccessResponseModel(message: 'Card created successfully'));
    } on DioException catch (e) {
      print('card creation dio => $e');
      return Left(Failure(message: 'Failed to create card'));
    } catch (e) {
      print('card creation => $e');
      return Left(Failure(message: 'Failed to create card'));
    }
  }
}
