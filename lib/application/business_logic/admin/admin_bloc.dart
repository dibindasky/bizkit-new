import 'dart:async';
import 'dart:developer';
import 'package:bizkit/domain/model/admin/get_all_business_card_requests/business_card_request.dart';
import 'package:bizkit/domain/model/admin/get_blocked_users/blocked_user.dart';
import 'package:bizkit/domain/model/admin/get_company_users_model/company_users.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
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
  int getBusinessRequest = 1;
  int getComapnyusersNext = 1;
  AdminBloc(this.adminRepo) : super(AdminState.initial()) {
    on<GetCompanyUsers>(getCompanyUsers);
    on<GetCompanyUsersNext>(getCompanyUsersNext);
    on<RemoveIndiVidualusersPartOfBusiness>(
        removeIndiVidualusersPartOfBusiness);
    on<GetAllBusinessCardRequests>(getAllBusinessCardRequests);
    on<GetAllBusinessCardRequestsNExt>(getAllBusinessCardRequestsNExt);
    on<BusinessCardRequestAccept>(businessCardRequestAccept);
    on<BusinessCardRequestAReject>(businessCardRequestAReject);
    on<GetBusinessBlockeUsers>(getBusinessBlockeUsers);
    on<BusinessUnBlockeUser>(businessUnBlockeUser);
  }

  FutureOr<void> getCompanyUsersNext(GetCompanyUsersNext event, emit) async {}

  FutureOr<void> businessUnBlockeUser(BusinessUnBlockeUser event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final data = await adminRepo.businessUnBlockeUser(id: event.id);
    data.fold(
      (l) => emit(state.copyWith(isLoading: true, hasError: true)),
      (r) {
        emit(state.copyWith(
          isLoading: false,
          hasError: false,
          unblockedUserSuccess: true,
        ));
        add(const AdminEvent.getBusinessBlockeUsers(isLoad: true));
      },
    );
  }

  FutureOr<void> getBusinessBlockeUsers(
      GetBusinessBlockeUsers event, emit) async {
    emit(state.copyWith(blockedUSerLoading: true, hasError: false));
    final data = await adminRepo.getBusinessBlockeUsers();
    data.fold(
      (l) => emit(state.copyWith(blockedUSerLoading: false, hasError: true)),
      (r) => emit(state.copyWith(
        blockedUSerLoading: false,
        hasError: false,
        blockedUsers: r.blockedUsers,
      )),
    );
  }

  FutureOr<void> businessCardRequestAReject(
      BusinessCardRequestAReject event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, requestDiclined: false));
    final data = await adminRepo.businessCardRequestReject(id: event.id);
    data.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          requestDiclined: false,
        ),
      ),
      (r) {
        emit(state.copyWith(
          isLoading: false,
          hasError: false,
          requestDiclined: true,
        ));
        add(const AdminEvent.getAllBusinessCardRequests(isLoad: true));
        add(const AdminEvent.getCompanyUsers(isLoad: true));
      },
    );
  }

  FutureOr<void> businessCardRequestAccept(
      BusinessCardRequestAccept event, emit) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      requestAccepteed: false,
    ));
    final data = await adminRepo.businessCardRequestAccept(id: event.id);
    data.fold(
      (l) => emit(state.copyWith(
        requestAccepteed: false,
        isLoading: false,
        hasError: true,
      )),
      (r) {
        emit(state.copyWith(
          requestAccepteed: true,
          isLoading: false,
          hasError: false,
        ));
        add(const AdminEvent.getAllBusinessCardRequests(isLoad: true));
      },
    );
  }

  FutureOr<void> getAllBusinessCardRequestsNExt(
      GetAllBusinessCardRequestsNExt event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    final data = await adminRepo.getAllBusinessCardRequests(
        pageQuery: PageQuery(page: ++getBusinessRequest));
    data.fold(
      (l) => emit(state.copyWith(isLoading: false, hasError: true)),
      (r) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        businesscardRequests: [
          ...state.businesscardRequests ?? [],
          ...r.businesscardRequests!
        ],
      )),
    );
  }

  FutureOr<void> getAllBusinessCardRequests(
      GetAllBusinessCardRequests event, emit) async {
    if (state.businesscardRequests != null && !event.isLoad) return;
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      requestDiclined: false,
      requestAccepteed: false,
    ));
    final data = await adminRepo.getAllBusinessCardRequests(
        pageQuery: PageQuery(page: 1));
    data.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        requestDiclined: false,
        requestAccepteed: false,
      )),
      (r) {
        emit(state.copyWith(
          isLoading: false,
          hasError: false,
          requestDiclined: false,
          requestAccepteed: false,
          businesscardRequests: r.businesscardRequests,
        ));
      },
    );
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
      add(const AdminEvent.getBusinessBlockeUsers(isLoad: true));
    });
  }

  FutureOr<void> getCompanyUsers(GetCompanyUsers event, emit) async {
    if (state.companyUsers != null && !event.isLoad) return;
    emit(state.copyWith(isLoading: true, hasError: false, userBlocked: false));
    final data = await adminRepo.getCompanySelectedUsersList();
    data.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, userBlocked: false)), (r) {
      log('${r.companyUsers?.length}', name: 'getCompanyUsers length');
      emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          companyUsers: r.companyUsers,
          userBlocked: false,
        ),
      );
    });
  }
}
