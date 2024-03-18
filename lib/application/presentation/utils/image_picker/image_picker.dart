import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImagePickerClass {
  static Future<ImageModel?> getImage({bool camera = true}) async {
    try {
      XFile? pickedImage = await ImagePicker()
          .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
      if (pickedImage != null) {
        final extension = pickedImage.path.split(".").last;
        final directory = await getTemporaryDirectory();
        final compressedFilePath =
            '${directory.path}/${const Uuid().v4()}.$extension';
        File? compressedFile;
        int quality = 90;
        while (compressedFile == null ||
            compressedFile.lengthSync() > 300 * 1024) {
          compressedFile = await testCompressAndGetFile(
              File(pickedImage.path), compressedFilePath, quality);
          quality -= 10;
          if (quality < 0) {
            return null;
          }
        }
        final bytes = await File(compressedFile.path).readAsBytes();
        String base64 = base64Encode(bytes);
        base64 = 'data:image/$extension;base64,$base64';
        print('imagepicker =>base64 ======================== $base64');
        return ImageModel(
          fileImage: compressedFile,
          base64: base64,
        );
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<File?> testCompressAndGetFile(
      File file, String targetPath, int quality) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
      rotate: 180,
    );
    if (result != null) {
      return File(result.path);
    }
    return null;
  }
}
