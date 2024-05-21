import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/model/extracted_text_model/extracted_text_model.dart';
import 'package:bizkit/module/biz_card/domain/model/extracted_text_model/text_extractionimage_model/text_extractionimage_model.dart';
import 'package:dartz/dartz.dart';

abstract class TextExtractionRepo {
  Future<Either<Failure, ExtractedTextModel>> extractText(
      {required TextExtractionimageModel image});
}
