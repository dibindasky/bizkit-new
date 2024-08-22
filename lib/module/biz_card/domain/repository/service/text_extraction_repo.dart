import 'package:bizkit/module/biz_card/domain/modell/text_extraction/text_extraction_model/text_extraction_model.dart';
import 'package:bizkit/module/biz_card/domain/modell/text_extraction/text_extraction_responce/text_extraction_responce.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/model/failure/failure.dart';

abstract class TextExtractionRepo {
  Future<Either<Failure, TextExtractionResponce>> textExtracion(
      {required TextExtractionModel textExtractionModel});
}
