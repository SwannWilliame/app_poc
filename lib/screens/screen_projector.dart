import 'package:app_for_poc/drawer/drawer.dart';
import 'package:app_for_poc/reuse_func/navigation.dart';
import 'package:app_for_poc/screens/home.dart';
import 'package:flutter/material.dart';

class ScreenProjector extends StatefulWidget {
  const ScreenProjector({super.key});

  @override
  State<ScreenProjector> createState() => _ScreenProjectorState();
}

class _ScreenProjectorState extends State<ScreenProjector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("POC"),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      drawer: MyDrawer(
        onProfileTap: () => goToProfilePage(context),
        onSignOut: signOut,
        onSettingsTap: () => goToSettingsPage(context),
      ),
      body: Scaffold(
        body: Home(),
      ),
    );
  }
}