import 'dart:async';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/domain/model/contact/get_contact_model/get_contact_model.dart';
import 'package:bizkit/domain/model/contact/get_contacts_response_model/contact.dart';
import 'package:bizkit/domain/model/contact/get_contacts_response_model/get_contacts_response_model.dart';
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
    on<GetConnectionsFromLocalStorage>(getConnectionsFromLocalStorage);
    on<GetConnections>(getConnections);
  }

  // get connections from and check for new connections
  FutureOr<void> getConnections(GetConnections event, emit) async {
    if (state.contactList != null && state.contactList!.isNotEmpty) return;
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await contactLocalService.getContactFromLocalStorage();
    result.fold(
        (failure) => null,
        (connections) => emit(state.copyWith(
            isLoading: false, contactList: connections, message: null)));
    add(const ContactsEvent.getContactsList());
  }

  // fetch the contact list form phone
  FutureOr<void> getContactsList(GetContactsList event, emit) async {
    emit(state.copyWith(hasError: false, message: null));
    print('fetch start');
    final reult = await contactFetchFeature.getContactsList();
    print('fetch end');
    reult.fold(
        (failure) => emit(state.copyWith(isLoading: false, hasError: true)),
        (contactList) =>
            add(ContactsEvent.checkContactsInBizkit(contactList: contactList)));
  }

  // check wether the phone number user is a bizkit user or not then add to local storage
  FutureOr<void> checkContactsInBizkit(
      CheckContactsInBizkit event, emit) async {
    try {
      print('check with server');
      List<String> data = [];
      for (var contact in event.contactList) {
        data.addAll(contact.phones?.map((e) => e.value ?? '').toList() ?? []);
      }
      data.add('1234567830');
      print('fetch from server starts');
      final result = await contactService.getBizkitUserByContact(
          getContactModel: GetContactModel(phoneNumbers: data));
      GetContactsResponseModel? contactResponseModel;
      result.fold(
          (failure) => emit(
              state.copyWith(isLoading: false, hasError: true, message: null)),
          (contactResponse) => contactResponseModel = contactResponse);
      // add every contact to the local storage if the user is present in bizkit store the id and photo also other wise add left over details
      if (contactResponseModel != null &&
          contactResponseModel!.results != null) {
        for (var x in contactResponseModel!.results!) {
          await contactLocalService.removeExistingContactAndAddAsNew(
              contact: x);
        }

        for (var contact in event.contactList) {
          if (contact.phones?.isNotEmpty ?? false) {
            for (var phone in contact.phones!) {
              if (!contactResponseModel!.results!.any((z) =>
                  z.phoneNumber == phone.value ||
                  z.phoneNumber ==
                      phone.value
                          ?.replaceAll('+91 ', '')
                          .replaceAll('+91', ''))) {
                await contactLocalService
                    .addContactToLocalStorageIfNotPresentInStorage(
                  contact: ContactModel(
                    id: 0,
                    phoneNumber: phone.value
                        ?.replaceAll('+91 ', '')
                        .replaceAll('+91', ''),
                    name: contact.displayName ?? '',
                    photo: '',
                  ),
                );
              }
            }
          }
        }
      } else {
        for (var contact in event.contactList) {
          if (contact.phones?.isNotEmpty ?? false) {
            for (var phone in contact.phones!) {
              print(
                  'addContactToLocalStorageIfNotPresentInStorage => ${phone.value} ${contact.displayName}');
              await contactLocalService
                  .addContactToLocalStorageIfNotPresentInStorage(
                contact: ContactModel(
                  id: 0,
                  phoneNumber: phone.value,
                  name: contact.displayName ?? '',
                  photo: '',
                ),
              );
            }
          }
        }
      }
      add(const ContactsEvent.getConnectionsFromLocalStorage());
    } catch (e) {
      print('fetch error =$e');
      add(const ContactsEvent.getConnectionsFromLocalStorage());
    }
  }

  // fetch connections form local storage
  FutureOr<void> getConnectionsFromLocalStorage(
      GetConnectionsFromLocalStorage event, emit) async {
    // emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await contactLocalService.getContactFromLocalStorage();
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            message: errorMessage,
            hasError: true)), (connections) {
      print('get contacts form local storage checking');
      for (var x in connections) {
        print(x.name);
      }
      return emit(state.copyWith(isLoading: false, contactList: connections));
    });
  }
}
