part of 'contacts_bloc.dart';

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState(
      {required bool isLoading,
      required bool hasError,
      String? message,
      List<ContactModel>? contactList}) = _Initial;
  factory ContactsState.initial() =>
      const ContactsState(isLoading: false, hasError: false);
}
