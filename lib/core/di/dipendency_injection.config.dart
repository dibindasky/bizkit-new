// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/core/dio_module/dio_module.dart' as _i55;
import 'package:bizkit/module/biz_card/application/business_logic/admin/admin_bloc.dart'
    as _i54;
import 'package:bizkit/module/biz_card/application/business_logic/auth/forgott_passwrod/forgott_password_bloc.dart'
    as _i10;
import 'package:bizkit/module/biz_card/application/business_logic/auth/login/auth_bloc.dart'
    as _i19;
import 'package:bizkit/module/biz_card/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i15;
import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart'
    as _i46;
import 'package:bizkit/module/biz_card/application/business_logic/card/create/business_data/business_data_bloc.dart'
    as _i45;
import 'package:bizkit/module/biz_card/application/business_logic/card/create/user_data/user_data_bloc.dart'
    as _i42;
import 'package:bizkit/module/biz_card/application/business_logic/card_second/card_second_bloc.dart'
    as _i47;
import 'package:bizkit/module/biz_card/application/business_logic/connections/connection_request/connection_request_bloc.dart'
    as _i48;
import 'package:bizkit/module/biz_card/application/business_logic/contacts/contacts_bloc.dart'
    as _i49;
import 'package:bizkit/module/biz_card/application/business_logic/notification/notification_bloc.dart'
    as _i50;
import 'package:bizkit/module/biz_card/application/business_logic/profile/profile_bloc.dart'
    as _i51;
import 'package:bizkit/module/biz_card/application/business_logic/promt/promt_bloc.dart'
    as _i14;
import 'package:bizkit/module/biz_card/application/business_logic/qr/qr_bloc.dart'
    as _i52;
import 'package:bizkit/module/biz_card/application/business_logic/reminder/reminder_bloc.dart'
    as _i53;
import 'package:bizkit/module/biz_card/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i6;
import 'package:bizkit/module/biz_card/data/service/admin/admin_service.dart'
    as _i44;
import 'package:bizkit/module/biz_card/data/service/auth/auth_service.dart'
    as _i4;
import 'package:bizkit/module/biz_card/data/service/card/card_patch_service.dart'
    as _i21;
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart'
    as _i23;
import 'package:bizkit/module/biz_card/data/service/card_second/card_second_service.dart'
    as _i25;
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart'
    as _i27;
import 'package:bizkit/module/biz_card/data/service/contact/contact_service.dart'
    as _i31;
import 'package:bizkit/module/biz_card/data/service/notification/notification_service.dart'
    as _i33;
import 'package:bizkit/module/biz_card/data/service/profile/profile_services.dart'
    as _i35;
import 'package:bizkit/module/biz_card/data/service/qr/qr_service.dart' as _i37;
import 'package:bizkit/module/biz_card/data/service/reminder/reminder_service.dart'
    as _i39;
import 'package:bizkit/module/biz_card/data/service/text_extraction/text_extraction_service.dart'
    as _i41;
import 'package:bizkit/module/biz_card/data/sqflite/contacts/contact_local_service.dart'
    as _i29;
import 'package:bizkit/module/biz_card/data/sqflite/users/user_local_service.dart'
    as _i17;
import 'package:bizkit/module/biz_card/domain/repository/feature/card_scanning_repo.dart'
    as _i5;
import 'package:bizkit/module/biz_card/domain/repository/service/admin_repo.dart'
    as _i43;
import 'package:bizkit/module/biz_card/domain/repository/service/auth_repo.dart'
    as _i3;
import 'package:bizkit/module/biz_card/domain/repository/service/card_patch_repo.dart'
    as _i20;
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart'
    as _i22;
import 'package:bizkit/module/biz_card/domain/repository/service/card_second.dart'
    as _i24;
import 'package:bizkit/module/biz_card/domain/repository/service/connection_request_repo.dart'
    as _i26;
import 'package:bizkit/module/biz_card/domain/repository/service/contact_repo.dart'
    as _i30;
import 'package:bizkit/module/biz_card/domain/repository/service/notification.dart'
    as _i32;
import 'package:bizkit/module/biz_card/domain/repository/service/profile_repo.dart'
    as _i34;
import 'package:bizkit/module/biz_card/domain/repository/service/qr_repo.dart'
    as _i36;
import 'package:bizkit/module/biz_card/domain/repository/service/reminder_repo.dart'
    as _i38;
import 'package:bizkit/module/biz_card/domain/repository/service/text_extraction_repo.dart'
    as _i40;
import 'package:bizkit/module/biz_card/domain/repository/sqflite/contact_local_repo.dart'
    as _i28;
import 'package:bizkit/module/biz_card/domain/repository/sqflite/user_local_repo.dart'
    as _i16;
