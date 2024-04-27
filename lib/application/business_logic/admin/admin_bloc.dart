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
    on<RemoveIndiVidualusersPartOfBusiness>(
        removeIndiVidualusersPartOfBusiness);
  }

  FutureOr<void> removeIndiVidualusersPartOfBusiness(
      RemoveIndiVidualusersPartOfBusiness event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, userBlocked: false));
    final data =
        await adminRepo.removeIndiVidualusersPartOfBusiness(id: event.id);
    data.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, userBlocked: false)), (r) {
      emit(
          state.copyWith(isLoading: false, hasError: false, userBlocked: true));
      add(const AdminEvent.getCompanyUsers(isLoad: true));
    });
  }

  FutureOr<void> getCompanyUsers(GetCompanyUsers event, emit) async {
    if (state.companySelectedUsersListModel != null && !event.isLoad) return;
    emit(state.copyWith(isLoading: true, hasError: false, userBlocked: false));
    final data = await adminRepo.getCompanySelectedUsersList();
    data.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, userBlocked: false)), (r) {
      emit(state.copyWith(
          isLoading: false,
          hasError: false,
          companySelectedUsersListModel: r,
          userBlocked: false));
    });
  }
}
