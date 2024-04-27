// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/auth/forgott_passwrod/forgott_password_bloc.dart'
    as _i10;
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart'
    as _i20;
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i16;
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart'
    as _i45;
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart'
    as _i44;
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart'
    as _i43;
import 'package:bizkit/application/business_logic/card_second/card_second_bloc.dart'
    as _i46;
import 'package:bizkit/application/business_logic/connections/connection_request/connection_request_bloc.dart'
    as _i47;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i48;
import 'package:bizkit/application/business_logic/notification/notification_bloc.dart'
    as _i49;
import 'package:bizkit/application/business_logic/profile/profile_bloc.dart'
    as _i50;
import 'package:bizkit/application/business_logic/promt/promt_bloc.dart'
    as _i15;
import 'package:bizkit/application/business_logic/qr/qr_bloc.dart' as _i51;
import 'package:bizkit/application/business_logic/reminder/reminder_bloc.dart'
    as _i52;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i6;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i8;
import 'package:bizkit/data/features/location/location_service.dart' as _i13;
import 'package:bizkit/data/features/pdf/pdf_picker.dart' as _i14;
import 'package:bizkit/data/service/api_service.dart' as _i19;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i4;
import 'package:bizkit/data/service/card/card_patch_service.dart' as _i22;
import 'package:bizkit/data/service/card/card_service.dart' as _i24;
import 'package:bizkit/data/service/card_second/card_second_service.dart'
    as _i26;
import 'package:bizkit/data/service/connections/connections_service.dart'
    as _i28;
import 'package:bizkit/data/service/contact/contact_service.dart' as _i32;
import 'package:bizkit/data/service/notification/notification_service.dart'
    as _i34;
import 'package:bizkit/data/service/profile/profile_services.dart' as _i36;
import 'package:bizkit/data/service/qr/qr_service.dart' as _i38;
import 'package:bizkit/data/service/reminder/reminder_service.dart' as _i40;
import 'package:bizkit/data/service/text_extraction/text_extraction_service.dart'
    as _i42;
import 'package:bizkit/data/sqflite/contacts/contact_local_service.dart'
    as _i30;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i11;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i18;
import 'package:bizkit/domain/core/dio_module/dio_module.dart' as _i53;
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart'
    as _i5;
import 'package:bizkit/domain/repository/feature/contact_feature_repo.dart'
    as _i7;
import 'package:bizkit/domain/repository/feature/location.dart' as _i12;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i3;
import 'package:bizkit/domain/repository/service/card_patch_repo.dart' as _i21;
import 'package:bizkit/domain/repository/service/card_repo.dart' as _i23;
import 'package:bizkit/domain/repository/service/card_second.dart' as _i25;
import 'package:bizkit/domain/repository/service/connection_request_repo.dart'
    as _i27;
import 'package:bizkit/domain/repository/service/contact_repo.dart' as _i31;
import 'package:bizkit/domain/repository/service/notification.dart' as _i33;
import 'package:bizkit/domain/repository/service/profile_repo.dart' as _i35;
import 'package:bizkit/domain/repository/service/qr_repo.dart' as _i37;
import 'package:bizkit/domain/repository/service/reminder_repo.dart' as _i39;
import 'package:bizkit/domain/repository/service/text_extraction_repo.dart'
    as _i41;
