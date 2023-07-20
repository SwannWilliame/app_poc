import 'package:app_for_poc/drawer/drawer.dart';
import 'package:app_for_poc/reuse_func/navigation.dart';
import 'package:app_for_poc/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_for_poc/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final User? user = Auth().currentUser;
  Map<String, dynamic>? userInfos={};

  Future<Map<String, dynamic>?> getUserInfo(User? user)async{
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(user!.uid.toString()).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      return data;
    }
  }

  Map<String, dynamic>? translateInfo(User? user){
    getUserInfo(user).then((value) {
      setState(() {
        userInfos=value;
      });
    });
    return userInfos;
  }

  String _userId(){
    return user?.email ?? 'User email';
  }

  Widget infoText(info, data){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Text(
        '$info : $data',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            "Home Page",
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      )
    );
  }
}