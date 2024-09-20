import 'dart:convert';
import 'package:bizkit/module/biz_card/data/service/contact/contact_service.dart';
import 'package:bizkit/module/biz_card/data/sqflite/contacts/contact_local_service.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/contact.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:bizkit/module/biz_card/domain/repository/service/contact/contact_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/contact_local_repo.dart';
import 'package:bizkit/packages/contacts/contacts_fetch.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_model/get_contact_model.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactsController extends GetxController {
  // Observables
  var contactList = <ContactModel>[].obs;
  var contactFilteredList = <ContactModel>[].obs;
  var isLoading = false.obs;
  var searchLoading = false.obs;
  var fetchingLoading = false.obs;
  var firstLoading = false.obs;
  var hasError = false.obs;
  var message = ''.obs;

  /// for actions from device
  ContactFetchService contactFetchFeature = ContactFetchService();

  /// for api services
  ContactsRepo contactService = ContactService();

  /// for local db sqflite
  ContactLocalRepo contactLocalService = ContactLocalService();

  Timer? periodicTimer;

  @override
  void onInit() {
    super.onInit();
    getConnections();
    periodicTimer = Timer.periodic(const Duration(days: 1), (timer) {
      getContactsList();
    });
  }

  @override
  void onClose() {
    periodicTimer?.cancel();
    super.onClose();
  }

  // Search contacts
  void searchContact(String query) {
    if (contactFilteredList.isEmpty) {
      return;
    }
    searchLoading.value = true;
    if (query.isEmpty) {
      contactList.value = contactFilteredList;
      searchLoading.value = false;
      return;
    }
    final filtered = contactFilteredList.where((element) {
      if (element.name != null &&
          element.name!.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
      if (element.email != null &&
          element.email!.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
      if (element.phoneNumber != null && element.phoneNumber!.contains(query)) {
        return true;
      }
      return false;
    }).toList();
    contactList.value = filtered;
    searchLoading.value = false;
  }

  /// Get connections from local storage
  Future<void> getConnections() async {
    if (contactList.isNotEmpty) return;
    isLoading.value = true;
    hasError.value = false;
    final result = await contactLocalService.getContactFromLocalStorage();
    result.fold((failure) {
      isLoading.value = false;
      hasError.value = true;
    }, (contactsList) {
      contactList.value = contactsList;
      contactFilteredList.value = contactsList;
      firstLoading.value = contactsList.isEmpty ? false : true;
      getContactsList();
    });
  }

  // Fetch contacts from phone
  Future<void> getContactsList() async {
    fetchingLoading.value = true;
    hasError.value = false;

    final result = await contactFetchFeature.getContactsList();
    result.fold(
      (failure) {
        firstLoading.value = false;
        hasError.value = true;
        isLoading.value = false;
        fetchingLoading.value = false;
      },
      (contactList) {
        fetchingLoading.value = false;
        checkContactsInBizkit(contactList);
      },
    );
  }

  // Check if phone numbers belong to bizkit users and store them
  Future<void> checkContactsInBizkit(List<Contact> contactList) async {
    try {
      List<String> phoneNumbers = [];
      for (var contact in contactList) {
        phoneNumbers
            .addAll(contact.phones?.map((e) => e.value ?? '').toList() ?? []);
      }

      final result = await contactService.getBizkitUserByContact(
          getContactModel: GetContactModel(phoneNumbers: phoneNumbers));

      result.fold(
        (failure) {
          isLoading.value = false;
          hasError.value = true;
          fetchingLoading.value = false;
        },
        (contactResponseModel) async {
          if (contactResponseModel.results != null) {
            for (var x in contactResponseModel.results!) {
              await contactLocalService.removeExistingContactAndAddAsNew(
                  contact: x);
            }
            for (var contact in contactList) {
              if (contact.phones?.isNotEmpty ?? false) {
                for (var phone in contact.phones!) {
                  if (!contactResponseModel.results!
                      .any((z) => z.phoneNumber == phone.value)) {
                    await contactLocalService
                        .addContactToLocalStorageIfNotPresentInStorage(
                      contact: ContactModel(
                        //id: 0,
                        phoneNumber: phone.value
                            ?.replaceAll('+91 ', '')
                            .replaceAll('+91', '')
                            .replaceAll(' ', ''),
                        name: contact.displayName ?? '',
                        profilePicture: base64Encode(contact.avatar!),
                      ),
                    );
                  } else {
                    await contactLocalService
                        .addContactToLocalStorageIfNotPresentInStorage(
                      contact: ContactModel(
                        // id: 0,
                        phoneNumber: phone.value
                                ?.replaceAll('+91 ', '')
                                .replaceAll('+91', '')
                                .replaceAll(' ', '') ??
                            '',
                        name: contact.displayName ?? '',
                        profilePicture: base64Encode(contact.avatar!),
                      ),
                    );
                  }
                }
              }
            }
          }
        },
      );
      getConnectionsFromLocalStorage();
    } catch (e) {
      print('Error: $e');
      getConnectionsFromLocalStorage();
    }
  }

  // Fetch connections from local storage
  Future<void> getConnectionsFromLocalStorage() async {
    final result = await contactLocalService.getContactFromLocalStorage();
    result.fold(
      (failure) {
        isLoading.value = false;
        hasError.value = true;
        fetchingLoading.value = false;
      },
      (connections) {
        contactList.value = connections;
        contactFilteredList.value = connections;
        fetchingLoading.value = false;
        firstLoading.value = false;
      },
    );
  }
}
