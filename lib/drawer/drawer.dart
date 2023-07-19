import 'package:app_for_poc/drawer/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  final void Function()? onSettingsTap;

  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
    required this.onSettingsTap,
    });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          const DrawerHeader(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "MENU",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            )
            ),
          
        MyListTile(icon: Icons.home, text: 'HOME', onTap: ()=>Navigator.pop(context)),
    
        MyListTile(icon: Icons.person, text: "PROFILE", onTap: onProfileTap),

        MyListTile(icon: Icons.settings, text: "SETTINGS", onTap: onSettingsTap),

        const Spacer(),

        MyListTile(icon: Icons.logout, text: "LOGOUT", onTap: onSignOut),
        SizedBox(height: 30,)

        ],
      ),
    );
  }
}