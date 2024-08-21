// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/core/dipendency/dio_module/dio_module.dart' as _i49;

import 'package:bizkit/module/biz_card/application/business_logic/connections/connection_request/connection_request_bloc.dart'
    as _i40;
import 'package:bizkit/module/biz_card/application/business_logic/contacts/contacts_bloc.dart'
    as _i43;
import 'package:bizkit/module/biz_card/application/business_logic/profile/profile_bloc.dart'
    as _i45;
import 'package:bizkit/module/biz_card/application/business_logic/qr/qr_bloc.dart'
    as _i46;
import 'package:bizkit/module/biz_card/application/business_logic/reminder/reminder_bloc.dart'
    as _i47;
import 'package:bizkit/module/biz_card/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i9;
import 'package:bizkit/module/biz_card/data/service/admin/admin_service.dart'
    as _i38;
import 'package:bizkit/module/biz_card/data/service/auth/auth_service.dart'
    as _i5;
import 'package:bizkit/module/biz_card/data/service/card/card_service.dart'
    as _i7;
import 'package:bizkit/module/biz_card/data/service/card_second/card_second_service.dart'
    as _i11;
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart'
    as _i13;
import 'package:bizkit/module/biz_card/data/service/contact/contact_service.dart'
    as _i16;
import 'package:bizkit/module/biz_card/data/service/notification/notification_service.dart'
    as _i23;
import 'package:bizkit/module/biz_card/data/service/profile/profile_services.dart'
    as _i26;
import 'package:bizkit/module/biz_card/data/service/qr/qr_service.dart' as _i29;
import 'package:bizkit/module/biz_card/data/service/reminder/reminder_service.dart'
    as _i31;
import 'package:bizkit/module/biz_card/data/service/text_extraction/text_extraction_service.dart'
    as _i34;
import 'package:bizkit/module/biz_card/data/sqflite/contacts/contact_local_service.dart'
    as _i42;
import 'package:bizkit/module/biz_card/data/sqflite/users/user_local_service.dart'
    as _i36;
import 'package:bizkit/module/biz_card/domain/repository/feature/card_scanning_repo.dart'
    as _i8;
import 'package:bizkit/module/biz_card/domain/repository/service/admin_repo.dart'
    as _i37;
import 'package:bizkit/module/biz_card/domain/repository/service/auth_repo.dart'
    as _i4;
import 'package:bizkit/module/biz_card/domain/repository/service/card_repo.dart'
    as _i6;
import 'package:bizkit/module/biz_card/domain/repository/service/card_second.dart'
    as _i10;
import 'package:bizkit/module/biz_card/domain/repository/service/connection_request_repo.dart'
    as _i12;
import 'package:bizkit/module/biz_card/domain/repository/service/contact_repo.dart'
    as _i15;
import 'package:bizkit/module/biz_card/domain/repository/service/notification.dart'
    as _i22;
import 'package:bizkit/module/biz_card/domain/repository/service/profile_repo.dart'
    as _i25;
import 'package:bizkit/module/biz_card/domain/repository/service/qr_repo.dart'
    as _i28;
import 'package:bizkit/module/biz_card/domain/repository/service/reminder_repo.dart'
    as _i30;
import 'package:bizkit/module/biz_card/domain/repository/service/text_extraction_repo.dart'
    as _i33;
import 'package:bizkit/module/biz_card/domain/repository/sqflite/contact_local_repo.dart'
    as _i41;
import 'package:bizkit/module/biz_card/domain/repository/sqflite/user_local_repo.dart'
    as _i35;
import 'package:bizkit/packages/contacts/contacts_fetch.dart' as _i14;
import 'package:bizkit/packages/device_info/device_ino.dart' as _i17;
import 'package:bizkit/packages/location/location_service.dart' as _i21;
import 'package:bizkit/packages/pdf/pdf_picker.dart' as _i24;
import 'package:bizkit/service/api_service/api_service.dart' as _i3;
import 'package:bizkit/service/local_service/sqflite_local_service.dart'
    as _i20;
import 'package:dio/dio.dart' as _i18;
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
    gh.lazySingleton<_i6.CardRepo>(() => _i7.CardService());
    gh.lazySingleton<_i8.CardScanningRepo>(() => _i9.CardScanningImpl());
    gh.lazySingleton<_i10.CardSecondRepo>(
        () => _i11.CardSecondService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i12.ConnectionRequestRepo>(
        () => _i13.ConnectionService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i14.ContactFetchService>(
        () => _i14.ContactFetchService());
    gh.lazySingleton<_i15.ContactsRepo>(
        () => _i16.ContactServiceImpl(gh<_i3.ApiService>()));
    gh.lazySingleton<_i17.DeviceInformation>(() => _i17.DeviceInformation());
    gh.lazySingleton<_i18.Dio>(() => dioModule.dioInstance);

    gh.lazySingleton<_i20.LocalService>(() => _i20.LocalService());
    gh.lazySingleton<_i21.LocationService>(() => _i21.LocationService());
    gh.lazySingleton<_i22.NotificationRepo>(
        () => _i23.NotificationService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i24.PdfPickerImpl>(() => _i24.PdfPickerImpl());
    gh.lazySingleton<_i25.ProfileRepo>(
        () => _i26.ProfileService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i28.QrServiceRepo>(
        () => _i29.QRServiceImpl(gh<_i3.ApiService>()));
    gh.lazySingleton<_i30.ReminderRepo>(
        () => _i31.ReminderService(gh<_i3.ApiService>()));

    gh.lazySingleton<_i33.TextExtractionRepo>(
        () => _i34.TextExtractionService(gh<_i3.ApiService>()));
    gh.lazySingleton<_i35.UserLocalRepo>(
        () => _i36.UserLocalService(gh<_i20.LocalService>()));
    gh.lazySingleton<_i37.AdminRepo>(
        () => _i38.AdminServices(gh<_i3.ApiService>()));

    gh.factory<_i40.ConnectionRequestBloc>(
        () => _i40.ConnectionRequestBloc(gh<_i12.ConnectionRequestRepo>()));
    gh.lazySingleton<_i41.ContactLocalRepo>(
        () => _i42.ContactLocalService(gh<_i20.LocalService>()));
    gh.factory<_i43.ContactsBloc>(() => _i43.ContactsBloc(
          gh<_i14.ContactFetchService>(),
          gh<_i15.ContactsRepo>(),
          gh<_i41.ContactLocalRepo>(),
        ));
    gh.factory<_i45.ProfileBloc>(
        () => _i45.ProfileBloc(gh<_i25.ProfileRepo>()));
    gh.factory<_i46.QrBloc>(() => _i46.QrBloc(gh<_i28.QrServiceRepo>()));
    gh.factory<_i47.ReminderBloc>(
        () => _i47.ReminderBloc(gh<_i30.ReminderRepo>()));
    // gh.factory<_i48.AdminBloc>(() => _i48.AdminBloc(gh<_i37.AdminRepo>()));́
    return this;
  }
}

class _$DioModule extends _i49.DioModule {}
