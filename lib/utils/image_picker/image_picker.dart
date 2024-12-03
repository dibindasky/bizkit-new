import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bizkit/core/model/image/image_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

enum AppPermissionStatus {
  storageDenied,
  storageGranted,
  storageLimited,
  storagePermanentlyDenied,
  storagePermanantlyDenied,
}

class ImagePickerClass {
  Future<AppPermissionStatus> checkStoragePermission() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      await Permission.photos.request();
      PermissionStatus status = await Permission.photos.status;
      if (status.isDenied) {
        return AppPermissionStatus.storageDenied;
      } else if (status.isGranted) {
        return AppPermissionStatus.storageGranted;
      } else if (status.isLimited) {
        return AppPermissionStatus.storageLimited;
      } else {
        return AppPermissionStatus.storagePermanantlyDenied;
      }
    } else {
      await Permission.storage.request();
      PermissionStatus status = await Permission.storage.status;
      if (status.isDenied) {
        return AppPermissionStatus.storageDenied;
      } else if (status.isGranted) {
        return AppPermissionStatus.storageGranted;
      } else {
        return AppPermissionStatus.storagePermanantlyDenied;
      }
    }
  }

  static Future<ImageModel?> getImage(
      {bool camera = true, bool cameraDeviceFront = false}) async {
    try {
      XFile? pickedImage;
      if (camera) {
        pickedImage = await ImagePicker().pickImage(
          source: ImageSource.camera,
          preferredCameraDevice:
              cameraDeviceFront ? CameraDevice.front : CameraDevice.rear,
        );
      } else {
        pickedImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
      }
      //  = await ImagePicker().pickImage(
      //   source: camera ? ImageSource.camera : ImageSource.gallery,
      //   preferredCameraDevice:
      //       cameraDeviceFront ? CameraDevice.rear : CameraDevice.front,
      // );
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
        // base64 = 'data:image/$extension;base64,$base64';
        // print('imagepicker =>base64 ======================== $base64');
        return ImageModel(
            fileImage: compressedFile,
            base64: base64,
            // type: extension,
            type: 'image');
      }
      return null;
    } catch (e) {
      log('from image pick class $e');
      return null;
    }
  }

  static Future<File?> testCompressAndGetFile(
      File file, String targetPath, int quality) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
    );
    if (result != null) {
      return File(result.path);
    }
    return null;
  }
}
