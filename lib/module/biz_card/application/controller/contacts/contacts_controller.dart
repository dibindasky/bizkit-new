import 'dart:convert';
import 'package:bizkit/module/biz_card/data/local_storage/local_storage_preference.dart';
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


  @override
  void onInit() {
    super.onInit();
    getConnections();
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

  /// check contacts fetching happend before or not and fetch if not else get data form local db
  Future<void> getConnections() async {
    try {
      final fetched =
          await LocalStoragePreferenceCard.getContactsFetchedOrNot();
      print(
          '---------------------------------fetched ------------------------$fetched');
      if (fetched) {
        await getConnectionsFromSqlTable();
      } else {
        print(
            '---------------------------------first fetched ------------------------${await LocalStoragePreferenceCard.getContactsFirstFetchedOrNot()}');
        if (await LocalStoragePreferenceCard.getContactsFirstFetchedOrNot()) {
          firstLoading.value = true;
        }
        fetchCheckAndSave();
      }
    } catch (e) {
      return;
    }
  }

  /// fetch contacts and check for connection save it
  Future<void> fetchCheckAndSave() async {
    List<String> phoneNumbers = [];

    /// contact list form device
    final contactList = await fetchContactsFromDevice();
    for (var contact in contactList) {
      phoneNumbers
          .addAll(contact.phones?.map((e) => e.value ?? '').toList() ?? []);
    }

    /// bizkit users list after search with server
    List<ContactModel> bizkitUsers =
        await checkContactsWithMainServer(phoneNumbers: phoneNumbers);

    /// add the bizkit users find from server using contact
    if (bizkitUsers.isNotEmpty) {
      for (var x in bizkitUsers) {
        await contactLocalService.removeExistingContactAndAddAsNew(contact: x);
      }
    }
    for (var contact in contactList) {
      if (contact.phones?.isNotEmpty ?? false) {
        for (var phone in contact.phones!) {
          if (!bizkitUsers.any((z) => z.phoneNumber == phone.value)) {
            await contactLocalService
                .addContactToLocalStorageIfNotPresentInStorage(
              contact: ContactModel(
                  phoneNumber: phone.value
                      ?.replaceAll('+91 ', '')
                      .replaceAll('+91', '')
                      .replaceAll(' ', ''),
                  name: contact.displayName ?? '',
                  profilePicture: contact.avatar != null
                      ? base64Encode(contact.avatar!)
                      : null,
                  email: contact.emails != null && contact.emails!.isNotEmpty
                      ? (contact.emails?.first.value)
                      : ''),
            );
          }
        }
      }
    }
    LocalStoragePreferenceCard.setContactsFetchedOrNot(true);
    LocalStoragePreferenceCard.setContactsFirstFetchedOrNot(false);
    getConnectionsFromSqlTable();
  }

  /// get connections from local db
  Future<void> getConnectionsFromSqlTable() async {
    try {
      fetchingLoading.value = true;
      final result = await contactLocalService.getContactFromLocalStorage();
      result.fold((l) => null, (r) {
        contactFilteredList.value = r;
        contactList.value = r;
      });
      fetchingLoading.value = false;
      firstLoading.value = false;
    } catch (e) {
      fetchingLoading.value = false;
      firstLoading.value = false;
      return;
    }
  }

  /// get contacts form device
  Future<List<Contact>> fetchContactsFromDevice() async {
    try {
      List<Contact> contacts = [];
      final result = await contactFetchFeature.getContactsList();
      result.fold((l) => null, (r) => contacts = r);
      return contacts;
    } catch (e) {
      firstLoading.value = false;
      return [];
    }
  }

  /// check contacts with server
  Future<List<ContactModel>> checkContactsWithMainServer(
      {required List<String> phoneNumbers}) async {
    try {
      List<ContactModel> contacts = <ContactModel>[];
      final result = await contactService.getBizkitUserByContact(
          getContactModel: GetContactModel(phoneNumbers: phoneNumbers));
      result.fold((l) => null, (r) {
        contacts = r.results ?? <ContactModel>[];
      });
      return contacts;
    } catch (e) {
      firstLoading.value = false;
      return [];
    }
  }
}
