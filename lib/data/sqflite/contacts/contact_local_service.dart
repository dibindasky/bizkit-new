import 'dart:developer';

import 'package:bizkit/data/sqflite/sqflite_local_service.dart';
import 'package:bizkit/data/sqflite/sql/oncreate_db.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/contact/get_contacts_response_model/contact.dart';
import 'package:bizkit/domain/repository/sqflite/contact_local_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ContactLocalRepo)
@injectable
class ContactLocalService implements ContactLocalRepo {
  final LocalService localService;

  ContactLocalService(this.localService);

  @override
  Future<Either<Failure, SuccessResponseModel>> addContactToLocalStorage(
      {required ContactModel contact}) async {
    try {
      final map = {
        ContactModel.colName: contact.name ?? '',
        ContactModel.colPhone: contact.phoneNumber,
        ContactModel.colUserId: contact.id,
        ContactModel.colPhoto: contact.photo??''
      };
      await localService.insert(Sql.contactTable, map);
      return Right(SuccessResponseModel());
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<ContactModel>>>
      getContactFromLocalStorage() async {
    try {
      const String query = 'SELECT * FROM ${Sql.contactTable}';
      final data = await localService.rawQuery(query);
      List<ContactModel> contacts = [];
      for (var x in data) {
        contacts.add(ContactModel.fromJson(x));
      }
      return Right(contacts);
    } catch (e) {
      log('get contacts => ${e.toString()}');
      return Left(Failure());
    }
  }

  Future<Either<Failure, SuccessResponseModel>>
      addContactToLocalStorageIfNotPresentInStorage(
          {required ContactModel contact}) async {
    try {
      final String query =
          '''SELECT COUNT(*) FROM ${Sql.contactTable} WHERE ${ContactModel.colPhone} = ${contact.phoneNumber!}''';
      final bool present = await localService.presetOrNot(query);
      if (!present) return Left(Failure());
      return await addContactToLocalStorage(contact: contact);
    } catch (e) {
      return Left(Failure());
    }
  }
}
