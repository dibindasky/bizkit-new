import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/contact/add_new_contact/add_new_contact.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dartz/dartz.dart';

abstract class ContactFetchServiceRepo {
  Future<Either<Failure, List<Contact>>> getContactsList();
  Future<Either<Failure, SuccessResponseModel>> addNewContact(
      {required AddNewContact addNewContact});
}
