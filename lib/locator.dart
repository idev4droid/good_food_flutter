import 'package:get_it/get_it.dart';
import 'package:good_food/core/api/dinner/dinnerApi.dart';
import 'package:good_food/core/viewmodel/dinnerViewModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DinnerApi());

  locator.registerFactory(() => DinnerViewModel());
}