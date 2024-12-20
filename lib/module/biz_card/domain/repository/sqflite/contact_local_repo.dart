import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/contact.dart';
import 'package:dartz/dartz.dart';

abstract class ContactLocalRepo {
  Future<Either<Failure, SuccessResponseModel>> addContactToLocalStorage(
      {required ContactModel contact});
  Future<Either<Failure, SuccessResponseModel>> updateContactInLocalStorage(
      {required ContactModel contact});
  Future<Either<Failure, List<ContactModel>>> getContactFromLocalStorage();
  Future<Either<Failure, SuccessResponseModel>>
      addContactToLocalStorageIfNotPresentInStorage(
          {required ContactModel contact});
  Future<Either<Failure, SuccessResponseModel>>
      removeExistingContactAndAddAsNew({required ContactModel contact});
}
