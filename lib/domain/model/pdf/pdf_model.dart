import 'dart:io';

import 'package:dio/dio.dart';

class PdfModel {
  File? file;
  MultipartFile? multipartFile;
  String? base64;
  PdfModel({this.file, this.multipartFile, this.base64});
}
