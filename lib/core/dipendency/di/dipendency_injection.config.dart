// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/core/dipendency/dio_module/dio_module.dart' as _i55;
import 'package:bizkit/module/biz_card/application/business_logic/admin/admin_bloc.dart'
    as _i54;
import 'package:bizkit/module/biz_card/application/business_logic/auth/forgott_passwrod/forgott_password_bloc.dart'
    as _i21;
import 'package:bizkit/module/biz_card/application/business_logic/auth/login/auth_bloc.dart'
    as _i41;
import 'package:bizkit/module/biz_card/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i34;
import 'package:bizkit/module/biz_card/application/business_logic/card/card/card_bloc.dart'
    as _i43;
import 'package:bizkit/module/biz_card/application/business_logic/card/create/business_data/business_data_bloc.dart'
    as _i42;
import 'package:bizkit/module/biz_card/application/business_logic/card/create/user_data/user_data_bloc.dart'
    as _i53;
import 'package:bizkit/module/biz_card/application/business_logic/card_second/card_second_bloc.dart'
    as _i44;
import 'package:bizkit/module/biz_card/application/business_logic/connections/connection_request/connection_request_bloc.dart'
    as _i45;
import 'package:bizkit/module/biz_card/application/business_logic/contacts/contacts_bloc.dart'
    as _i48;
import 'package:bizkit/module/biz_card/application/business_logic/notification/notification_bloc.dart'
    as _i49;
import 'package:bizkit/module/biz_card/application/business_logic/profile/profile_bloc.dart'
    as _i50;
import 'package:bizkit/module/biz_card/application/business_logic/promt/promt_bloc.dart'
    as _i29;
import 'package:bizkit/module/biz_card/application/business_logic/qr/qr_bloc.dart'
    as _i51;
import 'package:bizkit/module/biz_card/application/business_logic/reminder/reminder_bloc.dart'
    as _i52;
import 'package:bizkit/module/biz_card/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i11;
import 'package:bizkit/module/biz_card/data/service/admin/admin_service.dart'
    as _i40;
import 'package:bizkit/module/biz_card/data/service/auth/auth_service.dart'
    as _i5;
import 'package:bizkit/module/biz_card/data/service/card/card_patch_service.dart'
    as _i7;
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart'
    as _i9;
import 'package:bizkit/module/biz_card/data/service/card_second/card_second_service.dart'
    as _i13;
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart'
    as _i15;
import 'package:bizkit/module/biz_card/data/service/contact/contact_service.dart'
    as _i18;
import 'package:bizkit/module/biz_card/data/service/notification/notification_service.dart'
    as _i25;
import 'package:bizkit/module/biz_card/data/service/profile/profile_services.dart'
    as _i28;
import 'package:bizkit/module/biz_card/data/service/qr/qr_service.dart' as _i31;
import 'package:bizkit/module/biz_card/data/service/reminder/reminder_service.dart'
    as _i33;
import 'package:bizkit/module/biz_card/data/service/text_extraction/text_extraction_service.dart'
    as _i36;
import 'package:bizkit/module/biz_card/data/sqflite/contacts/contact_local_service.dart'
    as _i47;
import 'package:bizkit/module/biz_card/data/sqflite/users/user_local_service.dart'
    as _i38;
import 'package:bizkit/module/biz_card/domain/repository/feature/card_scanning_repo.dart'
    as _i10;
import 'package:bizkit/module/biz_card/domain/repository/service/admin_repo.dart'
    as _i39;
import 'package:bizkit/module/biz_card/domain/repository/service/auth_repo.dart'
    as _i4;
import 'package:bizkit/module/biz_card/domain/repository/service/card_patch_repo.dart'
    as _i6;
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart'
    as _i8;
import 'package:bizkit/module/biz_card/domain/repository/service/card_second.dart'
    as _i12;
import 'package:bizkit/module/biz_card/domain/repository/service/connection_request_repo.dart'
    as _i14;
import 'package:bizkit/module/biz_card/domain/repository/service/contact_repo.dart'
    as _i17;
import 'package:bizkit/module/biz_card/domain/repository/service/notification.dart'
    as _i24;
import 'package:bizkit/module/biz_card/domain/repository/service/profile_repo.dart'
    as _i27;
import 'package:bizkit/module/biz_card/domain/repository/service/qr_repo.dart'
    as _i30;
import 'package:bizkit/module/biz_card/domain/repository/service/reminder_repo.dart'
    as _i32;
import 'package:bizkit/module/biz_card/domain/repository/service/text_extraction_repo.dart'
    as _i35;
import 'package:bizkit/module/biz_card/domain/repository/sqflite/contact_local_repo.dart'
    as _i46;
import 'package:bizkit/module/biz_card/domain/repository/sqflite/user_local_repo.dart'
    as _i37;
import 'package:bizkit/packages/contacts/contacts_fetch.dart' as _i16;
import 'package:bizkit/packages/device_info/device_ino.dart' as _i19;
import 'package:bizkit/packages/location/location_service.dart' as _i23;
import 'package:bizkit/packages/pdf/pdf_picker.dart' as _i26;
import 'package:bizkit/service/api_service/api_service.dart' as _i3;
import 'package:bizkit/service/local_service/sqflite_local_service.dart'
    as _i22;
