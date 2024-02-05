import 'dart:io';

import 'package:dio/dio.dart';

class ImageModel {
  File fileImage;
  MultipartFile multipartIamge;
  ImageModel({required this.fileImage, required this.multipartIamge});
}
