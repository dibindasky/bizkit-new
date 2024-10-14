import 'dart:developer';

import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:sqflite/sqflite.dart' as sql;

class TaskSql {
  static const tasksTable = 'bizkit_tasks';

  static Future onCreate(sql.Database db) async {
    try {
      log('----------------- oncreate database task module ---------------------');
      await db.execute(_bizkitTaskTableCreation);
    } catch (e) {
      log('onCreate ==> ${e.toString()}');
    }
  }

  /// Table for bizkit task
  static const String _bizkitTaskTableCreation = '''
  CREATE TABLE IF NOT EXISTS $tasksTable (
    ${GetTaskResponce.colTaskLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${GetTaskResponce.colUserId} TEXT,
    ${GetTaskResponce.colTaskId} TEXT,
    ${GetTaskResponce.colTaskCreatedBy} TEXT,
    ${GetTaskResponce.colTaskTitle} TEXT,
    ${GetTaskResponce.colTaskDescription} TEXT,
    ${GetTaskResponce.colTaskPriorityLevel} TEXT,
    ${GetTaskResponce.colTaskRecurrentTask} INTEGER,    -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskIsCompleted} INTEGER,  -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskIsOwned} INTEGER,   -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskDeadLine} TEXT,
    ${GetTaskResponce.colTaskIsKilled} INTEGER,   -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskTags} TEXT,    -- Tags stored as TEXT (e.g. comma-separated)
    ${GetTaskResponce.colTaskCreatedAt} TEXT,
    ${GetTaskResponce.colTaskStatus} TEXT,
    ${GetTaskResponce.colTaskCreatedUserId} TEXT,
    ${GetTaskResponce.colTaskCreatedUsername} TEXT,
    ${GetTaskResponce.colTaskCreatedUserProfilePic} TEXT,
    ${GetTaskResponce.colTaskTotalTime} INTEGER,
    ${GetTaskResponce.colTaskTotalExpense} INTEGER
  )
  ''';
}
