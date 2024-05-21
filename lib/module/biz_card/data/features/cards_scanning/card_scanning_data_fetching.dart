import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:bizkit/module/biz_card/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/feature/card_scanning_repo.dart';
import 'package:bizkit/utils/validators/validators.dart';
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
            result.unknown!.add(line.text);
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
      String formattedNumber =
          input.startsWith('+91') ? input.substring(3) : input;
      result.phone!.add(formattedNumber);
    } else if (isURLValid(input)) {
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
