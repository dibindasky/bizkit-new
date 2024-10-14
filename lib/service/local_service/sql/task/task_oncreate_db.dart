import 'dart:developer';

import 'package:sqflite/sqflite.dart' as sql;

class TaskSql {
  static const tasksTable = 'bizkit_tasks';

  static Future onCreate(sql.Database db) async {
    try {
      log('-----------------oncreate database task module ---------------------');
      await db.execute(_bizkitTasksTableCreation);
    } catch (e) {
      log('onCreate ==> ${e.toString()}');
    }
  }

  /// Table for bizkit tasks
  static const String _bizkitTasksTableCreation = '''
  CREATE TABLE IF NOT EXISTS $tasksTable (

  )
  ''';
}
