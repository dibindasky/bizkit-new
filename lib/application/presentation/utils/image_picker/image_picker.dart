import 'dart:io';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass {
  static Future<ImageModel?> getImage({bool camera = true}) async {
    XFile? pickedImage = await ImagePicker()
        .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      return ImageModel(
          fileImage: File(pickedImage.path),
          multipartIamge:
              await MultipartFile.fromFile(File(pickedImage.path).path));
    }
    return null;
  }
}
