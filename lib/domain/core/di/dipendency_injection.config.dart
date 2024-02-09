// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart'
    as _i17;
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i11;
import 'package:bizkit/application/business_logic/card/business_data/business_data_bloc.dart'
    as _i14;
import 'package:bizkit/application/business_logic/card/user_data/user_data_bloc.dart'
    as _i16;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i9;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i6;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i8;
import 'package:bizkit/data/features/pdf/pdf_picker.dart' as _i10;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i4;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i15;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i13;
import 'package:bizkit/domain/repository/feature/card_scanning.dart' as _i5;
import 'package:bizkit/domain/repository/feature/contact_repo.dart' as _i7;
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
    gh.lazySingleton<_i5.CardScanningRepo>(() => _i6.CardScanningImpl());
    gh.lazySingleton<_i7.ContactFetchServiceRepo>(
        () => _i8.ContactFetchService());
    gh.factory<_i9.ContactsBloc>(() =>
        _i9.ContactsBloc(contactsService: gh<_i7.ContactFetchServiceRepo>()));
    gh.lazySingleton<_i10.PdfPickerImpl>(() => _i10.PdfPickerImpl());
    gh.factory<_i11.SignUpBloc>(() => _i11.SignUpBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i12.UserLocalRepo>(() => _i13.UserLocalService());
    gh.factory<_i14.BusinessDataBloc>(
        () => _i14.BusinessDataBloc(gh<_i10.PdfPickerImpl>()));
    gh.lazySingleton<_i15.LocalService>(
        () => _i15.LocalService(gh<_i12.UserLocalRepo>()));
    gh.factory<_i16.UserDataBloc>(() => _i16.UserDataBloc(
          gh<_i5.CardScanningRepo>(),
          gh<_i15.LocalService>(),
        ));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i15.LocalService>(),
        ));
    return this;
  }
}
