import 'package:bizkit/domain/repository/feature/contact_repo.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';
part 'contacts_bloc.freezed.dart';

@injectable
class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactFetchServiceRepo contactsService;

  ContactsBloc({required this.contactsService})
      : super(ContactsState.initial()) {
    on<_GetContactsList>((event, emit) async {
      if (state.contactList != null && state.contactList!.isNotEmpty) return;
      emit(state.copyWith(loading: true, hasError: false));
      final reult = await contactsService.getContactsList();
      reult.fold(
        (failure) => emit(
          state.copyWith(
              loading: false, message: failure.message, hasError: true),
        ),
        (contactList) => emit(
          state.copyWith(
            loading: false,
            message: null,
            contactList: contactList,
          ),
        ),
      );
    });
  }
}