import 'package:bizkit/domain/repository/sqflite/contact_local_repo.dart'
    as _i29;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i17;
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
    gh.factory<_i10.ForgottPasswordBloc>(
        () => _i10.ForgottPasswordBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i11.LocalService>(() => _i11.LocalService());
    gh.lazySingleton<_i12.LocationRepo>(() => _i13.LocationService());
    gh.lazySingleton<_i14.PdfPickerImpl>(() => _i14.PdfPickerImpl());
    gh.factory<_i15.PromtBloc>(() => _i15.PromtBloc());
    gh.factory<_i16.SignUpBloc>(() => _i16.SignUpBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i17.UserLocalRepo>(
        () => _i18.UserLocalService(gh<_i11.LocalService>()));
    gh.factory<_i19.ApiService>(() => _i19.ApiService(gh<_i9.Dio>()));
    gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i17.UserLocalRepo>(),
        ));
    gh.lazySingleton<_i21.CardPatchRepo>(
        () => _i22.CardPatchService(gh<_i19.ApiService>()));
    gh.lazySingleton<_i23.CardRepo>(
        () => _i24.CardService(gh<_i19.ApiService>()));
    gh.lazySingleton<_i25.CardSecondRepo>(
        () => _i26.CardSecondService(gh<_i19.ApiService>()));
    gh.lazySingleton<_i27.ConnectionRequestRepo>(
        () => _i28.ConnectionService(gh<_i19.ApiService>()));
    gh.lazySingleton<_i29.ContactLocalRepo>(
        () => _i30.ContactLocalService(gh<_i11.LocalService>()));
    gh.lazySingleton<_i31.ContactsRepo>(
        () => _i32.ContactServiceImpl(gh<_i19.ApiService>()));
    gh.lazySingleton<_i33.NotificationRepo>(
        () => _i34.NotificationService(gh<_i19.ApiService>()));
    gh.lazySingleton<_i35.ProfileRepo>(
        () => _i36.ProfileService(gh<_i19.ApiService>()));
    gh.lazySingleton<_i37.QrServiceRepo>(
        () => _i38.QRServiceImpl(gh<_i19.ApiService>()));
    gh.lazySingleton<_i39.ReminderRepo>(
        () => _i40.ReminderService(gh<_i19.ApiService>()));
    gh.lazySingleton<_i41.TextExtractionRepo>(
        () => _i42.TextExtractionService(gh<_i19.ApiService>()));
    gh.factory<_i43.UserDataBloc>(() => _i43.UserDataBloc(
          gh<_i5.CardScanningRepo>(),
          gh<_i17.UserLocalRepo>(),
          gh<_i23.CardRepo>(),
          gh<_i41.TextExtractionRepo>(),
          gh<_i21.CardPatchRepo>(),
        ));
    gh.factory<_i44.BusinessDataBloc>(() => _i44.BusinessDataBloc(
          gh<_i14.PdfPickerImpl>(),
          gh<_i23.CardRepo>(),
          gh<_i17.UserLocalRepo>(),
          gh<_i21.CardPatchRepo>(),
        ));
    gh.factory<_i45.CardBloc>(() => _i45.CardBloc(
          gh<_i23.CardRepo>(),
          gh<_i14.PdfPickerImpl>(),
        ));
    gh.factory<_i46.CardSecondBloc>(() => _i46.CardSecondBloc(
          gh<_i25.CardSecondRepo>(),
          gh<_i5.CardScanningRepo>(),
          gh<_i12.LocationRepo>(),
          gh<_i41.TextExtractionRepo>(),
        ));
    gh.factory<_i47.ConnectionRequestBloc>(
        () => _i47.ConnectionRequestBloc(gh<_i27.ConnectionRequestRepo>()));
    gh.factory<_i48.ContactsBloc>(() => _i48.ContactsBloc(
          gh<_i7.ContactFetchServiceRepo>(),
          gh<_i31.ContactsRepo>(),
          gh<_i29.ContactLocalRepo>(),
        ));
    gh.factory<_i49.NotificationBloc>(
        () => _i49.NotificationBloc(gh<_i33.NotificationRepo>()));
    gh.factory<_i50.ProfileBloc>(
        () => _i50.ProfileBloc(gh<_i35.ProfileRepo>()));
    gh.factory<_i51.QrBloc>(() => _i51.QrBloc(gh<_i37.QrServiceRepo>()));
    gh.factory<_i52.ReminderBloc>(
        () => _i52.ReminderBloc(gh<_i39.ReminderRepo>()));
    return this;
  }
}

class _$DioModule extends _i53.DioModule {}
