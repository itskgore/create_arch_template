import 'dart:convert';
import 'dart:ui';

class AppTheme {
  String? clientName;
  String? termsCondition;
  String? privacyPolicy;
  bool? singleLoginFlow;
  AppColors? colors;
  AppFonts? fonts;
  ApiUrls? apiUrls;
  FeatureFlag? featureFlag;

  AppTheme(
      {this.colors,
      this.fonts,
      this.apiUrls,
      this.featureFlag,
      this.termsCondition,
      this.privacyPolicy,
      this.clientName,
      this.singleLoginFlow});

  fromJson(Map<String, dynamic> json) {
    clientName = json['clientName'] ?? "Wedge";
    privacyPolicy = json['privacyPolicy'] ?? "";
    termsCondition = json['termsCondition'] ?? "";
    singleLoginFlow = json['singleLoginFlow'] ?? true;
    colors = json['colors'] != null ? AppColors.fromJson(json['colors']) : null;
    fonts = json['fonts'] != null ? AppFonts.fromJson(json['fonts']) : null;
    apiUrls =
        json['apiUrls'] != null ? ApiUrls.fromJson(json['apiUrls']) : null;
    featureFlag = json['featureFlag'] != null
        ? FeatureFlag.fromJson(json['featureFlag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (colors != null) {
      data['colors'] = colors!.toJson();
    }
    if (fonts != null) {
      data['fonts'] = fonts!.toJson();
    }
    if (apiUrls != null) {
      data['apiUrls'] = apiUrls!.toJson();
    }
    data['clientName'] = clientName;
    data['termsCondition'] = termsCondition;
    data['privacyPolicy'] = privacyPolicy;
    data['singleLoginFlow'] = singleLoginFlow;
    return data;
  }
}

class ApiUrls {
  CompanyBaseUrl? baseUrl;
  CompanyBaseUrl? webUrls;

  ApiUrls({
    this.baseUrl,
    this.webUrls,
  });

  ApiUrls.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'] != null
        ? CompanyBaseUrl.fromJson(json['baseUrl'])
        : null;
    webUrls = json['webUrls'] != null
        ? CompanyBaseUrl.fromJson(json['webUrls'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (baseUrl != null) {
      data['baseUrl'] = baseUrl!.toJson();
    }

    if (webUrls != null) {
      data['webUrls'] = webUrls!.toJson();
    }

    return data;
  }
}

class AppColors {
  Color? primary;
  Color? bg;
  Color? textLight;
  Color? textDark;
  Color? outline;
  List<Color>? gradient;
  Color? buttonText;
  Color? disableDark;
  Color? disableLight;
  Color? buttonLight;
  Color? disableText;
  List<List>? creditCards;

  AppColors({
    this.primary,
    this.bg,
    this.textLight,
    this.textDark,
    this.gradient,
    this.buttonText,
    this.buttonLight,
    this.outline,
    this.disableDark,
    this.disableLight,
    this.disableText,
    this.creditCards,
  });

