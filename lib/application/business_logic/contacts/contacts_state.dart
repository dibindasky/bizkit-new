part of 'contacts_bloc.dart';

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState(
      {required bool loading,
      required bool hasError,
      String? message,
      List<Contact>? contactList}) = _Initial;
  factory ContactsState.initial() =>
      const ContactsState(loading: false, hasError: false);
}
