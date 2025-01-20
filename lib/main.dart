import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_application_1/viewModels/navigation_vm.dart';
import 'package:flutter_application_1/viewModels/theme_vm.dart';
import 'package:flutter_application_1/viewModels/to-do_vm.dart';
import 'package:flutter_application_1/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationViewModel()),
        ChangeNotifierProvider(create: (context) => ThemeViewModel()),
        ChangeNotifierProvider(create: (context) => TodoViewModel()),
      ],
      child: Consumer(builder: (context, ThemeViewModel themeVM, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),

          themeMode: themeVM.themeMode, // yo code le ho k pura system ko UI shange garne  shared preferences use garera
          home: const HomeScreen(),
        );
      }),
    );
  }
}
