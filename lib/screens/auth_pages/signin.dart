import 'package:app_for_poc/auth.dart';
import 'package:app_for_poc/screens/auth_pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_for_poc/reuse_func/reuse_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String errorMessage='';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async{
    try {
      await Auth().signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    }on FirebaseAuthException catch (e){
      setState(() {
        errorMessage=e.message.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Connect", style: TextStyle(
              fontSize: 50, 
              color: Colors.grey[900],
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 30,),
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
              onPressed: (){
                signInWithEmailAndPassword();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Padding(
                padding: EdgeInsets.all(17.0),
                child: Text("Sign In",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  )),
              )),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "No account yet ?",
                    style: TextStyle(
                      fontSize: 15,
                    ),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                    },
                    child: const Text(
                      "Register.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              )        
          ],
        ),
      ),
    );
  }
}