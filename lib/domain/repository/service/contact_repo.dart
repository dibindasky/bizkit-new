import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/contact/get_contact_model/get_contact_model.dart';
import 'package:bizkit/domain/model/contact/get_contacts_response_model/get_contacts_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class ContactsRepo {
  Future<Either<Failure, GetContactsResponseModel>> getBizkitUserByContact(
      {required GetContactModel getContactModel});
}