import 'package:dio/dio.dart' as _i20;
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
    gh.factory<_i3.ApiService>(() => _i3.ApiService());
    gh.lazySingleton<_i4.AuthRepo>(() => _i5.AuthService());
    gh.lazySingleton<_i6.CardPatchRepo>(
        () => _i7.CardPatchService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i8.CardRepo>(() => _i9.CardService());
    gh.lazySingleton<_i10.CardScanningRepo>(() => _i11.CardScanningImpl());
    gh.lazySingleton<_i12.CardSecondRepo>(
        () => _i13.CardSecondService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i14.ConnectionRequestRepo>(
        () => _i15.ConnectionService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i16.ContactFetchService>(
        () => _i16.ContactFetchService());
    gh.lazySingleton<_i17.ContactsRepo>(
        () => _i18.ContactServiceImpl(gh<_i3.ApiService>()));
    gh.lazySingleton<_i19.DeviceInformation>(() => _i19.DeviceInformation());
    gh.lazySingleton<_i20.Dio>(() => dioModule.dioInstance);
    gh.factory<_i21.ForgottPasswordBloc>(
        () => _i21.ForgottPasswordBloc(gh<_i4.AuthRepo>()));
    gh.lazySingleton<_i22.LocalService>(() => _i22.LocalService());
    gh.lazySingleton<_i23.LocationService>(() => _i23.LocationService());
    gh.lazySingleton<_i24.NotificationRepo>(
        () => _i25.NotificationService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i26.PdfPickerImpl>(() => _i26.PdfPickerImpl());
    gh.lazySingleton<_i27.ProfileRepo>(
        () => _i28.ProfileService(gh<_i3.ApiService>()));
    gh.factory<_i29.PromtBloc>(() => _i29.PromtBloc());
    gh.lazySingleton<_i30.QrServiceRepo>(
        () => _i31.QRServiceImpl(gh<_i3.ApiService>()));
    gh.lazySingleton<_i32.ReminderRepo>(
        () => _i33.ReminderService(gh<_i3.ApiService>()));
    gh.factory<_i34.SignUpBloc>(() => _i34.SignUpBloc(gh<_i4.AuthRepo>()));
    gh.lazySingleton<_i35.TextExtractionRepo>(
        () => _i36.TextExtractionService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i37.UserLocalRepo>(
        () => _i38.UserLocalService(gh<_i22.LocalService>()));
    gh.lazySingleton<_i39.AdminRepo>(
        () => _i40.AdminServices(gh<_i3.ApiService>()));
    gh.factory<_i41.AuthBloc>(() => _i41.AuthBloc(
          gh<_i4.AuthRepo>(),
          gh<_i37.UserLocalRepo>(),
        ));
    gh.factory<_i42.BusinessDataBloc>(() => _i42.BusinessDataBloc(
          gh<_i26.PdfPickerImpl>(),
          gh<_i8.CardRepo>(),
          gh<_i37.UserLocalRepo>(),
          gh<_i6.CardPatchRepo>(),
        ));
    gh.factory<_i43.CardBloc>(() => _i43.CardBloc(
          gh<_i8.CardRepo>(),
          gh<_i26.PdfPickerImpl>(),
        ));
    gh.factory<_i44.CardSecondBloc>(() => _i44.CardSecondBloc(
          gh<_i12.CardSecondRepo>(),
          gh<_i10.CardScanningRepo>(),
          gh<_i23.LocationService>(),
          gh<_i35.TextExtractionRepo>(),
          gh<_i16.ContactFetchService>(),
        ));
    gh.factory<_i45.ConnectionRequestBloc>(
        () => _i45.ConnectionRequestBloc(gh<_i14.ConnectionRequestRepo>()));
    gh.lazySingleton<_i46.ContactLocalRepo>(
        () => _i47.ContactLocalService(gh<_i22.LocalService>()));
    gh.factory<_i48.ContactsBloc>(() => _i48.ContactsBloc(
          gh<_i16.ContactFetchService>(),
          gh<_i17.ContactsRepo>(),
          gh<_i46.ContactLocalRepo>(),
        ));
    gh.factory<_i49.NotificationBloc>(
        () => _i49.NotificationBloc(gh<_i24.NotificationRepo>()));
    gh.factory<_i50.ProfileBloc>(
        () => _i50.ProfileBloc(gh<_i27.ProfileRepo>()));
    gh.factory<_i51.QrBloc>(() => _i51.QrBloc(gh<_i30.QrServiceRepo>()));
    gh.factory<_i52.ReminderBloc>(
        () => _i52.ReminderBloc(gh<_i32.ReminderRepo>()));
    gh.factory<_i53.UserDataBloc>(() => _i53.UserDataBloc(
          gh<_i10.CardScanningRepo>(),
          gh<_i37.UserLocalRepo>(),
          gh<_i8.CardRepo>(),
          gh<_i35.TextExtractionRepo>(),
          gh<_i6.CardPatchRepo>(),
        ));
    gh.factory<_i54.AdminBloc>(() => _i54.AdminBloc(gh<_i39.AdminRepo>()));
    return this;
  }
}

class _$DioModule extends _i55.DioModule {}
