// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart'
    as _i26;
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i24;
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart'
    as _i27;
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart'
    as _i15;
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart'
    as _i25;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i28;
import 'package:bizkit/application/business_logic/qr/qr_bloc.dart' as _i29;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i4;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i6;
import 'package:bizkit/data/features/pdf/pdf_picker.dart' as _i9;
import 'package:bizkit/data/service/api_service.dart' as _i12;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i14;
import 'package:bizkit/data/service/card/card_service.dart' as _i17;
import 'package:bizkit/data/service/contact/contact_service.dart' as _i21;
import 'package:bizkit/data/service/qr/qr_service.dart' as _i23;
import 'package:bizkit/data/sqflite/contacts/contact_local_service.dart'
    as _i19;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i8;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i11;
import 'package:bizkit/domain/core/dio_module/dio_module.dart' as _i30;
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart'
    as _i3;
import 'package:bizkit/domain/repository/feature/contact_feature_repo.dart'
    as _i5;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i13;
import 'package:bizkit/domain/repository/service/card_repo.dart' as _i16;
import 'package:bizkit/domain/repository/service/contact_repo.dart' as _i20;
import 'package:bizkit/domain/repository/service/qr_repo.dart' as _i22;
import 'package:bizkit/domain/repository/sqflite/contact_local_repo.dart'
    as _i18;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i10;
import 'package:dio/dio.dart' as _i7;
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
    gh.lazySingleton<_i3.CardScanningRepo>(() => _i4.CardScanningImpl());
    gh.lazySingleton<_i5.ContactFetchServiceRepo>(
        () => _i6.ContactFetchService());
    gh.lazySingleton<_i7.Dio>(() => dioModule.dioInstance);
    gh.lazySingleton<_i8.LocalService>(() => _i8.LocalService());
    gh.lazySingleton<_i9.PdfPickerImpl>(() => _i9.PdfPickerImpl());
    gh.lazySingleton<_i10.UserLocalRepo>(
        () => _i11.UserLocalService(gh<_i8.LocalService>()));
    gh.factory<_i12.ApiService>(() => _i12.ApiService(gh<_i7.Dio>()));
    gh.lazySingleton<_i13.AuthRepo>(() => _i14.AuthService(gh<_i7.Dio>()));
    gh.factory<_i15.BusinessDataBloc>(
        () => _i15.BusinessDataBloc(gh<_i9.PdfPickerImpl>()));
    gh.lazySingleton<_i16.CardRepo>(
        () => _i17.CardService(gh<_i12.ApiService>()));
    gh.lazySingleton<_i18.ContactLocalRepo>(
        () => _i19.ContactLocalService(gh<_i8.LocalService>()));
    gh.lazySingleton<_i20.ContactsRepo>(
        () => _i21.ContactServiceImpl(gh<_i12.ApiService>()));
    gh.lazySingleton<_i22.QrServiceRepo>(
        () => _i23.QRServiceImpl(gh<_i12.ApiService>()));
    gh.factory<_i24.SignUpBloc>(() => _i24.SignUpBloc(gh<_i13.AuthRepo>()));
    gh.factory<_i25.UserDataBloc>(() => _i25.UserDataBloc(
          gh<_i3.CardScanningRepo>(),
          gh<_i10.UserLocalRepo>(),
          gh<_i16.CardRepo>(),
        ));
    gh.factory<_i26.AuthBloc>(() => _i26.AuthBloc(
          gh<_i13.AuthRepo>(),
          gh<_i10.UserLocalRepo>(),
        ));
    gh.factory<_i27.CardBloc>(() => _i27.CardBloc(gh<_i16.CardRepo>()));
    gh.factory<_i28.ContactsBloc>(() => _i28.ContactsBloc(
          gh<_i5.ContactFetchServiceRepo>(),
          gh<_i20.ContactsRepo>(),
          gh<_i18.ContactLocalRepo>(),
        ));
    gh.factory<_i29.QrBloc>(() => _i29.QrBloc(gh<_i22.QrServiceRepo>()));
    return this;
  }
}

class _$DioModule extends _i30.DioModule {}
