// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart'
    as _i1029;
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart'
    as _i253;
import 'package:bizkit/module/task/data/sqfilte/chat/task_chat_local_service.dart'
    as _i578;
import 'package:bizkit/module/task/domain/repository/sqfilte/chat/task_chat_local_service_repo.dart'
    as _i209;
import 'package:bizkit/packages/path_provider/path_provider.dart' as _i1008;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i1008.PathProvider>(() => _i1008.PathProvider());
    gh.lazySingleton<_i209.TaskChatLocalServiceRepo>(
        () => _i578.TaskChatLocalService());
    gh.lazySingleton<_i253.ConnectionsRepo>(() => _i1029.ConnectionsService());
    return this;
  }
}
