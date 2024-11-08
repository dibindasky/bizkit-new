import 'dart:developer';

import 'package:bizkit/module/task/domain/model/chat/current_location/current_location_message.dart';
import 'package:bizkit/module/task/domain/model/chat/file/file_model.dart';
import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll_answer.dart';
import 'package:bizkit/module/task/domain/model/chat/poll/poll_supporter.dart';
import 'package:bizkit/module/task/domain/model/chat/text/text_message.dart';
import 'package:bizkit/module/task/domain/model/chat/time_expence/time_expence_message.dart';
import 'package:bizkit/module/task/domain/model/chat/voice/voice_model.dart';
import 'package:bizkit/module/task/domain/repository/sqfilte/chat/task_chat_local_service_repo.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/task/task_oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TaskChatLocalServiceRepo)
@injectable
class TaskChatLocalService implements TaskChatLocalServiceRepo {
  LocalService localService = LocalService();

  /// get [Message]s from local db
  @override
  Future<List<Message>?> getMessagesWithLimit(
      {required int limit, required int offset, required String taskId}) async {
    try {
      const String query = '''
            SELECT * FROM ${TaskSql.taskMessages} 
            WHERE ${Message.colTaskId} = ? 
            ORDER BY ${Message.colTimestamp} DESC 
            LIMIT ? OFFSET ?
          ''';
      final data = await localService.rawQuery(query, [taskId, limit, offset]);
      List<Message> messages = [];
      for (int i = 0; i < data.length; i++) {
        // for (int i = 0; i <= offset + limit; i++) {
        if (i >= data.length) break;
        final type = data[i][Message.colMessageType] as String?;
        final messageId = (data[i][Message.colMessageId] as String?) ?? '';
        Message message = Message(
          messageId: messageId,
          messageType: type,
          sender: (data[i][Message.colSender] as int?) == 1 ? true : false,
          deleted: (data[i][Message.colDeleted] as int?) == 1 ? true : false,
          timestamp: data[i][Message.colTimestamp] as String?,
          textMessage: (type == 'text')
              ? await _getTextMessage(messageId: messageId)
              : null,
          currentLocation: (type == 'location')
              ? await _getCurrentLocationMessage(messageId: messageId)
              : null,
          file: (type == 'file')
              ? await _getFileMessage(messageId: messageId)
              : null,
          poll: (type == 'poll')
              ? await _getPollMessage(messageId: messageId)
              : null,
          timeExpence: (type == 'time_expense')
              ? await _getTimeExpense(messageId: messageId)
              : null,
          voiceMessage: (type == 'voice')
              ? await _getVoiceMessage(messageId: messageId)
              : null,
          isLoadMore: true,
        );
        messages.add(message);
      }
      print('getMessagesWithLimit messages length => ${messages.length}');
      return messages;
    } catch (e) {
      log('getMessages error => ${e.toString()}');
      return null;
    }
  }

