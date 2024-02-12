import 'dart:convert';
import 'dart:io';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass {
  static Future<ImageModel?> getImage({bool camera = true}) async {
    XFile? pickedImage = await ImagePicker()
        .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      print(pickedImage.path);
      final bytes = await File(pickedImage.path).readAsBytes();
      String base64 = base64Encode(bytes);
      // base64 = base64.replaceFirst(
      //                   RegExp(r'data:image/[^;]+;base64,'), '');
      final extension = pickedImage.path.split(".").last;
      base64 = 'data:image/$extension;base64,$base64';
      print('imagepicker =>base64 ======================== $base64');
      return ImageModel(
          fileImage: File(pickedImage.path),
          base64: base64,
          multipartIamge:
              await MultipartFile.fromFile(File(pickedImage.path).path));
    }
    return null;
  }
}
