import 'package:app_for_poc/auth.dart';
import 'package:app_for_poc/screens/home.dart';
import 'package:app_for_poc/screens/profile_page.dart';
import 'package:app_for_poc/screens/settings.dart';
import 'package:flutter/material.dart';

Future<void> signOut()async{
    await Auth().signOut();
  }

  void goToProfilePage(context){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  void goToHomePage(context){
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
  }

  void goToSettingsPage(context){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }