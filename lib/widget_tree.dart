import 'package:app_for_poc/screens/auth_pages/signin.dart';
import 'package:app_for_poc/screens/screen_projector.dart';
import 'package:flutter/material.dart';
import 'package:app_for_poc/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ScreenProjector();
        }
        else{
          return const SignIn();
        }
      },
    );
  }
}