import 'dart:developer';

import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/repository/feature/contact_repo.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@LazySingleton(as: ContactFetchServiceRepo)
@injectable
class ContactFetchService implements ContactFetchServiceRepo {
  @override
  Future<Either<Failure, List<Contact>>> getContactsList() async {
    List<Contact> contactsList = [];
    try {
      // check permission
      PermissionStatus permissionStatus = await Permission.contacts.status;
      log('permission ===> (  ${permissionStatus.name}  )');
      // if permission is not granted ask for permission
      if (permissionStatus != PermissionStatus.granted) {
        permissionStatus = await _getContactPermission();
      }
      if (permissionStatus == PermissionStatus.granted) {
        // fetch contacts if granted
        contactsList = await ContactsService.getContacts();
        return Right(contactsList);
      } else {
        if (permissionStatus == PermissionStatus.denied) {
          log('permission denied');
          return Left(Failure(message: 'permission denied'));
        } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
          log('permission denied permentanly');
          return Left(Failure(message: 'permission denied permentanly'));
        } else {
          return Left(Failure(message: 'something went wrong'));
        }
      }
    } catch (e) {
      log('exception => ( $e )');
      return Left(Failure(message: e.toString()));
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }
}
