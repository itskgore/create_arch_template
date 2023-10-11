// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:patientvisit/core/data_models/app_theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register_bloc.dart';
import 'register_data_sources.dart';
import 'register_repositories.dart';
import 'register_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setupServicesLocator() async {
  /// register all the call flow with the service locator
  /// bloc => usecase => repository => datasource
  RegisterBlocs();
  RegisterUseCases();
  RegisterRepository();
  RegisterDataSources();

  //external
  final sharedPreferencesInstance = SharedPreferences.getInstance();
  final SharedPreferences sharedPreferences = await sharedPreferencesInstance;
  locator.registerLazySingleton(() => sharedPreferences);

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  locator.registerLazySingleton(() => packageInfo);

  AppTheme appTheme = AppTheme();
  locator.registerLazySingleton(() => appTheme);
}
