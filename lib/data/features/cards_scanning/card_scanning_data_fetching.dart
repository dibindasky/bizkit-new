import 'dart:io';

import 'package:bizkit/application/presentation/utils/validators/validators.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:bizkit/domain/repository/card_scanning.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardScanningDataFetchingRepo)
@injectable
class CardScanningDataFetching implements CardScanningDataFetchingRepo {
  @override
  Future<Either<Failure, ScannedImageDatasModel>> processAndSortFromImage(
    List<File>? processingImages,
  ) async {
    try {
      Map<String, List<String>> result = {
        'phones': [],
        'emails': [],
        'websites': [],
        'names': [],
        'unKnown': [],
      };
      if (processingImages == null) {
        return Left(Failure(message: 'No File selected'));
      }
      for (var element in processingImages) {
        final inputImage = InputImage.fromFile(element);
        final textRecognizer =
            TextRecognizer(script: TextRecognitionScript.latin);
        final RecognizedText recognizedText =
            await textRecognizer.processImage(inputImage);

        for (TextBlock block in recognizedText.blocks) {
          for (TextLine line in block.lines) {
            addToDetail(line.text, result);
            for (TextElement element in line.elements) {
              addToDetail(element.text, result);
            }
          }
        }
      }
      print(
          'map data from processAndSortFromImage function source function $result');
      return Right(ScannedImageDatasModel.fromJson(result));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  void addToDetail(String input, Map<String, List<String>> result) {
    if (isValidPhoneNumber(input) ||
        (input.contains('+91') && input.length > 10)) {
      result['phones']!.add(input);
    } else if (isValidWebsite(input)) {
      result['websites']!.add(input);
    } else if (isValidEmail(input)) {
      result['emails']!.add(input);
    } else if (isValidName(input)) {
      result['names']!.add(input);
    } else {
      result['unKnown']!.add(input);
    }
  }
}
