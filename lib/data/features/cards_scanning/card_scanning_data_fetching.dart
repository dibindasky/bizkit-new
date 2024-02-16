import 'package:bizkit/application/presentation/utils/validators/validators.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardScanningRepo)
@injectable
class CardScanningImpl implements CardScanningRepo {
  @override
  Future<Either<Failure, ScannedImageDatasModel>> processAndSortFromImage(
    List<ImageModel>? processingImages,
  ) async {
    try {
      ScannedImageDatasModel result = ScannedImageDatasModel(
          emails: [], names: [], phone: [], unknown: [], websites: []);
      if (processingImages == null) {
        return Left(Failure(message: 'No File selected'));
      }
      for (var element in processingImages) {
        final inputImage = InputImage.fromFile(element.fileImage);
        final textRecognizer =
            TextRecognizer(script: TextRecognitionScript.latin);
        final RecognizedText recognizedText =
            await textRecognizer.processImage(inputImage);

        for (TextBlock block in recognizedText.blocks) {
          for (TextLine line in block.lines) {
            // addToDetail(line.text, result);
            for (TextElement element in line.elements) {
              addToDetail(element.text, result);
            }
          }
        }
      }
      print(
          'map data from processAndSortFromImage function source function $result');
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  void addToDetail(String input, ScannedImageDatasModel result) {
    if (isValidPhoneNumber(input) ||
        (input.contains('+91') && input.length > 10)) {
      result.phone!.add(input);
    } else if (isValidWebsite(input)) {
      result.websites!.add(input);
    } else if (isValidEmail(input)) {
      result.emails!.add(input);
    } else if (isValidName(input)) {
      result.names!.add(input);
    } else {
      result.unknown!.add(input);
    }
  }
}
