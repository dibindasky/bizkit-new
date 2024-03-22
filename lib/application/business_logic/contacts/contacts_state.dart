part of 'contacts_bloc.dart';

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState(
      {required bool isLoading,
      required bool hasError,
      required bool fetchingLoading,
      required bool searchLoading,
      required bool firstLoading,
      String? message,
      List<ContactModel>? contactList,
      List<ContactModel>? contactFilterdList}) = _Initial;
  factory ContactsState.initial() => const ContactsState(
      isLoading: false,
      hasError: false,
      fetchingLoading: false,
      searchLoading: false,
      firstLoading: false);
}
