import 'dart:developer';

import 'package:bizkit/service/secure_storage/local_storage.dart';

class LocalStoragePreferenceTask {
  // Storage key for task caching preference
  static String taskCachingKey = 'task_caching_enabled';

  /// Sets whether tasks should be cached locally
  static Future<void> setTaskCachingEnabled(bool enabled) async {
    await LocalStorageService.setBool(taskCachingKey, enabled);
    log('Task caching preference updated: $enabled');
  }

  /// Retrieves whether tasks are set to be cached locally
  /// Returns false if no preference has been set
  static Future<bool> isTaskCachingEnabled() async {
    final isCachingEnabled = await LocalStorageService.getBool(taskCachingKey);
    return isCachingEnabled ?? true;
  }
}
