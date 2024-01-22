// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/application/business_logic/card_creation/card_screation_bloc.dart'
    as _i5;
import 'package:bizkit/application/business_logic/contacts/contacts_bloc.dart'
    as _i8;
import 'package:bizkit/data/features/cards_scanning/card_scanning_data_fetching.dart'
    as _i4;
import 'package:bizkit/data/features/contacts/contacts_fetch.dart' as _i7;
import 'package:bizkit/domain/repository/card_scanning.dart' as _i3;
import 'package:bizkit/domain/repository/feature/contact_repo.dart' as _i6;
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
    gh.lazySingleton<_i3.CardScanningDataFetchingRepo>(
        () => _i4.CardScanningDataFetching());
    gh.factory<_i5.CardScreationBloc>(() => _i5.CardScreationBloc(
        cardScanningDataFetchingRepo: gh<_i3.CardScanningDataFetchingRepo>()));
    gh.lazySingleton<_i6.ContactFetchServiceRepo>(
        () => _i7.ContactFetchService());
    gh.factory<_i8.ContactsBloc>(() =>
        _i8.ContactsBloc(contactsService: gh<_i6.ContactFetchServiceRepo>()));
    return this;
  }
}
