import 'package:app_for_poc/auth.dart';
import 'package:app_for_poc/reuse_func/reuse_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final users = FirebaseFirestore.instance.collection('users');

  String errorMessage='';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async{
    try{
      if (_usernameController.text.length>4 && _usernameController.text.length<20){
        //create user
        await Auth().createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
        
        //add values to database
        await users.doc(Auth().currentUser!.email).set({
          'username':_usernameController.text,
          'uid':Auth().currentUser!.uid,
          'bio': 'Empty bio...',
        })
        .then((value) => print("User Added"))
        .catchError((error)=>print("Failed to add user : $error"));
      }else{
        setState(() {
          errorMessage='Username must be between 4-20 characters';
        });
      }
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage=e.message.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0,
        ),
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Register", style: TextStyle(
                fontSize: 50, 
                color: Colors.grey[900],
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 30,),
              entryField(title: 'Username', controller: _usernameController),
              const SizedBox(height: 15),
              entryField(title: 'Email', controller: _emailController),
              const SizedBox(height: 15),
              entryField(title: 'Password', controller: _passwordController, isPassword: true),
              const SizedBox(height: 40,),
              Visibility(
              visible: errorMessage.isNotEmpty,
              child: Column(
                children: [
                  Text(
                    errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15
                    ),
                    ),
                    const SizedBox(height: 20,),
                ],
              ),
            ),
              ElevatedButton(
                onPressed: ()async {
                  await createUserWithEmailAndPassword();
                  FirebaseAuth.instance
                  .authStateChanges()
                  .listen((User? user) {
                    if (user != null) {
                      Navigator.pop(context);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Text("Sign Up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    )),
                )),        
            ],
          ),
        ),
      ),
    );
  }
}