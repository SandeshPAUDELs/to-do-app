import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewModels/navigation_vm.dart';
import 'package:flutter_application_1/views/settings_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navVm = Provider.of<NavigationViewModel>(context);
    // Function to get the current screen
    Widget getCurrentScreen(int index) {
      switch (index) {
        case 0:
          return const Placeholder();
        case 1:
          return const Settings();
        

        default:
          return const Placeholder();
      }
    }
    return Scaffold(
      body: getCurrentScreen(navVm.currentHomeIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navVm.currentHomeIndex,
        onDestinationSelected: (index) {
          navVm.changeHomeIndex(index);
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'ToDOScreen',
            tooltip: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
            tooltip: '',
          ),
          
        ],
      ),
    );
  }
}