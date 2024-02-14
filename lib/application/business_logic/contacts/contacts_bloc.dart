import 'dart:async';

import 'package:bizkit/domain/model/contact/get_contacts_response_model/contact.dart';
import 'package:bizkit/domain/repository/feature/contact_feature_repo.dart';
import 'package:bizkit/domain/repository/service/contact_repo.dart';
import 'package:bizkit/domain/repository/sqflite/contact_local_repo.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';
part 'contacts_bloc.freezed.dart';

@injectable
class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactFetchServiceRepo contactFetchFeature;
  final ContactsRepo contactService;
  final ContactLocalRepo contactLocalService;

  ContactsBloc(
      this.contactFetchFeature, this.contactService, this.contactLocalService)
      : super(ContactsState.initial()) {
    on<GetContactsList>(getContactsList);
    on<CheckContactsInBizkit>(checkContactsInBizkit);
  }

  FutureOr<void> getContactsList(GetContactsList event, emit) async {
    if (state.contactList != null && state.contactList!.isNotEmpty) return;
    emit(state.copyWith(loading: true, hasError: false));
    print('fetch start');
    final reult = await contactFetchFeature.getContactsList();
    reult.fold(
        (failure) => emit(state.copyWith(
            loading: false, message: failure.message, hasError: true)),
        (contactList) =>
            add(ContactsEvent.checkContactsInBizkit(contactList: contactList)));
  }

  FutureOr<void> checkContactsInBizkit(
      CheckContactsInBizkit event, emit) async {
    try {
      print('fetch');
      List<String> data = [];
      print(data);
      for (var x in event.contactList) {
        if (x.phones != null ||
            x.phones!.isNotEmpty ||
            x.phones!.first.value != null ||
            x.phones!.first.value!.isNotEmpty) {
          data.add(x.phones!.first.value!);
        }
      }
      print(data);
      print('fetch complete');

      // final result = await contactService.getBizkitUserByContact(
      //     getContactModel: GetContactModel(
      //         phoneNumbers: event.contactList
      //             .map((e) => e.phones?.first.value ?? '')
      //             .toList()));
    } catch (e) {
      print('fetch error =$e');
    }
  }
}
