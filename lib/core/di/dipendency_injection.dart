import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:bizkit/core/di/dipendency_injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configuteInjection() async {
  getIt.init(environment: Environment.prod);
}
