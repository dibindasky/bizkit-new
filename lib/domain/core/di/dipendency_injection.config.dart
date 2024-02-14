// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart'
    as _i19;
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i16;
import 'package:bizkit/application/business_logic/card/card/card_bloc.dart'
    as _i21;
import 'package:bizkit/application/business_logic/card/create/business_data/business_data_bloc.dart'
    as _i20;
import 'package:bizkit/application/business_logic/card/create/user_data/user_data_bloc.dart'
    as _i25;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i24;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i9;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i11;
import 'package:bizkit/data/features/pdf/pdf_picker.dart' as _i15;
import 'package:bizkit/data/service/api_service.dart' as _i3;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i6;
import 'package:bizkit/data/service/card/card_service.dart' as _i8;
import 'package:bizkit/data/service/contact/contact_service.dart' as _i13;
import 'package:bizkit/data/sqflite/contacts/contact_local_service.dart'
    as _i23;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i14;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i18;
import 'package:bizkit/domain/repository/feature/card_scanning_repo.dart'
    as _i26;
import 'package:bizkit/domain/repository/feature/contact_feature_repo.dart'
    as _i10;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i5;
import 'package:bizkit/domain/repository/service/card_repo.dart' as _i7;
import 'package:bizkit/domain/repository/service/contact_repo.dart' as _i12;
import 'package:bizkit/domain/repository/sqflite/contact_local_repo.dart'
    as _i22;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i17;
import 'package:dio/dio.dart' as _i4;
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
    gh.factory<_i3.ApiService>(() => _i3.ApiService(gh<_i4.Dio>()));
    gh.lazySingleton<_i5.AuthRepo>(() => _i6.AuthService());
    gh.lazySingleton<_i7.CardRepo>(() => _i8.CardService());
    gh.lazySingleton<_i9.CardScanningImpl>(() => _i9.CardScanningImpl());
    gh.lazySingleton<_i10.ContactFetchServiceRepo>(
        () => _i11.ContactFetchService());
    gh.lazySingleton<_i12.ContactsRepo>(() => _i13.ContactServiceImpl());
    gh.lazySingleton<_i14.LocalService>(() => _i14.LocalService());
    gh.lazySingleton<_i15.PdfPickerImpl>(() => _i15.PdfPickerImpl());
    gh.factory<_i16.SignUpBloc>(() => _i16.SignUpBloc(gh<_i5.AuthRepo>()));
    gh.lazySingleton<_i17.UserLocalRepo>(
        () => _i18.UserLocalService(gh<_i14.LocalService>()));
    gh.factory<_i19.AuthBloc>(() => _i19.AuthBloc(
          gh<_i5.AuthRepo>(),
          gh<_i17.UserLocalRepo>(),
        ));
    gh.factory<_i20.BusinessDataBloc>(
        () => _i20.BusinessDataBloc(gh<_i15.PdfPickerImpl>()));
    gh.factory<_i21.CardBloc>(() => _i21.CardBloc(gh<_i7.CardRepo>()));
    gh.lazySingleton<_i22.ContactLocalRepo>(
        () => _i23.ContactLocalService(gh<_i14.LocalService>()));
    gh.factory<_i24.ContactsBloc>(() => _i24.ContactsBloc(
          gh<_i10.ContactFetchServiceRepo>(),
          gh<_i12.ContactsRepo>(),
          gh<_i22.ContactLocalRepo>(),
        ));
    gh.factory<_i25.UserDataBloc>(() => _i25.UserDataBloc(
          gh<_i26.CardScanningRepo>(),
          gh<_i17.UserLocalRepo>(),
          gh<_i8.CardService>(),
        ));
    return this;
  }
}
