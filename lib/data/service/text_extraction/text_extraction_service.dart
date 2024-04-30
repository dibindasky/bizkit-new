import 'dart:developer';

import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/extracted_text_model/extracted_text_model.dart';
import 'package:bizkit/domain/model/extracted_text_model/text_extractionimage_model/text_extractionimage_model.dart';
import 'package:bizkit/domain/repository/service/text_extraction_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TextExtractionRepo)
@injectable
class TextExtractionService implements TextExtractionRepo {
  final ApiService _apiService;

  TextExtractionService(this._apiService);

  @override
  Future<Either<Failure, ExtractedTextModel>> extractText(
      {required TextExtractionimageModel image}) async {
    try {
      log('extractText ');
      final response = await _apiService
          .post(ApiEndPoints.textExtraction, data: image.toJson());
      log('extractText done ${response.data}');
      return Right(ExtractedTextModel.fromJson(response.data));
    } on DioException catch (e) {
      log('extractText dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('extractText exception error');
      log(e.toString());
      return Left(Failure());
    }
  }
}
