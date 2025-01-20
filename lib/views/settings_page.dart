import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/change_theme_style.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ChangeThemeStyle(),
        ],
      ),
    );
  }
}