import 'package:app_for_poc/drawer/drawer.dart';
import 'package:app_for_poc/reuse_func/navigation.dart';
import 'package:app_for_poc/screens/browse.dart';
import 'package:app_for_poc/screens/connect.dart';
import 'package:app_for_poc/screens/home.dart';
import 'package:app_for_poc/screens/notifications.dart';
import 'package:flutter/material.dart';

class ScreenProjector extends StatefulWidget {
  const ScreenProjector({super.key});

  @override
  State<ScreenProjector> createState() => _ScreenProjectorState();
}

class _ScreenProjectorState extends State<ScreenProjector> {

  int index=0;
  final screens=[
    Home(),
    Browse(),
    Connect(),
    Notifications()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("My App"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      drawer: MyDrawer(
        onProfileTap: () => goToProfilePage(context),
        onSignOut: signOut,
        onSettingsTap: () => goToSettingsPage(context),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
          )
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          backgroundColor: Color(0xFFf1f5fb),
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index=value;
            });
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(
                Icons.home_outlined
              ), 
              selectedIcon:  Icon(
                Icons.home,
                color: Colors.blue.shade900,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: const Icon(
                Icons.search_outlined
              ), 
              selectedIcon: Icon(
                Icons.search,
                color: Colors.blue.shade900,
              ),
              label: 'Browse',
            ),
            NavigationDestination(
              icon: const Icon(
                Icons.chat_bubble_outline
              ), 
              selectedIcon: Icon(
                Icons.chat_bubble,
                color: Colors.blue.shade900,
              ),
              label: 'Connect',
            ),
            NavigationDestination(
              icon: const Icon(
                Icons.notifications_outlined
              ),
              selectedIcon: Icon(Icons.notifications,
                color: Colors.blue.shade900,),
              label: 'Notifications',
            ),
          ],
        ),
      ),
      body: Scaffold(
        body: screens[index],
      ),
    );
  }
}