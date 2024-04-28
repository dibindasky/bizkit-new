import 'package:bizkit/data/features/contacts/contacts_fetch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'nav_state.dart';
part 'nav_cubit.freezed.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavState.initial());
  void navbarChange({required int index}) async {
    emit(state.copyWith(slectedtabIndex: index));
    if (state.slectedtabIndex == 2) {
      await ContactFetchService.getContactPermission();
    }
  }

  void onBoardChange({required int index}) {
    emit(state.copyWith(selectedOnBoardingScreen: index));
  }
}
