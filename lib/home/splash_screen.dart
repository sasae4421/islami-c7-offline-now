import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash-screen';

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        settingProvider.isDarkMood()
            ? 'assets/images/splash_screen_dark.png'
            : 'assets/images/splash_screen.png',
      ),
    );
  }
}
