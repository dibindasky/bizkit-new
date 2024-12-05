import 'dart:developer';
import 'dart:io';

import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:injectable/injectable.dart' as inj;
import 'package:path_provider/path_provider.dart' as path;

@inj.LazySingleton()
@inj.injectable
class PathProvider {
  // PathProvider(this.apiService);
  // ApiService apiService;
  ApiService apiService = ApiService();

  /// to get the base directory of application
  Future<Directory> _getBaseDirectory() async {
    return await path
        .getApplicationDocumentsDirectory(); // For app-specific storage.
  }

  /// will return a path to the directory.
  /// if the given path is not found then crete and return the path
  /// send [path] such a way how it should created in the [module] folder
  Future<String?> getDirectory({required String path, Module? module}) async {
    try {
      final baseDir = await _getBaseDirectory();
      final directoryPath =
          '${baseDir.path}/${getStringFromModule(module) ?? 'general'}/$path';
      final directory = Directory(directoryPath);

      if (!directory.existsSync()) {
        await directory.create(
            recursive:
                true); // Create the directory structure if it doesn't exist.
      }
      return directoryPath;
    } catch (e) {
      log('exception getDirectory => $e');
      return null;
    }
  }

  /// will return a path to the directory.
  /// if the given path is not found then crete and return the path
  /// send [path] such a way how it should created in the [module] folder
  /// send [urlPath] from where the data should get downloaded
  /// send [fileName] only if want to add a given file name or it will trim form [urlPath]
  Future<String?> downloadSaveToFileAndReturnPath(
      {required String path,
      Module? module,
      required String urlPath,
      String? fileName}) async {
    try {
      String? filePath = await getDirectory(path: path, module: module);
      if (filePath == null) return null;
      fileName = fileName ?? _sanitizeFileName(urlPath.split('/').last);
      // .replaceFirst('.image', '.jpg');
      final pathName = '$filePath/$fileName';
      await apiService.download(urlPath: urlPath, filePath: pathName);
      log('success downloadAndReturnPath => $pathName');
      return pathName;
    } catch (e) {
      log('exception downloadAndReturnPath => $e');
      return null;
    }
  }

  /// pass [file] to be copied to the new [path]
  /// send [Module] and [fileName] if want to store in a custom place
  Future<String?> copyFileToPath(
      {required String path,
      Module? module,
      required File file,
      String? fileName}) async {
    try {
      String? filePath = await getDirectory(path: path, module: module);
      if (filePath == null) return null;
      fileName = fileName ?? _sanitizeFileName(file.path.split('/').last);
      // .replaceFirst('.image', '.jpg');
      final pathName = '$filePath/$fileName';
      await file.copy(pathName);
      log('success copyFileToPath => $pathName');
      return pathName;
    } catch (e) {
      log('exception copyFileToPath => $e');
      return null;
    }
  }

  /// get temporary directory for storage
  Future<Directory> getTemporaryDirectory() async {
    return await path.getTemporaryDirectory();
  }

  // Remove any characters that might cause issues in file paths
  String _sanitizeFileName(String fileName) {
    return fileName.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
    // .replaceAll('.image', '.jpg');
  }
}
