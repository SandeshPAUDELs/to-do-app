import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewModels/theme_vm.dart';
import 'package:provider/provider.dart';

class ChangeThemeStyle extends StatelessWidget {
  const ChangeThemeStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final themeVM = Provider.of<ThemeViewModel>(context);

    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                radius: 20,
                child: Icon(
                  themeVM.isDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
              ),
              SizedBox(width: height * 0.01),
              SizedBox(
                width: width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Change Theme',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            )),
                    Text(
                      'Change Appearance of app',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Switch(
            value: themeVM.isDarkTheme,
            onChanged: (_) => themeVM.toggleTheme(),
          ),
        ],
      ),
    );
  }
}
