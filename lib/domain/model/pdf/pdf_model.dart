import 'dart:io';

import 'package:dio/dio.dart';

class PdfModel {
  File? file;
  MultipartFile? multipartFile;
  PdfModel({this.file, this.multipartFile});
}
