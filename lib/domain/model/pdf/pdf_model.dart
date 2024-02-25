import 'dart:io';

import 'package:dio/dio.dart';

class PdfModel {
  File? file;
  MultipartFile? multipartFile;
  File? imagePreview;
  String? base64;
  PdfModel({this.file, this.multipartFile, this.base64,this.imagePreview});
}
