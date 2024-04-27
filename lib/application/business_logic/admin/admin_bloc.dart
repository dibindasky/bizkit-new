import 'dart:async';
import 'package:bizkit/domain/model/admin/company_selected_users_list_model/company_selected_users_list_model.dart';
import 'package:bizkit/domain/repository/service/admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'admin_event.dart';
part 'admin_state.dart';
part 'admin_bloc.freezed.dart';

@injectable
class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepo adminRepo;
  AdminBloc(this.adminRepo) : super(AdminState.initial()) {
    on<GetCompanyUsers>(getCompanyUsers);
  }

  FutureOr<void> getCompanyUsers(GetCompanyUsers event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final data = await adminRepo.getCompanySelectedUsersList();
    data.fold((l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) {
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        companySelectedUsersListModel: [
          ...state.companySelectedUsersListModel ?? [],
          r
        ],
      ));
    });
  }
}
