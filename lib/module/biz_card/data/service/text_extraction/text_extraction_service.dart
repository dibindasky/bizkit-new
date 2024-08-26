import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/modell/text_extraction/text_extraction_model/text_extraction_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/text_extraction/text_extraction_responce/text_extraction_responce.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/text_extraction_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TextExtractionService implements TextExtractionRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<Failure, TextExtractionResponce>> textExtracion(
      {required TextExtractionModel textExtractionModel}) async {
    try {
      // log('Text Extraction TOJSON = > ${textExtractionModel.toJson()}');
      final responce = await apiService.post(
        ApiEndPoints.textExtraction,
        data: textExtractionModel.toJson(),
      );
      log('Text Extracion ==>success');
      return Right(TextExtractionResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('textExtracion DioException ${e.response?.statusCode} $e');
      return Left(
          Failure(message: e.response?.data['error'] ?? 'Failed to request'));
    } catch (e) {
      log('textExtracion catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}
