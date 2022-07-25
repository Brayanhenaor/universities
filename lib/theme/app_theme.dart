import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universities/theme/text_style.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      labelStyle: AppTextStyles.labelStyle,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(),
      labelPadding: EdgeInsets.symmetric(horizontal: 10),
      unselectedLabelStyle: AppTextStyles.unselectedLabelStyle,
    ),
  );
}
