import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';

class PdfModel {
  File? file;
  MultipartFile? multipartFile;
  Image? imagePreview;
  String? base64;
  PdfModel({this.file, this.multipartFile, this.base64, this.imagePreview});
}
