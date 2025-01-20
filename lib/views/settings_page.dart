import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/app_bar.dart';
import 'package:flutter_application_1/styles/change_theme_style.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTheme.appBarStyle(context, 'Settings'),
      body: Column(
        children: [
          ChangeThemeStyle(),
        ],
      ),
    );
  }
}
