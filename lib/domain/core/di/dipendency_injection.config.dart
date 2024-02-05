// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/Auth/auth_bloc.dart' as _i14;
import 'package:bizkit/application/business_logic/card_creation/card_screation_bloc.dart'
    as _i7;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i10;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i6;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i9;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i4;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i13;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i12;
import 'package:bizkit/domain/repository/feature/card_scanning.dart' as _i5;
import 'package:bizkit/domain/repository/feature/contact_repo.dart' as _i8;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i3;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i11;
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
    gh.lazySingleton<_i5.CardScanningDataFetchingRepo>(
        () => _i6.CardScanningDataFetching());
    gh.factory<_i7.CardScreationBloc>(() => _i7.CardScreationBloc(
        cardScanningDataFetchingRepo: gh<_i5.CardScanningDataFetchingRepo>()));
    gh.lazySingleton<_i8.ContactFetchServiceRepo>(
        () => _i9.ContactFetchService());
    gh.factory<_i10.ContactsBloc>(() =>
        _i10.ContactsBloc(contactsService: gh<_i8.ContactFetchServiceRepo>()));
    gh.lazySingleton<_i11.UserLocalRepo>(() => _i12.UserLocalService());
    gh.lazySingleton<_i13.LocalService>(
        () => _i13.LocalService(gh<_i11.UserLocalRepo>()));
    gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i13.LocalService>(),
        ));
    return this;
  }
}
