import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future<File?> getImage({bool camera = true}) async {
    XFile? pickedImage = await ImagePicker()
        .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      final fileImage = File(pickedImage.path);
      return fileImage;
    }
    return null;
  }
}
