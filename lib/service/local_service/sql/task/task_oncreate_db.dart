import 'dart:developer';

import 'package:bizkit/module/task/domain/model/chat/current_location/current_location_message.dart';
import 'package:bizkit/module/task/domain/model/chat/file/file_model.dart';
import 'package:bizkit/module/task/domain/model/task/filter_by_deadline_model/filter_by_deadline_model.dart';
import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll_answer.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll_supporter.dart';
import 'package:bizkit/module/task/domain/model/chat/text/text_message.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence/time_expence_message.dart';
import 'package:bizkit/module/task/domain/model/chat/voice/voice_model.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/assigned_to_detail.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/get_task_responce.dart';
import 'package:bizkit/module/task/domain/model/task/get_task_responce/sub_task.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../../../module/task/domain/model/task/get_task_responce/attachment.dart';

class TaskSql {
  static const tasksTable = 'bizkit_tasks';
  static const taskAttachmentsTable = 'task_attachments';
  static const taskSubTasksTable = 'task_subtasks';
  static const taskAssignedToDetailTable = 'task_assigned_to_detail';
  static const taskMessages = 'task_message_table';
  static const taskMessageCurrentLocation = 'task_message_current_location';
  static const taskMessagefile = 'task_message_file';
  static const taskMessageVoice = 'task_message_voice';
  static const taskMessageTimeExpence = 'task_message_time_expence';
  static const taskMessageText = 'task_message_text';
  static const taskMessagePoll = 'task_message_poll';
  static const taskMessagePollAnswer = 'task_message_poll_answer';
  static const taskMessagePollSupporters = 'task_message_poll_supporters';

  static const recentTasksTable = 'recent_tasks';
  static const filterByDeadlineTable = 'tasks_filter_by_deadline';

