// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart'
    as _i16;
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i12;
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart'
    as _i27;
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart'
    as _i26;
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart'
    as _i25;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i28;
import 'package:bizkit/application/business_logic/qr/qr_bloc.dart' as _i29;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i6;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i8;
import 'package:bizkit/data/features/pdf/pdf_picker.dart' as _i11;
import 'package:bizkit/data/service/api_service.dart' as _i15;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i4;
import 'package:bizkit/data/service/card/card_service.dart' as _i18;
import 'package:bizkit/data/service/contact/contact_service.dart' as _i22;
import 'package:bizkit/data/service/qr/qr_service.dart' as _i24;
import 'package:bizkit/data/sqflite/contacts/contact_local_service.dart'
    as _i20;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i10;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i14;
import 'package:bizkit/domain/core/dio_module/dio_module.dart' as _i30;
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart'
    as _i5;
import 'package:bizkit/domain/repository/feature/contact_feature_repo.dart'
    as _i7;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i3;
import 'package:bizkit/domain/repository/service/card_repo.dart' as _i17;
import 'package:bizkit/domain/repository/service/contact_repo.dart' as _i21;
import 'package:bizkit/domain/repository/service/qr_repo.dart' as _i23;
import 'package:bizkit/domain/repository/sqflite/contact_local_repo.dart'
    as _i19;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i13;
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
    gh.factory<_i12.SignUpBloc>(() => _i12.SignUpBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i13.UserLocalRepo>(
        () => _i14.UserLocalService(gh<_i10.LocalService>()));
    gh.factory<_i15.ApiService>(() => _i15.ApiService(gh<_i9.Dio>()));
    gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i13.UserLocalRepo>(),
        ));
    gh.lazySingleton<_i17.CardRepo>(
        () => _i18.CardService(gh<_i15.ApiService>()));
    gh.lazySingleton<_i19.ContactLocalRepo>(
        () => _i20.ContactLocalService(gh<_i10.LocalService>()));
    gh.lazySingleton<_i21.ContactsRepo>(
        () => _i22.ContactServiceImpl(gh<_i15.ApiService>()));
    gh.lazySingleton<_i23.QrServiceRepo>(
        () => _i24.QRServiceImpl(gh<_i15.ApiService>()));
    gh.factory<_i25.UserDataBloc>(() => _i25.UserDataBloc(
          gh<_i5.CardScanningRepo>(),
          gh<_i13.UserLocalRepo>(),
          gh<_i17.CardRepo>(),
        ));
    gh.factory<_i26.BusinessDataBloc>(() => _i26.BusinessDataBloc(
          gh<_i11.PdfPickerImpl>(),
          gh<_i17.CardRepo>(),
        ));
    gh.factory<_i27.CardBloc>(() => _i27.CardBloc(gh<_i17.CardRepo>()));
    gh.factory<_i28.ContactsBloc>(() => _i28.ContactsBloc(
          gh<_i7.ContactFetchServiceRepo>(),
          gh<_i21.ContactsRepo>(),
          gh<_i19.ContactLocalRepo>(),
        ));
    gh.factory<_i29.QrBloc>(() => _i29.QrBloc(gh<_i23.QrServiceRepo>()));
    return this;
  }
}

class _$DioModule extends _i30.DioModule {}
