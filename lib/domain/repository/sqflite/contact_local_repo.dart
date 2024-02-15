import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/contact/get_contacts_response_model/contact.dart';
import 'package:dartz/dartz.dart';

abstract class ContactLocalRepo {
  Future<Either<Failure, SuccessResponseModel>> addContactToLocalStorage(
      {required ContactModel contact});
  Future<Either<Failure, List<ContactModel>>> getContactFromLocalStorage();
  Future<Either<Failure, SuccessResponseModel>>
      addContactToLocalStorageIfNotPresentInStorage(
          {required ContactModel contact});
  Future<Either<Failure, SuccessResponseModel>>
      removeExistingContactAndAddAsNew({required ContactModel contact});
}
