import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card/card/image_card/image_card.dart';
import 'package:bizkit/domain/model/extracted_text_model/extracted_text_model.dart';
import 'package:dartz/dartz.dart';

abstract class TextExtractionRepo {
  Future<Either<Failure, ExtractedTextModel>> extractText(
      {required ImageCard image});
}
