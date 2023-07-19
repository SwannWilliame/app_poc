import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {

  bool light=false;

  Widget tile({
    required IconData icon,
    required String text,
    required Color iconColor
  }){
    return GestureDetector(
      onTap: (){
        print('clicked');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 25,
            ),
            SizedBox(width: 10,),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[700],
              size: 18,
              )
          ],
        ),
      ),
    );
  }

Widget enableTile({
    required IconData icon,
    required String text,
    required Color iconColor
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 25,
          ),
          const SizedBox(width: 10,),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Switch(
          value: light,
          inactiveThumbColor: Colors.white38,
          activeColor: Colors.blueGrey.shade900,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              light = value;
            });
          },
        )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 25),
          ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  tile(
                    icon: Icons.lock,
                    text: 'Change Password',
                    iconColor: Colors.red
                  ),
                  const Divider(
                    indent: 45,
                    color: Colors.black,
                  ),
                  tile(
                    icon: Icons.accessibility,
                    text: 'Accessibility',
                    iconColor: Colors.lightBlue
                  ),
                  const Divider(
                    indent: 45,
                    color: Colors.black,
                  ),
                  tile(
                    icon: Icons.notifications,
                    text: 'Notifications',
                    iconColor: Colors.yellow.shade700
                  ),
                  SizedBox(height: 8,)
                ],
              ),
            ),
            SizedBox(height: 30,),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  enableTile(
                    icon: Icons.dark_mode,
                    text: 'Dark Mode',
                    iconColor: Colors.blueGrey.shade900
                  ),
                  SizedBox(height: 8,)
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}