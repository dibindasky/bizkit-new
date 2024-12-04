import 'dart:io';

import 'package:bizkit/utils/constants/constant.dart';
import 'package:injectable/injectable.dart' as inj;
import 'package:path_provider/path_provider.dart' as path;

@inj.LazySingleton()
@inj.injectable
class PathProvider {
  /// to get the base directory of application
  Future<Directory> _getBaseDirectory() async {
    return await path
        .getApplicationDocumentsDirectory(); // For app-specific storage.
  }

  /// will return a path to the directory
  /// if the given path is not found then crete and return the path
  /// send [path] such a way how it should created in the [module] folder
  Future<String> getDirectory(
      {required String path, Module? module}) async {
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
  }

  /// get temporary directory for storage
  Future<Directory> getTemporaryDirectory() async {
    return await path.getTemporaryDirectory();
  }
}
