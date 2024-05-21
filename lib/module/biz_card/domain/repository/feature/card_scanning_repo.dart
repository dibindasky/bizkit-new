import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/biz_card/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:dartz/dartz.dart';

abstract class CardScanningRepo {
  Future<Either<Failure, ScannedImageDatasModel>> processAndSortFromImage(
    List<ImageModel>? processingImages,
  );
}
