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
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart';

@LazySingleton()
@injectable
class PdfPickerImpl {
  Future<PdfModel?> getPdf() async {
    PdfModel? pdf;
    final result = await pickPDF();
    result.fold((l) => null, (r) {
      pdf = r;
    });
    return pdf;
  }

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
        log(base64);
        print('pdf file pickeer ==========> $base64');
        return Right(PdfModel(
          file: File(filePath),
          multipartFile: multipartFile,
          base64: base64,
        ));
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
    final document = await PdfDocument.openFile(pdfPath);
    final page = await document.getPage(0);
    final image = await page.render();
    return image.createImageDetached();
  }

  Future<String?> convertBase64ToFile(String base64String, String fileName,
      {String? directoryPath}) async {
    {
      try {
        final bytes = base64Decode(base64String);
        if (bytes.isEmpty) {
          return null;
        }

        final directory = directoryPath != null
            ? Directory(directoryPath)
            : await getApplicationDocumentsDirectory();
        final filePath = File(join(directory.path, fileName));

        await filePath.writeAsBytes(bytes);
        return filePath.path;
      } catch (e) {
        log('error base64 to file = > $e');
        return null;
      }
    }
  }
}
