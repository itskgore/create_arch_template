import 'package:patientvisit/core/data_models/app_theme_model.dart';
import 'package:patientvisit/service_registration/dependency_injection.dart';

AppTheme get appTheme => locator<AppTheme>();

AppColors? get appThemeColors => locator<AppTheme>().colors;

String? get appThemeHeadlineFont => locator<AppTheme>().fonts!.headline!.font;

String? get appThemeSubtitleFont => locator<AppTheme>().fonts!.subtitle!.font;

Sizes? get appThemeHeadlineSizes => locator<AppTheme>().fonts!.headline!.sizes;

Sizes? get appThemeSubtitleSizes => locator<AppTheme>().fonts!.subtitle!.sizes;

bool get appThemeHeadlineIsBold =>
    locator<AppTheme>().fonts!.headline!.isBold ?? false;
