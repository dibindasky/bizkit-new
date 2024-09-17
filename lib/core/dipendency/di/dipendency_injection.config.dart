// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // InjectableConfigGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:bizkit/core/dipendency/dio_module/dio_module.dart' as _i49;
// import 'package:bizkit/packages/contacts/contacts_fetch.dart' as _i14;
// import 'package:bizkit/packages/device_info/device_ino.dart' as _i17;
// import 'package:bizkit/packages/location/location_service.dart' as _i21;
// import 'package:bizkit/packages/pdf/pdf_picker.dart' as _i24;
// import 'package:bizkit/service/api_service/api_service.dart' as _i3;
// import 'package:bizkit/service/local_service/sqflite_local_service.dart'
//     as _i20;
// import 'package:dio/dio.dart' as _i18;
// import 'package:get_it/get_it.dart' as _i1;
// import 'package:injectable/injectable.dart' as _i2;

// extension GetItInjectableX on _i1.GetIt {
// // initializes the registration of main-scope dependencies inside of GetIt
//   _i1.GetIt init({
//     String? environment,
//     _i2.EnvironmentFilter? environmentFilter,
//   }) {
//     final gh = _i2.GetItHelper(
//       this,
//       environment,
//       environmentFilter,
//     );
//     final dioModule = _$DioModule();
//     gh.factory<_i3.ApiService>(() => _i3.ApiService());

//     gh.lazySingleton<_i14.ContactFetchService>(
//         () => _i14.ContactFetchService());
//     // gh.lazySingleton<_i15.ContactsRepo>(
//     //     () => _i16.ContactService(gh<_i3.ApiService>()));
//     gh.lazySingleton<_i17.DeviceInformation>(() => _i17.DeviceInformation());
//     gh.lazySingleton<_i18.Dio>(() => dioModule.dioInstance);

//     gh.lazySingleton<_i20.LocalService>(() => _i20.LocalService());
//     gh.lazySingleton<_i21.LocationService>(() => _i21.LocationService());
//     gh.lazySingleton<_i24.PdfPickerImpl>(() => _i24.PdfPickerImpl());
//     // gh.lazySingleton<_i41.ContactLocalRepo>(
//     //     () => _i42.ContactLocalService(gh<_i20.LocalService>()));
//     return this;
//   }
// }

// class _$DioModule extends _i49.DioModule {}
