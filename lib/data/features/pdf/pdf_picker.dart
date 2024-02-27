import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/pdf/pdf_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf_render/pdf_render.dart';

@LazySingleton()
@injectable
class PdfPickerImpl {
  Future<Either<Failure, PdfModel>> pickPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        String filePath = file.path!;
        MultipartFile multipartFile = await MultipartFile.fromFile(filePath);
        final bytes = await File(filePath).readAsBytes();
        String base64 = base64Encode(bytes);
        base64 = 'data:application/pdf;base64,$base64';
        print('pdf file pickeer ==========> $base64');
        return Right(PdfModel(
            // imagePreview: await getPdfPreview(filePath),
            file: File(filePath),
            multipartFile: multipartFile,
            base64: base64));
      } else {
        log('File not selected');
        return Left(Failure());
      }
    } catch (e) {
      log('Error picking PDF file: $e');
      return Left(Failure());
    }
  }

  Future<Image> getPdfPreview(String pdfPath) async {
    log(pdfPath);
    log('getPdfPreview 1');
    final document = await PdfDocument.openFile(pdfPath);
    log('getPdfPreview 2');
    final page = await document.getPage(0);
    log('getPdfPreview 3');
    final image = await page.render();
    log('getPdfPreview 4');
    return image.createImageDetached();
  }
}
