// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/auth/login/auth_bloc.dart'
    as _i18;
import 'package:bizkit/application/business_logic/auth/signup/sign_up_bloc.dart'
    as _i12;
import 'package:bizkit/application/business_logic/card/business_data/business_data_bloc.dart'
    as _i15;
import 'package:bizkit/application/business_logic/card/user_data/user_data_bloc.dart'
    as _i17;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i10;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i6;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i9;
import 'package:bizkit/data/features/pdf/pdf_picker.dart' as _i11;
import 'package:bizkit/data/service/auth/auth_service.dart' as _i4;
import 'package:bizkit/data/service/card/card_api.dart' as _i7;
import 'package:bizkit/data/sqflite/sqflite_local_service.dart' as _i16;
import 'package:bizkit/data/sqflite/users/user_local_service.dart' as _i14;
import 'package:bizkit/domain/repository/feature/card_scanning.dart' as _i5;
import 'package:bizkit/domain/repository/feature/contact_repo.dart' as _i8;
import 'package:bizkit/domain/repository/service/auth_repo.dart' as _i3;
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart' as _i13;
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
    gh.factory<_i7.CardService>(() => _i7.CardService());
    gh.lazySingleton<_i8.ContactFetchServiceRepo>(
        () => _i9.ContactFetchService());
    gh.factory<_i10.ContactsBloc>(() =>
        _i10.ContactsBloc(contactsService: gh<_i8.ContactFetchServiceRepo>()));
    gh.lazySingleton<_i11.PdfPickerImpl>(() => _i11.PdfPickerImpl());
    gh.factory<_i12.SignUpBloc>(() => _i12.SignUpBloc(gh<_i3.AuthRepo>()));
    gh.lazySingleton<_i13.UserLocalRepo>(() => _i14.UserLocalService());
    gh.factory<_i15.BusinessDataBloc>(
        () => _i15.BusinessDataBloc(gh<_i11.PdfPickerImpl>()));
    gh.lazySingleton<_i16.LocalService>(
        () => _i16.LocalService(gh<_i13.UserLocalRepo>()));
    gh.factory<_i17.UserDataBloc>(() => _i17.UserDataBloc(
          gh<_i5.CardScanningRepo>(),
          gh<_i16.LocalService>(),
          gh<_i7.CardService>(),
        ));
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
          gh<_i3.AuthRepo>(),
          gh<_i16.LocalService>(),
        ));
    return this;
  }
}
