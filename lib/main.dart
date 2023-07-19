import 'package:app_for_poc/screens/home.dart';
import 'package:app_for_poc/screens/onboarding_page.dart';
import 'package:app_for_poc/splash.dart';
import 'package:app_for_poc/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => const Splash(),
      '/tuto':(context) => const OnBoardingPage(),
      '/tree':(context)=>const WidgetTree(),
      '/home':(context)=> Home(),
    },
  ));
}