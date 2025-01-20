import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBarTheme {
  static AppBar appBarStyle(BuildContext context, String titleText) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Theme.of(context).colorScheme.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }

  // for appbar with icons
  static AppBar appBarWithEditIcon(BuildContext context, String titleText,
      bool isIconVisible, VoidCallback onPressed) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Theme.of(context).colorScheme.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      actions: <Widget>[
        if (isIconVisible)
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onPressed,
          ),
      ],
    );
  }
}
