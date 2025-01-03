import 'dart:developer';
import 'package:bizkit/service/secure_storage/local_storage.dart';

class LocalStoragePreferenceCard {
  static String contactsFetch = 'contacts_fetched_and_saved';
  static String contactsFirstFetch = 'contacts_first_time_fetching';
  static String storeCardLocaly = 'store_card_data_localy';

  static Future<void> setContactsFetchedOrNot(bool fetched) async {
    await LocalStorageService.setBool(contactsFetch, fetched);
    log('setContactsFetchedOrNot ====> $fetched');
  }

  static Future<bool> getContactsFetchedOrNot() async {
    final data = await LocalStorageService.getBool(contactsFetch);
    return data ?? false;
  }

  static Future<void> setContactsFirstFetchedOrNot(bool fetched) async {
    await LocalStorageService.setBool(contactsFirstFetch, fetched);
    log('setContactsFirstFetchedOrNot ========> $fetched');
  }

  static Future<bool> getContactsFirstFetchedOrNot() async {
    final data = await LocalStorageService.getBool(contactsFirstFetch);
    return data ?? true;
  }

  static Future<void> setStoreCardLocalyOrNot(bool fetched) async {
    await LocalStorageService.setBool(storeCardLocaly, fetched);
    log('setstoreCardLocalyOrNot ====> $fetched');
  }

  static Future<bool> getStoreCardLocalyOrNot() async {
    final data = await LocalStorageService.getBool(storeCardLocaly);
    return data ?? false;
  }
}
