import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFFF0995C);
  static const secondaryColor = Color(0xFF4B60BC);

  ThemeData applicationDefaultTheme(BuildContext context) {
    var originalTheme = ThemeData.light();
    return ThemeData(
        primaryColor: primaryColor,
        secondaryHeaderColor: secondaryColor,
        appBarTheme: originalTheme.appBarTheme.copyWith(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: originalTheme.iconTheme.copyWith(color: primaryColor),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800)),
        bottomNavigationBarTheme: originalTheme.bottomNavigationBarTheme
            .copyWith(
                showUnselectedLabels: true,
                selectedItemColor: primaryColor,
                unselectedItemColor: Colors.grey),
        floatingActionButtonTheme: originalTheme.floatingActionButtonTheme
            .copyWith(backgroundColor: primaryColor),
        progressIndicatorTheme: originalTheme.progressIndicatorTheme
            .copyWith(color: primaryColor, linearTrackColor: Colors.white),
        tabBarTheme: originalTheme.tabBarTheme.copyWith(
          labelColor: primaryColor,
        ));
  }
}