  static Future onCreate(sql.Database db) async {
    try {
      log('----------------- oncreate database task module ---------------------');
      await db.execute(_bizkitTaskTableCreation);
      await db.execute(_taskAttachmentsTableCreation);
      await db.execute(_taskSubTasksTableCreation);
      await db.execute(_taskAssignedToDetailTableCreation);
      await db.execute(_taskMessagesTableCreation);
      await db.execute(_pollMessageTableCreation);
      await db.execute(_taskMesageTextTableCreation);
      await db.execute(_voiceMessageTableCreation);
      await db.execute(_fileMessageTableCreation);
      await db.execute(_timeExpenseTableCreation);
      await db.execute(_currentLocationMessageTableCreation);
      await db.execute(_taskMessagePollAnswersTableCreation);
      await db.execute(_taskMessagePollSupportersTableCreation);
      await db.execute(_filterByDeadlineTableCreation);
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
    ${GetTaskResponce.colTaskTotalExpense} INTEGER,
    ${GetTaskResponce.colTaskType} TEXT,
    ${GetTaskResponce.colTaskSpotlightOn} INTEGER,  -- Boolean field (1 for true, 0 for false)
    ${GetTaskResponce.colTaskIsPinned} INTEGER  -- Boolean field (1 for true, 0 for false)
  )
  ''';

  /// Table for [Attachment] relation with [GetTaskResponce]
  static const String _taskAttachmentsTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskAttachmentsTable(
      ${Attachment.colTaskAttachmentLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Attachment.colTaskAttachment} TEXT,
      ${Attachment.colTaskAttachmentType} TEXT,
      ${Attachment.colTaskAttachmentReferenceId} INTEGER,
      FOREIGN KEY (${Attachment.colTaskAttachmentReferenceId}) REFERENCES $tasksTable(${GetTaskResponce.colTaskLocalId})
      ON DELETE CASCADE  
    )
  ''';

  /// Table for [SubTask] relation with [GetTaskResponce]
  static const String _taskSubTasksTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskSubTasksTable(
      ${SubTask.colTaskSubtaskLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${SubTask.colTaskSubtaskId} TEXT,
      ${SubTask.colTaskSubtaskTitle} TEXT,
      ${SubTask.colTaskSubtaskDescription} TEXT,
      ${SubTask.colTaskSubtaskDeadline} TEXT,
      ${SubTask.colTaskSubtaskIsCompleted} INTEGER,  -- Boolean field (1 for true, 0 for false)
      ${SubTask.colTaskSubtaskTotalTimeTaken} TEXT,
      ${SubTask.colTaskSubtaskDuration} TEXT,
      ${SubTask.colTaskSubTaskReferenceId} INTEGER,
      FOREIGN KEY (${SubTask.colTaskSubTaskReferenceId}) REFERENCES $tasksTable(${GetTaskResponce.colTaskLocalId})
      ON DELETE CASCADE 
    )
  ''';

  /// Table for [AssignedToDetail] relation with [GetTaskResponce]
  static const String _taskAssignedToDetailTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskAssignedToDetailTable(
      ${AssignedToDetail.colTaskAssignedToDetailLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${AssignedToDetail.colTaskAssignedToDetailUserId} TEXT,
      ${AssignedToDetail.colTaskAssignedToDetailUserName} TEXT,
      ${AssignedToDetail.colTaskAssignedToDetailIsAccepted} TEXT,
      ${AssignedToDetail.ccolTaskAssignedToDetailReferenceId} INTEGER,
      FOREIGN KEY (${AssignedToDetail.ccolTaskAssignedToDetailReferenceId}) REFERENCES $tasksTable(${GetTaskResponce.colTaskLocalId})
      ON DELETE CASCADE 
    )
  ''';

  /// Table for Filter task by deadline [FilterByDeadlineModel] relation with [GetTaskResponce]
  static const _filterByDeadlineTableCreation = '''
  CREATE TABLE IF NOT EXISTS $filterByDeadlineTable(
    ${FilterByDeadlineModel.colTaskFilterByDeadlineLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${FilterByDeadlineModel.colTaskFilterByDeadline} TEXT,
    ${FilterByDeadlineModel.colUserId} TEXT,
    ${FilterByDeadlineModel.colTaskId} TEXT,
    ${FilterByDeadlineModel.colTaskFilterByDeadlineReferenceId} INTEGER,
    FOREIGN KEY (${FilterByDeadlineModel.colTaskFilterByDeadlineReferenceId}) 
      REFERENCES $tasksTable(${GetTaskResponce.colTaskLocalId})
      ON DELETE CASCADE
  )
''';

  /// Table for [TextMessage]
  static const String _taskMesageTextTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskMessageText(
      ${TextMessage.colLocalDbId}  INTEGER PRIMARY KEY AUTOINCREMENT,
      ${TextMessage.colLocalId}  TEXT,
      ${TextMessage.colUserId} TEXT ,
      ${TextMessage.colCurrentUid} TEXT ,
      ${TextMessage.colUsername} TEXT ,
      ${TextMessage.colProfilePicture} TEXT ,
      ${TextMessage.colTimestamp} TEXT ,
      ${TextMessage.colMessageId} TEXT ,
      ${TextMessage.colMessage} TEXT ,
      ${TextMessage.colReadByAll} INTEGER,
      ${TextMessage.colMessageType} TEXT,
      ${TextMessage.colReadBy} INTEGER
    )
  ''';

  /// Table for [VoiceMessage]
  static const String _voiceMessageTableCreation = '''
   CREATE TABLE IF NOT EXISTS $taskMessageVoice(
     ${VoiceMessage.colLocalDbId} INTEGER PRIMARY KEY AUTOINCREMENT,
     ${VoiceMessage.colLocalId} TEXT,
     ${VoiceMessage.colMessageType} TEXT,
     ${VoiceMessage.colMessage} TEXT,
     ${VoiceMessage.colUserId} TEXT,
     ${VoiceMessage.colUsername} TEXT,
     ${VoiceMessage.colProfilePicture} TEXT,
     ${VoiceMessage.colMessageId} TEXT,
     ${VoiceMessage.colTimestamp} TEXT,
     ${VoiceMessage.colVoice} TEXT,
     ${VoiceMessage.colDuration} TEXT,
     ${VoiceMessage.colReadByAll} INTEGER,
     ${VoiceMessage.colCurrentUid} TEXT,
     ${VoiceMessage.colSender} INTEGER
   )
  ''';

  /// Table for [FileMessage]
  static const String _fileMessageTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskMessagefile(
      ${FileMessage.colLocalDbId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${FileMessage.colLocalId} TEXT,
      ${FileMessage.colMessageType} TEXT,
      ${FileMessage.colMessage} TEXT,
      ${FileMessage.colUserId} TEXT,
      ${FileMessage.colUsername} TEXT,
      ${FileMessage.colProfilePicture} TEXT,
      ${FileMessage.colMessageId} TEXT,
      ${FileMessage.colTimestamp} TEXT,
      ${FileMessage.colFile} TEXT,
      ${FileMessage.colFileType} TEXT,
      ${FileMessage.colFilePath} TEXT,
      ${FileMessage.colReadByAll} INTEGER,
      ${FileMessage.colSender} INTEGER,
      ${FileMessage.colCurrentUid} TEXT
    )
  ''';

  /// Table for [TimeExpense]
  static const String _timeExpenseTableCreation = '''
   CREATE TABLE IF NOT EXISTS $taskMessageTimeExpence(
      ${TimeExpense.colLocalDbId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${TimeExpense.colLocalId} TEXT,
      ${TimeExpense.colMessageType} TEXT,
      ${TimeExpense.colMessage} TEXT,
      ${TimeExpense.colUserId} TEXT,
      ${TimeExpense.colUsername} TEXT,
      ${TimeExpense.colProfilePicture} TEXT,
      ${TimeExpense.colMessageId} TEXT,
      ${TimeExpense.colTimestamp} TEXT,
      ${TimeExpense.colTimeExpenseData} TEXT,
      ${TimeExpense.colReadByAll} INTEGER,
      ${TimeExpense.colSender} INTEGER,
      ${TimeExpense.colId} TEXT,
      ${TimeExpense.colUserName} TEXT,
      ${TimeExpense.colTaskId} TEXT,
      ${TimeExpense.colTime} TEXT,
      ${TimeExpense.colExpense} TEXT,
      ${TimeExpense.colDescription} TEXT,
      ${TimeExpense.colStartDate} TEXT,
      ${TimeExpense.colEndDate} TEXT
    )
  ''';

  /// Table for [CurrentLocationMessage]
  static const String _currentLocationMessageTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskMessageCurrentLocation(
      ${CurrentLocationMessage.colLocalDbId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${CurrentLocationMessage.colLocalId} TEXT,
      ${CurrentLocationMessage.colMessageType} TEXT,
      ${CurrentLocationMessage.colMessage} TEXT,
      ${CurrentLocationMessage.colUserId} TEXT,
      ${CurrentLocationMessage.colUsername} TEXT,
      ${CurrentLocationMessage.colProfilePicture} TEXT,
      ${CurrentLocationMessage.colMessageId} TEXT,
      ${CurrentLocationMessage.colTimestamp} TEXT,
      ${CurrentLocationMessage.colLocation} TEXT,
      ${CurrentLocationMessage.colReadByAll} INTEGER,
      ${CurrentLocationMessage.colSender} INTEGER,
      ${CurrentLocationMessage.colIsLoadMore} INTEGER,
      ${CurrentLocationMessage.colCurrentUid} TEXT,
      ${CurrentLocationMessage.colPlace} TEXT
    )
  ''';

  /// Table for [Poll]
  static const String _pollMessageTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskMessagePoll(
      ${Poll.colLocalDbId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Poll.colLocalId} TEXT,
      ${Poll.colSender} INTEGER,
      ${Poll.colPollId} TEXT,
      ${Poll.colMessageId} TEXT,
      ${Poll.colCurrentUid} TEXT,
      ${Poll.colPollQuestion} TEXT,
      ${Poll.colTimestamp} TEXT,
      ${Poll.colUserName} TEXT,
      ${Poll.colProfilePicture} TEXT,
      ${Poll.colUserId} TEXT,
      ${Poll.colReadBy} TEXT,
      ${Poll.colActiveUntil} TEXT,
      ${Poll.colMultipleAnswer} INTEGER,
      ${Poll.colAnonymousVote} INTEGER,
      ${Poll.colResonRequired} INTEGER,
      ${Poll.colMessageType} TEXT,
      ${Poll.colReadByAll} INTEGER
    )
  ''';

  /// Table for [PollAnswer]
  static const String _taskMessagePollAnswersTableCreation = '''
   CREATE TABLE IF NOT EXISTS $taskMessagePollAnswer(
     ${PollAnswer.colLocalDbId} INTEGER PRIMARY KEY AUTOINCREMENT,
     ${PollAnswer.colLocalId} TEXT,
     ${PollAnswer.colAnswerId} TEXT,
     ${PollAnswer.colAnswerText} TEXT,
     ${PollAnswer.colAnswerVotes} INTEGER,
     ${PollAnswer.colMessageId} TEXT
   )
  ''';

  /// Table for [Supporter]
  static const String _taskMessagePollSupportersTableCreation = '''
   CREATE TABLE IF NOT EXISTS $taskMessagePollSupporters(
     ${Supporter.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
     ${Supporter.colName} TEXT,
     ${Supporter.colProfilePicture} TEXT,
     ${Supporter.colReason} TEXT,
     ${Supporter.colMessageId} TEXT,
     ${Supporter.colUserId} TEXT,
     ${Supporter.colAnswerId} TEXT
   )
  ''';

  /// Table for [Message]
  static const String _taskMessagesTableCreation = '''
    CREATE TABLE IF NOT EXISTS $taskMessages(
      ${Message.colLocalDbId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Message.colLocalId} TEXT,
      ${Message.colSender} INTEGER,
      ${Message.colMessageId} TEXT,
      ${Message.colTimestamp} TEXT,
      ${Message.colTaskId} TEXT,
      ${Message.colMessageType} TEXT,
      ${Message.colDeleted} INTEGER
    )
  ''';
  // /// Table for [Message]
  // static const String _taskMessagesTableCreation = '''
  //   CREATE TABLE IF NOT EXISTS $taskMessages(
  //     ${Message.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
  //     ${Message.colSender} INTEGER,
  //     ${Message.colMessageId} TEXT,
  //     ${Message.colMessageType} TEXT,
  //     ${Message.colFile} INTEGER ,
  //     ${Message.colPoll} INTEGER ,
  //     ${Message.colTextMessage} INTEGER ,
  //     ${Message.colTimeExpense} INTEGER ,
  //     ${Message.colVoiceMessage} INTEGER ,
  //     FOREIGN KEY (${Message.colFile}) REFERENCES $taskMessagefile(${FileMessage.colLocalId}),
  //     FOREIGN KEY (${Message.colPoll}) REFERENCES $taskMessagePoll(${Poll.colLocalId}),
  //     FOREIGN KEY (${Message.colTextMessage}) REFERENCES $taskMessageText(${TextMessage.colLocalId}),
  //     FOREIGN KEY (${Message.colTimeExpense}) REFERENCES $taskMessageTimeExpence(${TimeExpense.colLocalId}),
  //     FOREIGN KEY (${Message.colVoiceMessage}) REFERENCES $taskMessageVoice(${VoiceMessage.colLocalId})
  //   )
  // ''';
}
