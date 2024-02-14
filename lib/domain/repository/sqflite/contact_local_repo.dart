import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/contact/get_contacts_response_model/contact.dart';
import 'package:dartz/dartz.dart';

abstract class ContactLocalRepo {
  Future<Either<Failure, SuccessResponseModel>> addContactToLocalStorage(
      {required Contact contact});
  Future<Either<Failure, List<Contact>>> getContactFromLocalStorage();
}
