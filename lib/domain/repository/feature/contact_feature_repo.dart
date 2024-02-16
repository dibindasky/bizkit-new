import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dartz/dartz.dart';

abstract class ContactFetchServiceRepo {
  Future<Either<Failure, List<Contact>>> getContactsList();
}
