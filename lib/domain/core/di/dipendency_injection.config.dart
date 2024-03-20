// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart'
    as _i18;
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i14;
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart'
    as _i33;
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart'
    as _i32;
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart'
    as _i31;
import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart'
    as _i7;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i34;
import 'package:bizkit/application/business_logic/profile/profile_bloc.dart'
    as _i35;
import 'package:bizkit/application/business_logic/qr/qr_bloc.dart' as _i36;
import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart'
    as _i37;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i6;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i10;
import 'package:bizkit/data/features/pdf/pdf_picker.dart' as _i13;
import 'package:bizkit/data/service/api_service.dart' as _i17;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i4;
import 'package:bizkit/data/service/card/card_service.dart' as _i20;
import 'package:bizkit/data/service/contact/contact_service.dart' as _i24;
import 'package:bizkit/data/service/profile/profile_services.dart' as _i26;
import 'package:bizkit/data/service/qr/qr_service.dart' as _i28;
import 'package:bizkit/data/service/reminder/reminder_service.dart' as _i30;
import 'package:bizkit/data/sqflite/contacts/contact_local_service.dart'
    as _i22;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i12;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i16;
import 'package:bizkit/domain/core/dio_module/dio_module.dart' as _i38;
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart'
    as _i5;
import 'package:bizkit/domain/repository/feature/contact_feature_repo.dart'
    as _i9;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i3;
import 'package:bizkit/domain/repository/service/card_repo.dart' as _i19;
import 'package:bizkit/domain/repository/service/connection_request_repo.dart'
    as _i8;
import 'package:bizkit/domain/repository/service/contact_repo.dart' as _i23;
import 'package:bizkit/domain/repository/service/profile_repo.dart' as _i25;
import 'package:bizkit/domain/repository/service/qr_repo.dart' as _i27;
import 'package:bizkit/domain/repository/service/reminder_repo.dart' as _i29;
import 'package:bizkit/domain/repository/sqflite/contact_local_repo.dart'
    as _i21;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i15;
import 'package:dio/dio.dart' as _i11;
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
    gh.factory<_i7.ConnectionRequestBloc>(
        () => _i7.ConnectionRequestBloc(gh<_i8.ConnectionRequestRepo>()));
    gh.lazySingleton<_i9.ContactFetchServiceRepo>(
        () => _i10.ContactFetchService());
    gh.lazySingleton<_i11.Dio>(() => dioModule.dioInstance);
    gh.lazySingleton<_i12.LocalService>(() => _i12.LocalService());
    gh.lazySingleton<_i13.PdfPickerImpl>(() => _i13.PdfPickerImpl());
    gh.factory<_i14.SignUpBloc>(() => _i14.SignUpBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i15.UserLocalRepo>(
        () => _i16.UserLocalService(gh<_i12.LocalService>()));
    gh.factory<_i17.ApiService>(() => _i17.ApiService(gh<_i11.Dio>()));
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i15.UserLocalRepo>(),
        ));
    gh.lazySingleton<_i19.CardRepo>(
        () => _i20.CardService(gh<_i17.ApiService>()));
    gh.lazySingleton<_i21.ContactLocalRepo>(
        () => _i22.ContactLocalService(gh<_i12.LocalService>()));
    gh.lazySingleton<_i23.ContactsRepo>(
        () => _i24.ContactServiceImpl(gh<_i17.ApiService>()));
    gh.lazySingleton<_i25.ProfileRepo>(
        () => _i26.ProfileService(gh<_i17.ApiService>()));
    gh.lazySingleton<_i27.QrServiceRepo>(
        () => _i28.QRServiceImpl(gh<_i17.ApiService>()));
    gh.lazySingleton<_i29.ReminderRepo>(
        () => _i30.ReminderService(gh<_i17.ApiService>()));
    gh.factory<_i31.UserDataBloc>(() => _i31.UserDataBloc(
          gh<_i5.CardScanningRepo>(),
          gh<_i15.UserLocalRepo>(),
          gh<_i19.CardRepo>(),
        ));
    gh.factory<_i32.BusinessDataBloc>(() => _i32.BusinessDataBloc(
          gh<_i13.PdfPickerImpl>(),
          gh<_i19.CardRepo>(),
          gh<_i15.UserLocalRepo>(),
        ));
    gh.factory<_i33.CardBloc>(() => _i33.CardBloc(
          gh<_i19.CardRepo>(),
          gh<_i13.PdfPickerImpl>(),
        ));
    gh.factory<_i34.ContactsBloc>(() => _i34.ContactsBloc(
          gh<_i9.ContactFetchServiceRepo>(),
          gh<_i23.ContactsRepo>(),
          gh<_i21.ContactLocalRepo>(),
        ));
    gh.factory<_i35.ProfileBloc>(
        () => _i35.ProfileBloc(gh<_i25.ProfileRepo>()));
    gh.factory<_i36.QrBloc>(() => _i36.QrBloc(
          gh<_i27.QrServiceRepo>(),
          gh<_i25.ProfileRepo>(),
        ));
    gh.factory<_i37.ReminderBloc>(
        () => _i37.ReminderBloc(gh<_i29.ReminderRepo>()));
    return this;
  }
}

class _$DioModule extends _i38.DioModule {}
