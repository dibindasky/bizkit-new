import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_model/get_contact_model.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/get_contact_responce_model.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/share_card_contact/share_card_contact_model.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class ContactsRepo {
  Future<Either<Failure, GetContactResponceModel>> getBizkitUserByContact(
      {required GetContactModel getContactModel});
  Future<Either<Failure, SuccessResponce>> shareBizcardToContacts(
      {required ShareCardContactModel shareCardContactModel});
}
