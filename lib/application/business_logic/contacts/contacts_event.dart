part of 'contacts_bloc.dart';

@freezed
class ContactsEvent with _$ContactsEvent {
  const factory ContactsEvent.getContactsList() = GetContactsList;
  const factory ContactsEvent.checkContactsInBizkit(
      {required List<Contact> contactList}) = CheckContactsInBizkit;
}
