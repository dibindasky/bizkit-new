// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart'
    as _i17;
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i13;
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart'
    as _i38;
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart'
    as _i37;
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart'
    as _i36;
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart'
    as _i39;
import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart'
    as _i40;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i41;
import 'package:bizkit/application/business_logic/notification/notification_bloc.dart'
    as _i42;
import 'package:bizkit/application/business_logic/profile/profile_bloc.dart'
    as _i43;
import 'package:bizkit/application/business_logic/promt/promt_bloc.dart'
    as _i12;
import 'package:bizkit/application/business_logic/qr/qr_bloc.dart' as _i44;
import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart'
    as _i45;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i6;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i8;
import 'package:bizkit/data/features/pdf/pdf_picker.dart' as _i11;
import 'package:bizkit/data/service/api_service.dart' as _i16;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i4;
import 'package:bizkit/data/service/card/card_service.dart' as _i19;
import 'package:bizkit/data/service/card_second/card_second_service.dart'
    as _i21;
import 'package:bizkit/data/service/connections/connections_service.dart'
    as _i23;
import 'package:bizkit/data/service/contact/contact_service.dart' as _i27;
import 'package:bizkit/data/service/notification/notification_service.dart'
    as _i29;
import 'package:bizkit/data/service/profile/profile_services.dart' as _i31;
import 'package:bizkit/data/service/qr/qr_service.dart' as _i33;
import 'package:bizkit/data/service/reminder/reminder_service.dart' as _i35;
import 'package:bizkit/data/sqflite/contacts/contact_local_service.dart'
    as _i25;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i10;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i15;
import 'package:bizkit/domain/core/dio_module/dio_module.dart' as _i46;
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart'
    as _i5;
import 'package:bizkit/domain/repository/feature/contact_feature_repo.dart'
    as _i7;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i3;
import 'package:bizkit/domain/repository/service/card_repo.dart' as _i18;
import 'package:bizkit/domain/repository/service/card_second.dart' as _i20;
import 'package:bizkit/domain/repository/service/connection_request_repo.dart'
    as _i22;
import 'package:bizkit/domain/repository/service/contact_repo.dart' as _i26;
import 'package:bizkit/domain/repository/service/notification.dart' as _i28;
import 'package:bizkit/domain/repository/service/profile_repo.dart' as _i30;
import 'package:bizkit/domain/repository/service/qr_repo.dart' as _i32;
import 'package:bizkit/domain/repository/service/reminder_repo.dart' as _i34;
import 'package:bizkit/domain/repository/sqflite/contact_local_repo.dart'
    as _i24;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i14;
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i3.AuthRepo>(() => _i4.AuthService());
    gh.lazySingleton<_i5.CardScanningRepo>(() => _i6.CardScanningImpl());
    gh.lazySingleton<_i7.ContactFetchServiceRepo>(
        () => _i8.ContactFetchService());
    gh.lazySingleton<_i9.Dio>(() => dioModule.dioInstance);
    gh.lazySingleton<_i10.LocalService>(() => _i10.LocalService());
    gh.lazySingleton<_i11.PdfPickerImpl>(() => _i11.PdfPickerImpl());
    gh.factory<_i12.PromtBloc>(() => _i12.PromtBloc());
    gh.factory<_i13.SignUpBloc>(() => _i13.SignUpBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i14.UserLocalRepo>(
        () => _i15.UserLocalService(gh<_i10.LocalService>()));
    gh.factory<_i16.ApiService>(() => _i16.ApiService(gh<_i9.Dio>()));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i14.UserLocalRepo>(),
        ));
    gh.lazySingleton<_i18.CardRepo>(
        () => _i19.CardService(gh<_i16.ApiService>()));
    gh.lazySingleton<_i20.CardSecondRepo>(
        () => _i21.CardSecondService(gh<_i16.ApiService>()));
    gh.lazySingleton<_i22.ConnectionRequestRepo>(
        () => _i23.ConnectionService(gh<_i16.ApiService>()));
    gh.lazySingleton<_i24.ContactLocalRepo>(
        () => _i25.ContactLocalService(gh<_i10.LocalService>()));
    gh.lazySingleton<_i26.ContactsRepo>(
        () => _i27.ContactServiceImpl(gh<_i16.ApiService>()));
    gh.lazySingleton<_i28.NotificationRepo>(
        () => _i29.NotificationService(gh<_i16.ApiService>()));
    gh.lazySingleton<_i30.ProfileRepo>(
        () => _i31.ProfileService(gh<_i16.ApiService>()));
    gh.lazySingleton<_i32.QrServiceRepo>(
        () => _i33.QRServiceImpl(gh<_i16.ApiService>()));
    gh.lazySingleton<_i34.ReminderRepo>(
        () => _i35.ReminderService(gh<_i16.ApiService>()));
    gh.factory<_i36.UserDataBloc>(() => _i36.UserDataBloc(
          gh<_i5.CardScanningRepo>(),
          gh<_i14.UserLocalRepo>(),
          gh<_i18.CardRepo>(),
        ));
    gh.factory<_i37.BusinessDataBloc>(() => _i37.BusinessDataBloc(
          gh<_i11.PdfPickerImpl>(),
          gh<_i18.CardRepo>(),
          gh<_i14.UserLocalRepo>(),
        ));
    gh.factory<_i38.CardBloc>(() => _i38.CardBloc(
          gh<_i18.CardRepo>(),
          gh<_i11.PdfPickerImpl>(),
        ));
    gh.factory<_i39.CardSecondBloc>(() => _i39.CardSecondBloc(
          gh<_i20.CardSecondRepo>(),
          gh<_i5.CardScanningRepo>(),
        ));
    gh.factory<_i40.ConnectionRequestBloc>(
        () => _i40.ConnectionRequestBloc(gh<_i22.ConnectionRequestRepo>()));
    gh.factory<_i41.ContactsBloc>(() => _i41.ContactsBloc(
          gh<_i7.ContactFetchServiceRepo>(),
          gh<_i26.ContactsRepo>(),
          gh<_i24.ContactLocalRepo>(),
        ));
    gh.factory<_i42.NotificationBloc>(
        () => _i42.NotificationBloc(gh<_i28.NotificationRepo>()));
    gh.factory<_i43.ProfileBloc>(
        () => _i43.ProfileBloc(gh<_i30.ProfileRepo>()));
    gh.factory<_i44.QrBloc>(() => _i44.QrBloc(gh<_i32.QrServiceRepo>()));
    gh.factory<_i45.ReminderBloc>(
        () => _i45.ReminderBloc(gh<_i34.ReminderRepo>()));
    return this;
  }
}

class _$DioModule extends _i46.DioModule {}
