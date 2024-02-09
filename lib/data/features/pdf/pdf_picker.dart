import 'dart:developer';
import 'dart:io';

import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/pdf/pdf_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
@injectable
class PdfPickerImpl {
  Future<Either<Failure, PdfModel>> pickPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        String filePath = file.path!;
        MultipartFile multipartFile = await MultipartFile.fromFile(filePath);
        return Right(
            PdfModel(file: File(filePath), multipartFile: multipartFile));
      } else {
        log('File not selected');
        return Left(Failure());
      }
    } catch (e) {
      log('Error picking PDF file: $e');
      return Left(Failure());
    }
  }
}
