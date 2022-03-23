import 'package:argo/argo.dart';
import 'package:flutter/material.dart';

import 'common_theme_data.dart';

class AppTheme with IThemeDataRule {
  @override
  ThemeData getThemeByRule([ThemeRule rule = ThemeRule.light]) {
    return commonThemeData.copyWith(
      textTheme: TextTheme(
        headline1: headline1.copyWith(fontSize: 28), //OK
        headline2: headline2.copyWith(fontSize: 16), //OK
        headline3: headline3.copyWith(fontSize: 16), //OK
        headline4: headline4.copyWith(fontSize: 20),
        headline5: headline5.copyWith(fontSize: 60),
        subtitle1: subtitle1.copyWith(fontSize: 12),
        subtitle2: subtitle2.copyWith(fontSize: 12),
        button: buttonStyle.copyWith(fontSize: 16),
      ),
    );
  }
}
