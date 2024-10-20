import 'package:bizkit/service/secure_storage/local_storage.dart';

class LocalStoragePreferenceCard {
  static String contactsFetch = 'contacts_fetched_and_saved';
  static String contactsFirstFetch = 'contacts_first_time_fetching';

  static void setContactsFetchedOrNot(bool fetched) async {
    await LocalStorageService.setBool(contactsFetch, fetched);
    print('setContactsFetchedOrNot ====> $fetched');
  }

  static Future<bool> getContactsFetchedOrNot() async {
    final data = await LocalStorageService.getBool(contactsFetch);
    return data ?? false;
  }
  static void setContactsFirstFetchedOrNot(bool fetched) async {
    await LocalStorageService.setBool(contactsFirstFetch, fetched);
    print('setContactsFirstFetchedOrNot ========> $fetched');
  }

  static Future<bool> getContactsFirstFetchedOrNot() async {
    final data = await LocalStorageService.getBool(contactsFirstFetch);
    return data ?? true;
  }
}
