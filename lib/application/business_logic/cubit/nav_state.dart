part of 'nav_cubit.dart';

@freezed
class NavState with _$NavState {
  const factory NavState({
    required int slectedtabIndex,
    required int selectedOnBoardingScreen,
  }) = _Initial;
  factory NavState.initial() =>
      const NavState(slectedtabIndex: 0, selectedOnBoardingScreen: 0);
}
