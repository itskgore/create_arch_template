import 'package:patientvisit/core/data_models/app_theme_model.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';

String _baseUrl = "";
String _authBaseUrl = "";
String _webBaseUrl = "";
String _env = "";

//Environment
void setUpEnvironment(AppEnviroment env) {
  env.setEnvironment();
}

String get apiBaseUrl => _baseUrl;

String get webBaseUrl => _webBaseUrl;

String get authBaseUrl => _authBaseUrl;

String get env => _env;

abstract class AppEnviroment {
  setEnvironment();
}

class MockEnviroment extends AppEnviroment {
  @override
  setEnvironment() {
    _baseUrl = locator<AppTheme>().apiUrls!.baseUrl!.mock!;
    _webBaseUrl = locator<AppTheme>().apiUrls!.webUrls!.mock!;
    _env = "-mock";
  }
}

class StageEnviroment extends AppEnviroment {
  @override
  setEnvironment() {
    _baseUrl = locator<AppTheme>().apiUrls!.baseUrl!.stage!;
    _webBaseUrl = locator<AppTheme>().apiUrls!.webUrls!.stage!;
    _env = "-stage";
  }
}

class QAEnviroment extends AppEnviroment {
  @override
  setEnvironment() {
    _baseUrl = locator<AppTheme>().apiUrls!.baseUrl!.qa!;
    _webBaseUrl = locator<AppTheme>().apiUrls!.webUrls!.qa!;
    _env = "-qa";
  }
}

class ProdEnviroment extends AppEnviroment {
  @override
  setEnvironment() {
    _baseUrl = locator<AppTheme>().apiUrls!.baseUrl!.prod!;
    _webBaseUrl = locator<AppTheme>().apiUrls!.webUrls!.prod!;
    _env = "";
  }
}
