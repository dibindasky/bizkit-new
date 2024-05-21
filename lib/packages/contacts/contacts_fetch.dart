import 'dart:developer';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/features/biz_card/domain/model/contact/add_new_contact/add_new_contact.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@LazySingleton()
@injectable
class ContactFetchService{
  Future<Either<Failure, List<Contact>>> getContactsList() async {
    List<Contact> contactsList = [];
    try {
      // check permission
      PermissionStatus permissionStatus = await Permission.contacts.status;
      log('permission ===> (  ${permissionStatus.name}  )');
      // if permission is not granted ask for permission
      if (permissionStatus != PermissionStatus.granted) {
        permissionStatus = await getContactPermission();
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

  static Future<PermissionStatus> getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  Future<void> saveContact(
      String name, String? phoneNumber, String? email) async {
    // Check for permissions (Android only)
    // check permission
    PermissionStatus permissionStatus = await Permission.contacts.status;
    log('permission ===> (  ${permissionStatus.name} )');
    // if permission is not granted ask for permission
    if (permissionStatus != PermissionStatus.granted) {
      permissionStatus = await getContactPermission();
    }
    if (permissionStatus == PermissionStatus.granted) {
      Contact newContact = Contact(
        givenName: name,
        phones: phoneNumber != null
            ? [Item(label: "mobile", value: phoneNumber)]
            : null,
        emails: email != null ? [Item(label: "work", value: email)] : null,
      );
      await ContactsService.addContact(newContact);
    } else {
      // Handle permission denial (optional)
      print("Permission to access contacts denied.");
    }
  }

  Future<Either<Failure, SuccessResponseModel>> addNewContact({
    required AddNewContact addNewContact,
  }) async {
    try {
      PermissionStatus permissionStatus = await Permission.contacts.status;
      log('permission ===> (  ${permissionStatus.name} )');
      // if permission is not granted ask for permission
      if (permissionStatus != PermissionStatus.granted) {
        permissionStatus = await getContactPermission();
      }
      if (permissionStatus == PermissionStatus.granted) {
        Contact newContact = Contact(
          givenName: addNewContact.name,
          company: addNewContact.companyName,
          phones: addNewContact.phoneNumber != null
              ? [Item(label: "mobile", value: addNewContact.phoneNumber)]
              : null,
          emails: addNewContact.email != null
              ? [Item(label: "email", value: addNewContact.email)]
              : null,
        );
        await ContactsService.addContact(newContact);
        log("Contact added");
        return Right(
            SuccessResponseModel(message: 'Contact added in your phone'));
      } else {
        log("Permission to access contacts denied.");
        return Left(Failure(message: 'No permission to save contact'));
      }
    } catch (e) {
      log("addNewContact catch error.");
      return Left(Failure(message: 'something went wrong'));
    }
  }
}
