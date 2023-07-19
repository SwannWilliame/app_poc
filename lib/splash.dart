import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic showHome = prefs.getBool('showHome') ?? false;
    await Future.delayed(Duration(seconds: 2));

    if (showHome){
      Navigator.pushReplacementNamed(context, '/tree');
    }else{
      Navigator.pushReplacementNamed(context, '/tuto');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          child: Lottie.asset('assets/lottie/loading.json'),
        ),
      )
    );
  }
}