import 'package:bizkit/packages/contacts/contacts_fetch.dart' as _i7;
import 'package:bizkit/packages/device_info/device_ino.dart' as _i8;
import 'package:bizkit/packages/location/location_service.dart' as _i12;
import 'package:bizkit/packages/pdf/pdf_picker.dart' as _i13;
import 'package:bizkit/service/api_service/api_service.dart' as _i18;
import 'package:bizkit/service/local_service/sqflite_local_service.dart'
    as _i11;
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
    gh.lazySingleton<_i7.ContactFetchService>(() => _i7.ContactFetchService());
    gh.lazySingleton<_i8.DeviceInformation>(() => _i8.DeviceInformation());
    gh.lazySingleton<_i9.Dio>(() => dioModule.dioInstance);
    gh.factory<_i10.ForgottPasswordBloc>(
        () => _i10.ForgottPasswordBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i11.LocalService>(() => _i11.LocalService());
    gh.lazySingleton<_i12.LocationService>(() => _i12.LocationService());
    gh.lazySingleton<_i13.PdfPickerImpl>(() => _i13.PdfPickerImpl());
    gh.factory<_i14.PromtBloc>(() => _i14.PromtBloc());
    gh.factory<_i15.SignUpBloc>(() => _i15.SignUpBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i16.UserLocalRepo>(
        () => _i17.UserLocalService(gh<_i11.LocalService>()));
    gh.factory<_i18.ApiService>(() => _i18.ApiService(gh<_i9.Dio>()));
    gh.factory<_i19.AuthBloc>(() => _i19.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i16.UserLocalRepo>(),
        ));
    gh.lazySingleton<_i20.CardPatchRepo>(
        () => _i21.CardPatchService(gh<_i18.ApiService>()));
    gh.lazySingleton<_i22.CardRepo>(
        () => _i23.CardService(gh<_i18.ApiService>()));
    gh.lazySingleton<_i24.CardSecondRepo>(
        () => _i25.CardSecondService(gh<_i18.ApiService>()));
    gh.lazySingleton<_i26.ConnectionRequestRepo>(
        () => _i27.ConnectionService(gh<_i18.ApiService>()));
    gh.lazySingleton<_i28.ContactLocalRepo>(
        () => _i29.ContactLocalService(gh<_i11.LocalService>()));
    gh.lazySingleton<_i30.ContactsRepo>(
        () => _i31.ContactServiceImpl(gh<_i18.ApiService>()));
    gh.lazySingleton<_i32.NotificationRepo>(
        () => _i33.NotificationService(gh<_i18.ApiService>()));
    gh.lazySingleton<_i34.ProfileRepo>(
        () => _i35.ProfileService(gh<_i18.ApiService>()));
    gh.lazySingleton<_i36.QrServiceRepo>(
        () => _i37.QRServiceImpl(gh<_i18.ApiService>()));
    gh.lazySingleton<_i38.ReminderRepo>(
        () => _i39.ReminderService(gh<_i18.ApiService>()));
    gh.lazySingleton<_i40.TextExtractionRepo>(
        () => _i41.TextExtractionService(gh<_i18.ApiService>()));
    gh.factory<_i42.UserDataBloc>(() => _i42.UserDataBloc(
          gh<_i5.CardScanningRepo>(),
          gh<_i16.UserLocalRepo>(),
          gh<_i22.CardRepo>(),
          gh<_i40.TextExtractionRepo>(),
          gh<_i20.CardPatchRepo>(),
        ));
    gh.lazySingleton<_i43.AdminRepo>(
        () => _i44.AdminServices(gh<_i18.ApiService>()));
    gh.factory<_i45.BusinessDataBloc>(() => _i45.BusinessDataBloc(
          gh<_i13.PdfPickerImpl>(),
          gh<_i22.CardRepo>(),
          gh<_i16.UserLocalRepo>(),
          gh<_i20.CardPatchRepo>(),
        ));
    gh.factory<_i46.CardBloc>(() => _i46.CardBloc(
          gh<_i22.CardRepo>(),
          gh<_i13.PdfPickerImpl>(),
        ));
    gh.factory<_i47.CardSecondBloc>(() => _i47.CardSecondBloc(
          gh<_i24.CardSecondRepo>(),
          gh<_i5.CardScanningRepo>(),
          gh<_i12.LocationService>(),
          gh<_i40.TextExtractionRepo>(),
          gh<_i7.ContactFetchService>(),
        ));
    gh.factory<_i48.ConnectionRequestBloc>(
        () => _i48.ConnectionRequestBloc(gh<_i26.ConnectionRequestRepo>()));
    gh.factory<_i49.ContactsBloc>(() => _i49.ContactsBloc(
          gh<_i7.ContactFetchService>(),
          gh<_i30.ContactsRepo>(),
          gh<_i28.ContactLocalRepo>(),
        ));
    gh.factory<_i50.NotificationBloc>(
        () => _i50.NotificationBloc(gh<_i32.NotificationRepo>()));
    gh.factory<_i51.ProfileBloc>(
        () => _i51.ProfileBloc(gh<_i34.ProfileRepo>()));
    gh.factory<_i52.QrBloc>(() => _i52.QrBloc(gh<_i36.QrServiceRepo>()));
    gh.factory<_i53.ReminderBloc>(
        () => _i53.ReminderBloc(gh<_i38.ReminderRepo>()));
    gh.factory<_i54.AdminBloc>(() => _i54.AdminBloc(gh<_i43.AdminRepo>()));
    return this;
  }
}

class _$DioModule extends _i55.DioModule {}
