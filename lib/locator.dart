import 'package:get_it/get_it.dart';
import 'package:web_app/services/api.dart';
import 'package:web_app/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
}