  AppColors.fromJson(Map<String, dynamic> json) {
    primary = HexColor(json['primary'] ?? "#103833");
    if (json['gradient'] != null) {
      gradient = <Color>[];
      json['gradient'].forEach((v) {
        gradient!.add(HexColor(v));
      });
    }

    bg = HexColor(json['bg'] ?? "##517FA2");
    buttonLight = HexColor(json['buttonLight'] ?? "#F7F8F0");
    buttonText = HexColor(json['buttonText'] ?? "#ffffff");
    textLight = HexColor(json['textLight'] ?? "#ffffff");
    textDark = HexColor(json['textDark'] ?? "#000000");
    outline = HexColor(
      json['outline'] ?? "#428DFF",
    );
    disableDark = HexColor(json['disableDark'] ?? "#CFCFCF");
    disableLight = HexColor(json['disableLight'] ?? "#EAEBE1");
    disableText = HexColor(json['disableText'] ?? "#CFCFCF");
    if (json['creditCards'] != null) {
      creditCards = <List>[];
      json['creditCards'].forEach((v) {
        creditCards!.add(List.from(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary'] = primary;
    data['bg'] = bg;
    data['textLight'] = textLight;
    data['textDark'] = textDark;
    data['buttonText'] = buttonText;
    data['outline'] = outline;
    data['disableDark'] = disableDark;
    data['disableLight'] = disableLight;
    data['disableText'] = disableText;
    if (creditCards != null) {
      data['creditCards'] = creditCards!.map((v) => v.toList());
    }

    return data;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppFonts {
  String? genericFont;
  Headline? headline;
  AppSubtitle? subtitle;

  AppFonts({this.headline, this.subtitle, this.genericFont});

  AppFonts.fromJson(Map<String, dynamic> json) {
    genericFont = json['genericFont'];
    headline =
        json['headline'] != null ? Headline.fromJson(json['headline']) : null;
    subtitle = json['subtitle'] != null
        ? AppSubtitle.fromJson(json['subtitle'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headline != null) {
      data['headline'] = headline!.toJson();
    }
    if (subtitle != null) {
      data['subtitle'] = subtitle!.toJson();
    }
    data['genericFont'] = genericFont;
    return data;
  }
}

class Headline {
  String? font;
  Sizes? sizes;
  bool? isBold;

  Headline({this.font, this.sizes});

  Headline.fromJson(Map<String, dynamic> json) {
    font = json['font'] ?? "Rubik";
    isBold = json['isBold'] ?? false;
    sizes = json['sizes'] != null ? Sizes.fromJson(json['sizes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['font'] = font;
    data['isBold'] = isBold;
    if (sizes != null) {
      data['sizes'] = sizes!.toJson();
    }
    return data;
  }
}

class AppSubtitle {
  String? font;
  Sizes? sizes;

  AppSubtitle({this.font, this.sizes});

  AppSubtitle.fromJson(Map<String, dynamic> json) {
    font = json['font'] ?? "Roboto";
    sizes = json['sizes'] != null ? Sizes.fromJson(json['sizes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['font'] = font;
    if (sizes != null) {
      data['sizes'] = sizes!.toJson();
    }
    return data;
  }
}

class Sizes {
  double? h1;
  double? h2;
  double? h3;
  double? h4;
  double? h5;
  double? h6;
  double? h7;
  double? h8;
  double? h9;
  double? h10;
  double? h11;
  double? h12;

  Sizes(
      {this.h1,
      this.h2,
      this.h3,
      this.h4,
      this.h5,
      this.h6,
      this.h7,
      this.h8,
      this.h9,
      this.h10,
      this.h11,
      this.h12});

  Sizes.fromJson(Map<String, dynamic> json) {
    h1 = json['h1'] ?? 32.0;
    h2 = json['h2'] ?? 30.0;
    h3 = json['h3'] ?? 28.0;
    h4 = json['h4'] ?? 26.0;
    h5 = json['h5'] ?? 24.0;
    h6 = json['h6'] ?? 22.0;
    h7 = json['h7'] ?? 20.0;
    h8 = json['h8'] ?? 18.0;
    h9 = json['h9'] ?? 16.0;
    h10 = json['h10'] ?? 14.0;
    h11 = json['h11'] ?? 12.0;
    h12 = json['h12'] ?? 10.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['h1'] = h1;
    data['h2'] = h2;
    data['h3'] = h3;
    data['h4'] = h4;
    data['h5'] = h5;
    data['h6'] = h6;
    data['h7'] = h7;
    data['h8'] = h8;
    data['h9'] = h9;
    data['h10'] = h10;
    data['h11'] = h11;
    data['h12'] = h12;
    return data;
  }
}

// ========================
class EndPoints {
  String? fiancialInformationEndpoint;
  String? identitynEndpoint;
  String? notificationEndPoint;
  String? userPreferenceEndpoint;
  String? insightsEndpoint;
  String? documentValtEndPoint;

  EndPoints(
      {this.fiancialInformationEndpoint,
      this.identitynEndpoint,
      this.notificationEndPoint,
      this.userPreferenceEndpoint,
      this.insightsEndpoint,
      this.documentValtEndPoint});

  EndPoints.fromJson(Map<String, dynamic> json) {
    fiancialInformationEndpoint = json['fiancialInformationEndpoint'];
    identitynEndpoint = json['identitynEndpoint'];
    notificationEndPoint = json['notificationEndPoint'];
    userPreferenceEndpoint = json['userPreferenceEndpoint'];
    insightsEndpoint = json['insightsEndpoint'];
    documentValtEndPoint = json['documentValtEndPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fiancialInformationEndpoint'] = fiancialInformationEndpoint;
    data['notificationEndPoint'] = notificationEndPoint;
    data['userPreferenceEndpoint'] = userPreferenceEndpoint;
    data['insightsEndpoint'] = insightsEndpoint;
    data['documentValtEndPoint'] = documentValtEndPoint;
    return data;
  }
}

class FeatureFlag {
  final bool hideFilterIcon;
  final bool hideEditAudio;

  FeatureFlag({
    required this.hideFilterIcon,
    required this.hideEditAudio,
  });

  factory FeatureFlag.fromRawJson(String str) =>
      FeatureFlag.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeatureFlag.fromJson(Map<String, dynamic> json) => FeatureFlag(
        hideEditAudio: json['hideEditAudio'] ?? false,
        hideFilterIcon: json['hideFilterIcon'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "hideEditAudio": hideEditAudio,
        "hideFilterIcon": hideFilterIcon,
      };
}

class Prod {
  final bool enableMixpanel;
  final bool enableUserReferral;

  Prod({
    required this.enableMixpanel,
    required this.enableUserReferral,
  });

  factory Prod.fromRawJson(String str) => Prod.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prod.fromJson(Map<String, dynamic> json) => Prod(
        enableMixpanel: json["enableMixpanel"],
        enableUserReferral: json["enableUserReferral"],
      );

  Map<String, dynamic> toJson() => {
        "enableMixpanel": enableMixpanel,
        "enableUserReferral": enableUserReferral,
      };
}

class CompanyBaseUrl {
  String? prod;
  String? qa;
  String? stage;
  String? mock;

  CompanyBaseUrl({this.prod, this.qa, this.stage, this.mock});

  CompanyBaseUrl.fromJson(Map<String, dynamic> json) {
    prod = json['prod'];
    qa = json['qa'];
    stage = json['stage'];
    mock = json['mock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prod'] = prod;
    data['qa'] = qa;
    data['stage'] = stage;
    data['mock'] = mock;
    return data;
  }
}
