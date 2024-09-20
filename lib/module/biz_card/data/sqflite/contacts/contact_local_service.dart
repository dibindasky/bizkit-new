import 'dart:developer';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/contact.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/contact_local_repo.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';

class ContactLocalService implements ContactLocalRepo {
  final LocalService localService = LocalService();

  ContactLocalService();

  @override
  Future<Either<Failure, SuccessResponseModel>> addContactToLocalStorage(
      {required ContactModel contact}) async {
    try {
      final userId = await SecureStorage.getUserId();
      const query = '''
          INSERT INTO ${Sql.contactTable} (
            ${ContactModel.colCurrentUserId},
            ${ContactModel.colName},
            ${ContactModel.colPhone},
            ${ContactModel.colPhoto},
            ${ContactModel.colEmail},
            ${ContactModel.colConnectionId},
            ${ContactModel.colCardId},
            ${ContactModel.colUserId})
          VALUES (?,?,?,?,?,?,?,?)
          ''';

      await localService.rawInsert(query, [
        userId ?? '',
        contact.name ?? '',
        contact.phoneNumber ?? '',
        contact.profilePicture ?? '',
        contact.email ?? '',
        contact.connectionId ?? '',
        contact.cardId ?? '',
        contact.userId ?? ''
      ]);
      return Right(SuccessResponseModel());
    } catch (e) {
      log('addContactToLocalStorage error=====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> updateContactInLocalStorage({
    required ContactModel contact,
  }) async {
    try {
      final userId = await SecureStorage.getUserId();
      const query = '''
        UPDATE ${Sql.contactTable}
        SET 
          ${ContactModel.colName} = ?, 
          ${ContactModel.colPhoto} = ?, 
          ${ContactModel.colEmail} = ?, 
          ${ContactModel.colConnectionId} = ?, 
          ${ContactModel.colCardId} = ?, 
          ${ContactModel.colUserId} = ?
        WHERE 
          ${ContactModel.colPhone} = ? AND ${ContactModel.colCurrentUserId} = ?
        ''';

      await localService.rawUpdate(query, [
        contact.name ?? '',
        contact.profilePicture ?? '',
        contact.email ?? '',
        contact.connectionId ?? '',
        contact.cardId ?? '',
        contact.userId ?? '',
        contact.phoneNumber ?? '',
        userId ?? ''
      ]);

      return Right(SuccessResponseModel());
    } catch (e) {
      log('updateContactInLocalStorage error=====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<ContactModel>>>
      getContactFromLocalStorage() async {
    try {
      final userId = await SecureStorage.getUserId();
      const String query =
          'SELECT * FROM ${Sql.contactTable} WHERE ${ContactModel.colCurrentUserId} = ?';
      final data = await localService.rawQuery(query, [userId ?? '']);
      log('getContactFromLocalStorage => length => ${data.length}');
      List<ContactModel> contacts = [];
      for (var x in data) {
        contacts.add(ContactModel.fromJson(x));
      }
      log('getContactFromLocalStorage success =====> ${contacts.length}');
      return Right(contacts);
    } catch (e) {
      log('getContactFromLocalStorage exception =====> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addContactToLocalStorageIfNotPresentInStorage(
          {required ContactModel contact}) async {
    try {
      final userId = await SecureStorage.getUserId();
      const String query =
          '''SELECT COUNT(*) FROM ${Sql.contactTable} WHERE ${ContactModel.colPhone} = ? AND ${ContactModel.colCurrentUserId} = ?''';
      final bool present = await localService
          .presentOrNot(query, [contact.phoneNumber!, userId ?? '']);
      log('contact present in db => $present');
      if (present) {
        return await updateContactInLocalStorage(contact: contact);
      } else {
        return await addContactToLocalStorage(contact: contact);
      }
    } catch (e) {
      log('addContactToLocalStorageIfNotPresentInStorage ======> ${e.toString()}');
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      removeExistingContactAndAddAsNew({required ContactModel contact}) async {
    try {
      final userId = await SecureStorage.getUserId();
      String sql =
          'DELETE FROM ${Sql.contactTable} WHERE ${ContactModel.colPhone} = ? AND ${ContactModel.colCurrentUserId} = ?';
      await localService.rawDelete(sql, [contact.phoneNumber!, userId ?? '']);
      return await addContactToLocalStorage(contact: contact);
    } catch (e) {
      log('removeExistingContactAndAddAsNew =====> ${e.toString()}');
      return Left(Failure());
    }
  }
}
