import 'dart:io';

import 'package:dio/dio.dart';

class ImageModel {
  File fileImage;
  MultipartFile multipartIamge;
  String base64;
  ImageModel(
      {required this.fileImage,
      required this.multipartIamge,
      required this.base64});
}
