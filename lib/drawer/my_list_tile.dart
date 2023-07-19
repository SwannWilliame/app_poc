import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  void Function()? onTap;

  MyListTile({super.key,
    required this.icon,
    required this.text,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(icon,
        color: Colors.white,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
    );
  }
}