  /// [Message] insert if not present or else update
  @override
  Future<int?> insertOrUpdateMessage({required Message message}) async {
    try {
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.taskMessages} 
      WHERE ${Message.colMessageId} = ? 
    ''';
      final present =
          await localService.presentOrNot(query, [message.messageId ?? '']);
      print('insertOrUpdateMessage => present $present');
      if (present) {
        return _updateMessage(message: message);
      } else {
        return _insertMessage(message: message);
      }
    } catch (e) {
      log('insertOrUpdateMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// insert [Message] to local db
  Future<int?> _insertMessage({required Message message}) async {
    try {
      const String query = '''
      INSERT INTO ${TaskSql.taskMessages} (
        ${Message.colSender},
        ${Message.colMessageId},
        ${Message.colTimestamp},
        ${Message.colTaskId},
        ${Message.colMessageType},
        ${Message.colDeleted}
      ) 
      VALUES (?,?,?,?,?,?)
    ''';
      final localId = await localService.rawInsert(query, [
        (message.sender ?? false) ? 1 : 0,
        message.messageId ?? '',
        message.timestamp ?? '',
        message.taskId ?? '',
        message.messageType ?? '',
        message.deleted ? 1 : 0,
      ]);
      switch (message.messageType) {
        case 'text':
          insertOrUpdateTextMessage(textMessage: message.textMessage!);
        case 'file':
          insertOrUpdateFileMessage(fileMessage: message.file!);
        case 'poll':
          insertOrUpdatePoll(poll: message.poll!);
        case 'time_expense':
          insertOrUpdateTimeExpense(timeExpense: message.timeExpence!);
        case 'location':
          insertOrUpdateCurrentLocationMessage(
              currentLocationMessage: message.currentLocation!);
        case 'voice':
          insertOrUpdateVoiceMessage(voiceMessage: message.voiceMessage!);
        default:
          log('nothing to be inserted');
      }
      return localId;
    } catch (e) {
      log('insertMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// update [Message]
  Future<int?> _updateMessage({required Message message}) async {
    try {
      const String query = '''
      UPDATE ${TaskSql.taskMessages} 
      SET
        ${Message.colSender} = ?,
        ${Message.colTimestamp} = ?,
        ${Message.colMessageType} = ?,
        ${Message.colDeleted} = ?
      WHERE
        ${Message.colMessageId} = ?
    ''';
      final affected = await localService.rawUpdate(query, [
        (message.sender ?? false) ? 1 : 0,
        message.timestamp ?? '',
        message.messageType ?? '',
        message.messageId ?? '',
        message.deleted ? 1 : 0,
      ]);
      switch (message.messageType) {
        case 'text':
          insertOrUpdateTextMessage(textMessage: message.textMessage!);
        case 'file':
          insertOrUpdateFileMessage(fileMessage: message.file!);
        case 'poll':
          insertOrUpdatePoll(poll: message.poll!);
        case 'time_expense':
          insertOrUpdateTimeExpense(timeExpense: message.timeExpence!);
        case 'location':
          insertOrUpdateCurrentLocationMessage(
              currentLocationMessage: message.currentLocation!);
        case 'voice':
          insertOrUpdateVoiceMessage(voiceMessage: message.voiceMessage!);
        default:
          log('nothing to be inserted');
      }
      return affected;
    } catch (e) {
      log('updateMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// [TextMessage] insert if not pressent or else update
  Future<int?> insertOrUpdateTextMessage(
      {required TextMessage textMessage}) async {
    try {
      const String query = '''
        SELECT COUNT(*) 
        FROM ${TaskSql.taskMessageText} 
        WHERE ${TextMessage.colMessageId} = ? 
      ''';
      final present =
          await localService.presentOrNot(query, [textMessage.messageId ?? '']);
      if (present) {
        return _updateTextMessage(textMessage: textMessage);
      } else {
        return _insertTextMessage(textMessage: textMessage);
      }
    } catch (e) {
      log('insertOrUpdateTextMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// insert [TextMessage] to local db
  Future<int?> _insertTextMessage({required TextMessage textMessage}) async {
    try {
      const String query = '''
        INSERT INTO ${TaskSql.taskMessageText} (
          ${TextMessage.colUserId} ,
          ${TextMessage.colCurrentUid} ,
          ${TextMessage.colUsername} ,
          ${TextMessage.colProfilePicture} ,
          ${TextMessage.colTimestamp} ,
          ${TextMessage.colMessage} ,
          ${TextMessage.colReadByAll} ,
          ${TextMessage.colReadBy} ,
          ${TextMessage.colMessageType} ,
          ${TextMessage.colMessageId} )
        VALUES (?,?,?,?,?,?,?,?,?,?)
      ''';
      return await localService.rawInsert(query, [
        textMessage.userId ?? '',
        textMessage.currentUid ?? '',
        textMessage.username ?? '',
        textMessage.profilePicture ?? '',
        textMessage.timestamp ?? '',
        textMessage.message ?? '',
        textMessage.readByAll ? 1 : 0,
        textMessage.readBy?.toString() ?? '',
        textMessage.messageType ?? '',
        textMessage.messageId ?? '',
      ]);
    } catch (e) {
      log('insertTextMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// update [TextMessage]
  Future<int?> _updateTextMessage({required TextMessage textMessage}) async {
    try {
      const String query = '''
        UPDATE ${TaskSql.taskMessageText} 
        SET
          ${TextMessage.colUserId} = ? ,
          ${TextMessage.colCurrentUid} = ? ,
          ${TextMessage.colUsername} = ? ,
          ${TextMessage.colProfilePicture} = ? ,
          ${TextMessage.colTimestamp} = ? ,
          ${TextMessage.colMessage} = ? ,
          ${TextMessage.colReadByAll} = ? ,
          ${TextMessage.colReadBy} = ?
        WHERE
          ${TextMessage.colMessageId} = ? 
      ''';
      return await localService.rawUpdate(query, [
        textMessage.userId ?? '',
        textMessage.currentUid ?? '',
        textMessage.username ?? '',
        textMessage.profilePicture ?? '',
        textMessage.timestamp ?? '',
        textMessage.message ?? '',
        textMessage.readByAll ? 1 : 0,
        textMessage.readBy?.toString() ?? '',
        textMessage.messageId ?? '',
      ]);
    } catch (e) {
      log('updateTextMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// retrive [TextMessage] using message id
  Future<TextMessage?> _getTextMessage({required String messageId}) async {
    try {
      final uid = await SecureStorage.getUserId() ?? '';
      final textMessagList = await localService.query(TaskSql.taskMessageText,
          where: '${TextMessage.colMessageId} = ?', whereArgs: [messageId]);
      return textMessagList.isEmpty
          ? null
          : TextMessage.fromJson(textMessagList.first,
              uid: uid, fromLocalDb: true);
    } catch (e) {
      return null;
    }
  }

  /// [VoiceMessage] insert if not present or else update
  Future<int?> insertOrUpdateVoiceMessage(
      {required VoiceMessage voiceMessage}) async {
    try {
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.taskMessageVoice} 
      WHERE ${VoiceMessage.colMessageId} = ? 
    ''';
      final present = await localService
          .presentOrNot(query, [voiceMessage.messageId ?? '']);
      if (present) {
        return _updateVoiceMessage(voiceMessage: voiceMessage);
      } else {
        return _insertVoiceMessage(voiceMessage: voiceMessage);
      }
    } catch (e) {
      log('insertOrUpdateVoiceMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// insert [VoiceMessage] to local db
  Future<int?> _insertVoiceMessage({required VoiceMessage voiceMessage}) async {
    try {
      const String query = '''
      INSERT INTO ${TaskSql.taskMessageVoice} (
        ${VoiceMessage.colMessageType},
        ${VoiceMessage.colMessage},
        ${VoiceMessage.colUserId},
        ${VoiceMessage.colUsername},
        ${VoiceMessage.colProfilePicture},
        ${VoiceMessage.colMessageId},
        ${VoiceMessage.colTimestamp},
        ${VoiceMessage.colVoice},
        ${VoiceMessage.colDuration},
        ${VoiceMessage.colReadByAll},
        ${VoiceMessage.colCurrentUid},
        ${VoiceMessage.colSender})
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?)
    ''';
      return await localService.rawInsert(query, [
        voiceMessage.messageType ?? '',
        voiceMessage.message ?? '',
        voiceMessage.userId ?? '',
        voiceMessage.username ?? '',
        voiceMessage.profilePicture ?? '',
        voiceMessage.messageId ?? '',
        voiceMessage.timestamp ?? '',
        voiceMessage.voice ?? '',
        voiceMessage.duration ?? '',
        (voiceMessage.readByAll ?? false) ? 1 : 0,
        voiceMessage.currentUid ?? '',
        voiceMessage.sender ? 1 : 0
      ]);
    } catch (e) {
      log('insertVoiceMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// update [VoiceMessage]
  Future<int?> _updateVoiceMessage({required VoiceMessage voiceMessage}) async {
    try {
      const String query = '''
      UPDATE ${TaskSql.taskMessageVoice} 
      SET
        ${VoiceMessage.colMessageType} = ?,
        ${VoiceMessage.colMessage} = ?,
        ${VoiceMessage.colUserId} = ?,
        ${VoiceMessage.colUsername} = ?,
        ${VoiceMessage.colProfilePicture} = ?,
        ${VoiceMessage.colTimestamp} = ?,
        ${VoiceMessage.colVoice} = ?,
        ${VoiceMessage.colDuration} = ?,
        ${VoiceMessage.colReadByAll} = ?,
        ${VoiceMessage.colCurrentUid} = ?,
        ${VoiceMessage.colSender} = ?
      WHERE
        ${VoiceMessage.colMessageId} = ?
    ''';
      return await localService.rawUpdate(query, [
        voiceMessage.messageType ?? '',
        voiceMessage.message ?? '',
        voiceMessage.userId ?? '',
        voiceMessage.username ?? '',
        voiceMessage.profilePicture ?? '',
        voiceMessage.timestamp ?? '',
        voiceMessage.voice ?? '',
        voiceMessage.duration ?? '',
        (voiceMessage.readByAll ?? false) ? 1 : 0,
        voiceMessage.currentUid ?? '',
        voiceMessage.sender ? 1 : 0,
        voiceMessage.messageId ?? ''
      ]);
    } catch (e) {
      log('updateVoiceMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// retrive [VoiceMessage] using message id
  Future<VoiceMessage?> _getVoiceMessage({required String messageId}) async {
    try {
      final uid = await SecureStorage.getUserId() ?? '';
      final voiceMessagList = await localService.query(TaskSql.taskMessageVoice,
          where: '${VoiceMessage.colMessageId} = ?', whereArgs: [messageId]);
      return voiceMessagList.isEmpty
          ? null
          : VoiceMessage.fromJson(voiceMessagList.first,
              uid: uid, fromLocalDb: true);
    } catch (e) {
      return null;
    }
  }

  /// [FileMessage] insert if not present or else update
  Future<int?> insertOrUpdateFileMessage(
      {required FileMessage fileMessage}) async {
    try {
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.taskMessagefile} 
      WHERE ${FileMessage.colMessageId} = ? 
    ''';
      final present =
          await localService.presentOrNot(query, [fileMessage.messageId ?? '']);
      if (present) {
        return _updateFileMessage(fileMessage: fileMessage);
      } else {
        return _insertFileMessage(fileMessage: fileMessage);
      }
    } catch (e) {
      log('insertOrUpdateFileMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// insert [FileMessage] to local db
  Future<int?> _insertFileMessage({required FileMessage fileMessage}) async {
    try {
      const String query = '''
      INSERT INTO ${TaskSql.taskMessagefile} (
        ${FileMessage.colMessageType},
        ${FileMessage.colMessage},
        ${FileMessage.colUserId},
        ${FileMessage.colUsername},
        ${FileMessage.colProfilePicture},
        ${FileMessage.colMessageId},
        ${FileMessage.colTimestamp},
        ${FileMessage.colFile},
        ${FileMessage.colFileType},
        ${FileMessage.colReadByAll},
        ${FileMessage.colSender},
        ${FileMessage.colCurrentUid})
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?)
    ''';
      return await localService.rawInsert(query, [
        fileMessage.messageType ?? '',
        fileMessage.message ?? '',
        fileMessage.userId ?? '',
        fileMessage.username ?? '',
        fileMessage.profilePicture ?? '',
        fileMessage.messageId ?? '',
        fileMessage.timestamp ?? '',
        fileMessage.file ?? '',
        fileMessage.fileType ?? '',
        (fileMessage.readByAll ?? false) ? 1 : 0,
        fileMessage.sender ? 1 : 0,
        fileMessage.currentUid ?? ''
      ]);
    } catch (e) {
      log('insertFileMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// update [FileMessage]
  Future<int?> _updateFileMessage({required FileMessage fileMessage}) async {
    try {
      const String query = '''
      UPDATE ${TaskSql.taskMessagefile} 
      SET
        ${FileMessage.colMessageType} = ?,
        ${FileMessage.colMessage} = ?,
        ${FileMessage.colUserId} = ?,
        ${FileMessage.colUsername} = ?,
        ${FileMessage.colProfilePicture} = ?,
        ${FileMessage.colTimestamp} = ?,
        ${FileMessage.colFile} = ?,
        ${FileMessage.colFileType} = ?,
        ${FileMessage.colReadByAll} = ?,
        ${FileMessage.colSender} = ?,
        ${FileMessage.colCurrentUid} = ?
      WHERE
        ${FileMessage.colMessageId} = ?
    ''';
      return await localService.rawUpdate(query, [
        fileMessage.messageType ?? '',
        fileMessage.message ?? '',
        fileMessage.userId ?? '',
        fileMessage.username ?? '',
        fileMessage.profilePicture ?? '',
        fileMessage.timestamp ?? '',
        fileMessage.file ?? '',
        fileMessage.fileType ?? '',
        (fileMessage.readByAll ?? false) ? 1 : 0,
        fileMessage.sender ? 1 : 0,
        fileMessage.currentUid ?? '',
        fileMessage.messageId ?? ''
      ]);
    } catch (e) {
      log('updateFileMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// retrive [FileMessage] using message id
  Future<FileMessage?> _getFileMessage({required String messageId}) async {
    try {
      final uid = await SecureStorage.getUserId() ?? '';
      final fileMessagList = await localService.query(TaskSql.taskMessagefile,
          where: '${FileMessage.colMessageId} = ?', whereArgs: [messageId]);
      return fileMessagList.isEmpty
          ? null
          : FileMessage.fromJson(fileMessagList.first,
              uid: uid, fromLocalDb: true);
    } catch (e) {
      return null;
    }
  }

  /// [TimeExpense] insert if not present or else update
  Future<int?> insertOrUpdateTimeExpense(
      {required TimeExpense timeExpense}) async {
    try {
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.taskMessageTimeExpence} 
      WHERE ${TimeExpense.colMessageId} = ? 
    ''';
      final present =
          await localService.presentOrNot(query, [timeExpense.messageId ?? '']);
      if (present) {
        return _updateTimeExpense(timeExpense: timeExpense);
      } else {
        return _insertTimeExpense(timeExpense: timeExpense);
      }
    } catch (e) {
      log('insertOrUpdateTimeExpense exception => ${e.toString()}');
      return null;
    }
  }

  /// insert [TimeExpense] to local db
  Future<int?> _insertTimeExpense({required TimeExpense timeExpense}) async {
    try {
      const String query = '''
      INSERT INTO ${TaskSql.taskMessageTimeExpence} (
        ${TimeExpense.colMessageType},
        ${TimeExpense.colMessage},
        ${TimeExpense.colUserId},
        ${TimeExpense.colUsername},
        ${TimeExpense.colProfilePicture},
        ${TimeExpense.colMessageId},
        ${TimeExpense.colTimestamp},
        ${TimeExpense.colReadByAll},
        ${TimeExpense.colSender},
        ${TimeExpense.colId},
        ${TimeExpense.colUserName},
        ${TimeExpense.colTaskId},
        ${TimeExpense.colTime},
        ${TimeExpense.colExpense},
        ${TimeExpense.colDescription},
        ${TimeExpense.colStartDate},
        ${TimeExpense.colEndDate}
      ) 
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
    ''';
      return await localService.rawInsert(query, [
        timeExpense.messageType ?? '',
        timeExpense.message ?? '',
        timeExpense.userId ?? '',
        timeExpense.username ?? '',
        timeExpense.profilePicture ?? '',
        timeExpense.messageId ?? '',
        timeExpense.timestamp ?? '',
        (timeExpense.readByAll ?? false) ? 1 : 0,
        timeExpense.sender ? 1 : 0,
        timeExpense.timeExpenseData?.id ?? '',
        timeExpense.timeExpenseData?.userName ?? '',
        timeExpense.timeExpenseData?.taskId ?? '',
        timeExpense.timeExpenseData?.time ?? '',
        timeExpense.timeExpenseData?.expense ?? '',
        timeExpense.timeExpenseData?.description ?? '',
        timeExpense.timeExpenseData?.startDate ?? '',
        timeExpense.timeExpenseData?.endDate ?? ''
      ]);
    } catch (e) {
      log('insertTimeExpense exception => ${e.toString()}');
      return null;
    }
  }

  /// update [TimeExpense]
  Future<int?> _updateTimeExpense({required TimeExpense timeExpense}) async {
    try {
      const String query = '''
      UPDATE ${TaskSql.taskMessageTimeExpence} 
      SET
        ${TimeExpense.colMessageType} = ?,
        ${TimeExpense.colMessage} = ?,
        ${TimeExpense.colUserId} = ?,
        ${TimeExpense.colUsername} = ?,
        ${TimeExpense.colProfilePicture} = ?,
        ${TimeExpense.colTimestamp} = ?,
        ${TimeExpense.colReadByAll} = ?,
        ${TimeExpense.colSender} = ?,
        ${TimeExpense.colId} = ?,
        ${TimeExpense.colTaskId} = ?,
        ${TimeExpense.colTime} = ?,
        ${TimeExpense.colExpense} = ?,
        ${TimeExpense.colDescription} = ?,
        ${TimeExpense.colStartDate} = ?,
        ${TimeExpense.colEndDate} = ?
      WHERE
        ${TimeExpense.colMessageId} = ?
    ''';
      return await localService.rawUpdate(query, [
        timeExpense.messageType ?? '',
        timeExpense.message ?? '',
        timeExpense.userId ?? '',
        timeExpense.username ?? '',
        timeExpense.profilePicture ?? '',
        timeExpense.timestamp ?? '',
        (timeExpense.readByAll ?? false) ? 1 : 0,
        timeExpense.sender ? 1 : 0,
        timeExpense.timeExpenseData?.id ?? '',
        timeExpense.timeExpenseData?.taskId ?? '',
        timeExpense.timeExpenseData?.time ?? '',
        timeExpense.timeExpenseData?.expense ?? '',
        timeExpense.timeExpenseData?.description ?? '',
        timeExpense.timeExpenseData?.startDate ?? '',
        timeExpense.timeExpenseData?.endDate ?? '',
        timeExpense.messageId ?? ''
      ]);
    } catch (e) {
      log('updateTimeExpense exception => ${e.toString()}');
      return null;
    }
  }

  /// retrive [TimeExpense] using message id
  Future<TimeExpense?> _getTimeExpense({required String messageId}) async {
    try {
      final uid = await SecureStorage.getUserId() ?? '';
      final timeExpenceMessagList = await localService.query(
          TaskSql.taskMessageTimeExpence,
          where: '${TimeExpense.colMessageId} = ?',
          whereArgs: [messageId]);
      return timeExpenceMessagList.isEmpty
          ? null
          : TimeExpense.fromJson(timeExpenceMessagList.first,
              uid: uid, fromLocalDb: true);
    } catch (e) {
      return null;
    }
  }

  /// [CurrentLocationMessage] insert if not present or else update
  Future<int?> insertOrUpdateCurrentLocationMessage(
      {required CurrentLocationMessage currentLocationMessage}) async {
    try {
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.taskMessageCurrentLocation} 
      WHERE ${CurrentLocationMessage.colMessageId} = ? 
    ''';
      final present = await localService
          .presentOrNot(query, [currentLocationMessage.messageId ?? '']);
      if (present) {
        return _updateCurrentLocationMessage(
            currentLocationMessage: currentLocationMessage);
      } else {
        return _insertCurrentLocationMessage(
            currentLocationMessage: currentLocationMessage);
      }
    } catch (e) {
      log('insertOrUpdateCurrentLocationMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// insert [CurrentLocationMessage] to local db
  Future<int?> _insertCurrentLocationMessage(
      {required CurrentLocationMessage currentLocationMessage}) async {
    try {
      const String query = '''
      INSERT INTO ${TaskSql.taskMessageCurrentLocation} (
        ${CurrentLocationMessage.colMessageType},
        ${CurrentLocationMessage.colMessage},
        ${CurrentLocationMessage.colUserId},
        ${CurrentLocationMessage.colUsername},
        ${CurrentLocationMessage.colProfilePicture},
        ${CurrentLocationMessage.colMessageId},
        ${CurrentLocationMessage.colTimestamp},
        ${CurrentLocationMessage.colLocation},
        ${CurrentLocationMessage.colReadByAll},
        ${CurrentLocationMessage.colSender},
        ${CurrentLocationMessage.colIsLoadMore},
        ${CurrentLocationMessage.colCurrentUid},
        ${CurrentLocationMessage.colPlace}
      ) 
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)
    ''';
      return await localService.rawInsert(query, [
        currentLocationMessage.messageType ?? '',
        currentLocationMessage.message ?? '',
        currentLocationMessage.userId ?? '',
        currentLocationMessage.username ?? '',
        currentLocationMessage.profilePicture ?? '',
        currentLocationMessage.messageId ?? '',
        currentLocationMessage.timestamp ?? '',
        (currentLocationMessage.location?.isEmpty ?? true)
            ? ''
            : '${currentLocationMessage.location![0]},${currentLocationMessage.location![1]}',
        (currentLocationMessage.readByAll ?? false) ? 1 : 0,
        currentLocationMessage.sender ? 1 : 0,
        currentLocationMessage.isLoadMore ? 1 : 0,
        currentLocationMessage.currentUid ?? '',
        currentLocationMessage.place ?? ''
      ]);
    } catch (e) {
      log('insertCurrentLocationMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// update [CurrentLocationMessage]
  Future<int?> _updateCurrentLocationMessage(
      {required CurrentLocationMessage currentLocationMessage}) async {
    try {
      const String query = '''
      UPDATE ${TaskSql.taskMessageCurrentLocation} 
      SET
        ${CurrentLocationMessage.colMessageType} = ?,
        ${CurrentLocationMessage.colMessage} = ?,
        ${CurrentLocationMessage.colUserId} = ?,
        ${CurrentLocationMessage.colUsername} = ?,
        ${CurrentLocationMessage.colProfilePicture} = ?,
        ${CurrentLocationMessage.colTimestamp} = ?,
        ${CurrentLocationMessage.colLocation} = ?,
        ${CurrentLocationMessage.colReadByAll} = ?,
        ${CurrentLocationMessage.colSender} = ?,
        ${CurrentLocationMessage.colIsLoadMore} = ?,
        ${CurrentLocationMessage.colCurrentUid} = ?,
        ${CurrentLocationMessage.colPlace} = ?
      WHERE
        ${CurrentLocationMessage.colMessageId} = ?
    ''';
      return await localService.rawUpdate(query, [
        currentLocationMessage.messageType ?? '',
        currentLocationMessage.message ?? '',
        currentLocationMessage.userId ?? '',
        currentLocationMessage.username ?? '',
        currentLocationMessage.profilePicture ?? '',
        currentLocationMessage.timestamp ?? '',
        (currentLocationMessage.location?.isEmpty ?? true)
            ? ''
            : '${currentLocationMessage.location![0]},${currentLocationMessage.location![1]}',
        (currentLocationMessage.readByAll ?? false) ? 1 : 0,
        currentLocationMessage.sender ? 1 : 0,
        currentLocationMessage.isLoadMore ? 1 : 0,
        currentLocationMessage.currentUid ?? '',
        currentLocationMessage.place ?? '',
        currentLocationMessage.messageId ?? ''
      ]);
    } catch (e) {
      log('updateCurrentLocationMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// retrive [CurrentLocationMessage] using message id
  Future<CurrentLocationMessage?> _getCurrentLocationMessage(
      {required String messageId}) async {
    try {
      final uid = await SecureStorage.getUserId() ?? '';
      final currentLocationMessagList = await localService.query(
          TaskSql.taskMessageCurrentLocation,
          where: '${CurrentLocationMessage.colMessageId} = ?',
          whereArgs: [messageId]);
      return currentLocationMessagList.isEmpty
          ? null
          : CurrentLocationMessage.fromJson(currentLocationMessagList.first,
              uid: uid, fromLocalDb: true);
    } catch (e) {
      return null;
    }
  }

  /// [Poll] insert if not present or else update
  Future<int?> insertOrUpdatePoll({required Poll poll}) async {
    try {
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.taskMessagePoll} 
      WHERE ${Poll.colMessageId} = ? 
    ''';
      final present =
          await localService.presentOrNot(query, [poll.messageId ?? '']);
      if (present) {
        return _updatePollMessage(poll: poll);
      } else {
        return _insertPollMessage(poll: poll);
      }
    } catch (e) {
      log('insertOrUpdatePoll exception => ${e.toString()}');
      return null;
    }
  }

  /// insert [Poll] to local db
  Future<int?> _insertPollMessage({required Poll poll}) async {
    try {
      const String query = '''
      INSERT INTO ${TaskSql.taskMessagePoll} (
        ${Poll.colSender},
        ${Poll.colPollId},
        ${Poll.colMessageId},
        ${Poll.colCurrentUid},
        ${Poll.colPollQuestion},
        ${Poll.colTimestamp},
        ${Poll.colUserName},
        ${Poll.colProfilePicture},
        ${Poll.colUserId},
        ${Poll.colReadBy},
        ${Poll.colActiveUntil},
        ${Poll.colMultipleAnswer},
        ${Poll.colAnonymousVote},
        ${Poll.colResonRequired},
        ${Poll.colMessageType},
        ${Poll.colReadByAll}
      ) 
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
    ''';
      final localId = await localService.rawInsert(query, [
        poll.sender ? 1 : 0,
        poll.pollId ?? '',
        poll.messageId ?? '',
        poll.currentUid ?? '',
        poll.pollQuestion ?? '',
        poll.timestamp ?? '',
        poll.userName ?? '',
        poll.profilePicture ?? '',
        poll.userId ?? '',
        poll.readBy?.toString() ?? '',
        poll.activeUntil ?? '',
        (poll.multipleAnswer ?? false) ? 1 : 0,
        (poll.anonymousVote ?? false) ? 1 : 0,
        (poll.resonRequired ?? false) ? 1 : 0,
        poll.messageType ?? '',
        poll.readByAll ? 1 : 0,
      ]);
      await insertOrUpdatePollAnswers(pollAnswers: poll.pollAnswers ?? []);
      return localId;
    } catch (e) {
      log('insertPollMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// update [Poll]
  Future<int?> _updatePollMessage({required Poll poll}) async {
    try {
      const String query = '''
      UPDATE ${TaskSql.taskMessagePoll} 
      SET
        ${Poll.colSender} = ?,
        ${Poll.colPollId} = ?,
        ${Poll.colCurrentUid} = ?,
        ${Poll.colPollQuestion} = ?,
        ${Poll.colTimestamp} = ?,
        ${Poll.colUserName} = ?,
        ${Poll.colProfilePicture} = ?,
        ${Poll.colUserId} = ?,
        ${Poll.colReadBy} = ?,
        ${Poll.colActiveUntil} = ?,
        ${Poll.colMultipleAnswer} = ?,
        ${Poll.colAnonymousVote} = ?,
        ${Poll.colResonRequired} = ?,
        ${Poll.colReadByAll} = ?
      WHERE
        ${Poll.colMessageId} = ?
    ''';
      final localId = await localService.rawUpdate(query, [
        poll.sender ? 1 : 0,
        poll.pollId ?? '',
        poll.currentUid ?? '',
        poll.pollQuestion ?? '',
        poll.timestamp ?? '',
        poll.userName ?? '',
        poll.profilePicture ?? '',
        poll.userId ?? '',
        poll.readBy?.toString() ?? '',
        poll.activeUntil ?? '',
        (poll.multipleAnswer ?? false) ? 1 : 0,
        (poll.anonymousVote ?? false) ? 1 : 0,
        (poll.resonRequired ?? false) ? 1 : 0,
        poll.readByAll ? 1 : 0,
        poll.messageId ?? '',
      ]);
      await insertOrUpdatePollAnswers(pollAnswers: poll.pollAnswers ?? []);
      return localId;
    } catch (e) {
      log('updatePollMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// retrive [Poll] using message id
  Future<Poll?> _getPollMessage({required String messageId}) async {
    try {
      final uid = await SecureStorage.getUserId() ?? '';
      final pollMessagList = await localService.query(TaskSql.taskMessagePoll,
          where: '${Poll.colMessageId} = ?', whereArgs: [messageId]);
      if (pollMessagList.isEmpty) {
        return null;
      }
      Poll poll =
          Poll.fromJson(pollMessagList.first, uid: uid, fromLocalDb: true);
      poll.pollAnswers = await _getPollAnswers(messageId: messageId);
      log('poll -> ${poll.toJson()}');
      return poll;
    } catch (e) {
      log('_getPollMessage exception => ${e.toString()}');
      return null;
    }
  }

  /// [PollAnswer] insert if not present, or else update
  Future<void> insertOrUpdatePollAnswers(
      {required List<PollAnswer> pollAnswers}) async {
    try {
      const String query = '''
      SELECT COUNT(*) 
      FROM ${TaskSql.taskMessagePollAnswer} 
      WHERE ${PollAnswer.colAnswerId} = ?
    ''';
      for (var pollAnswer in pollAnswers) {
        final present =
            await localService.presentOrNot(query, [pollAnswer.answerId ?? '']);
        present
            ? await _updatePollAnswer(pollAnswer: pollAnswer)
            : await _insertPollAnswer(pollAnswer: pollAnswer);
      }
    } catch (e) {
      log('insertOrUpdatePollAnswer exception => ${e.toString()}');
    }
  }

  /// Insert [PollAnswer] to local db
  Future<int?> _insertPollAnswer({required PollAnswer pollAnswer}) async {
    try {
      const String query = '''
      INSERT INTO ${TaskSql.taskMessagePollAnswer} (
        ${PollAnswer.colAnswerId},
        ${PollAnswer.colAnswerText},
        ${PollAnswer.colAnswerVotes},
        ${PollAnswer.colMessageId}
      ) VALUES (?,?,?,?)
    ''';
      final int localId = await localService.rawInsert(query, [
        pollAnswer.answerId ?? '',
        pollAnswer.answerText ?? '',
        pollAnswer.answerVotes ?? 0,
        pollAnswer.messageId ?? ''
      ]);
      await deleteAndInsertSupporters(
          supporters: pollAnswer.supporters ?? [],
          answerId: pollAnswer.answerId ?? '');
      return localId;
    } catch (e) {
      log('insertPollAnswer exception => ${e.toString()}');
      return null;
    }
  }

  /// Update [PollAnswer]
  Future<void> _updatePollAnswer({required PollAnswer pollAnswer}) async {
    try {
      const String query = '''
      UPDATE ${TaskSql.taskMessagePollAnswer} 
      SET
        ${PollAnswer.colAnswerText} = ?,
        ${PollAnswer.colAnswerVotes} = ?
      WHERE
        ${PollAnswer.colAnswerId} = ?
    ''';
      await localService.rawUpdate(query, [
        pollAnswer.answerText ?? '',
        pollAnswer.answerVotes ?? 0,
        pollAnswer.answerId ?? '',
      ]);
      await deleteAndInsertSupporters(
          supporters: pollAnswer.supporters ?? [],
          answerId: pollAnswer.answerId ?? '');
    } catch (e) {
      log('updatePollAnswer exception => ${e.toString()}');
    }
  }

  /// get poll answers with messageId
  Future<List<PollAnswer>?> _getPollAnswers({required String messageId}) async {
    try {
      final pollAnswerList = await localService.query(
          TaskSql.taskMessagePollAnswer,
          where: '${PollAnswer.colMessageId} = ?',
          whereArgs: [messageId]);
      if (pollAnswerList.isEmpty) {
        return null;
      }
      List<PollAnswer> pollAnswers = [];
      for (var e in pollAnswerList) {
        PollAnswer answer = PollAnswer.fromJson(e, messageId);
        answer.supporters = await _getPollAnswerSupporters(
            answerId: answer.answerId ?? '', messageId: messageId);
        pollAnswers.add(answer);
      }
      return pollAnswers;
    } catch (e) {
      log('_getPollAnswers exception => ${e.toString()}');
      return null;
    }
  }

  /// [Supporter] insert if not present, or else update
  Future<void> deleteAndInsertSupporters(
      {required List<Supporter> supporters, required String answerId}) async {
    try {
      for (var supporter in supporters) {
        await _deleteSupporter(answerId: answerId);
        await _insertSupporter(supporter: supporter, answerId: answerId);
      }
    } catch (e) {
      log('insertOrUpdateSupporter exception => ${e.toString()}');
    }
  }

  /// Insert [Supporter] to local db
  Future<int?> _insertSupporter(
      {required Supporter supporter, required String answerId}) async {
    try {
      const String query = '''
      INSERT INTO ${TaskSql.taskMessagePollSupporters} (
        ${Supporter.colName},
        ${Supporter.colProfilePicture},
        ${Supporter.colReason},
        ${Supporter.colAnswerId},
        ${Supporter.colUserId},
        ${Supporter.colMessageId}
      ) VALUES (?,?,?,?,?,?)
    ''';
      return await localService.rawInsert(query, [
        supporter.name ?? '',
        supporter.profilePicture ?? '',
        supporter.reason ?? '',
        answerId,
        supporter.userId ?? '',
        supporter.messageId ?? '',
      ]);
    } catch (e) {
      log('insertSupporter exception => ${e.toString()}');
      return null;
    }
  }

  /// Update [Supporter]
  Future<int?> _deleteSupporter({required String answerId}) async {
    try {
      const String query = '''
      DELETE FROM ${TaskSql.taskMessagePollSupporters} 
      WHERE
        ${Supporter.colAnswerId} = ?
    ''';
      return await localService.rawDelete(query, [answerId]);
    } catch (e) {
      log('deleteSupporter exception => ${e.toString()}');
      return null;
    }
  }

  /// get poll Answer Supporters
  Future<List<Supporter>?> _getPollAnswerSupporters(
      {required String answerId, required String messageId}) async {
    try {
      final pollAnswerSupportersList = await localService.query(
          TaskSql.taskMessagePollSupporters,
          where:
              '${Supporter.colAnswerId} = ? AND ${Supporter.colMessageId} = ?',
          whereArgs: [answerId, messageId]);
      if (pollAnswerSupportersList.isEmpty) {
        return [];
      }
      List<Supporter> pollAnswerSupporters = [];
      for (var e in pollAnswerSupportersList) {
        pollAnswerSupporters.add(
            Supporter.fromJson(e, messageId: messageId, answerId: answerId));
      }
      return pollAnswerSupporters;
    } catch (e) {
      log('_getPollAnswerSupporters exception => ${e.toString()}');
      return [];
    }
  }
}
