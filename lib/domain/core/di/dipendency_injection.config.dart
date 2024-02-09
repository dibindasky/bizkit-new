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
    as _i11;
import 'package:bizkit/application/business_logic/card/business_data/business_data_bloc.dart'
    as _i5;
import 'package:bizkit/application/business_logic/card/user_data/user_data_bloc.dart'
    as _i15;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i10;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i7;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i9;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i4;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i14;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i13;
import 'package:bizkit/domain/repository/feature/card_scanning.dart' as _i6;
import 'package:bizkit/domain/repository/feature/contact_repo.dart' as _i8;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i3;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i12;
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
    gh.lazySingleton<_i3.AuthRepo>(() => _i4.AuthService());
    gh.factory<_i5.BusinessDataBloc>(() => _i5.BusinessDataBloc());
    gh.lazySingleton<_i6.CardScanningRepo>(() => _i7.CardScanningImpl());
    gh.lazySingleton<_i8.ContactFetchServiceRepo>(
        () => _i9.ContactFetchService());
    gh.factory<_i10.ContactsBloc>(() =>
        _i10.ContactsBloc(contactsService: gh<_i8.ContactFetchServiceRepo>()));
    gh.factory<_i11.SignUpBloc>(() => _i11.SignUpBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i12.UserLocalRepo>(() => _i13.UserLocalService());
    gh.lazySingleton<_i14.LocalService>(
        () => _i14.LocalService(gh<_i12.UserLocalRepo>()));
    gh.factory<_i15.UserDataBloc>(() => _i15.UserDataBloc(
          gh<_i6.CardScanningRepo>(),
          gh<_i14.LocalService>(),
        ));
    gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i14.LocalService>(),
        ));
    return this;
  }
}
