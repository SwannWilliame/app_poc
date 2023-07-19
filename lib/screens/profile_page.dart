import 'package:app_for_poc/auth.dart';
import 'package:app_for_poc/reuse_func/my_text_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final currentUser = Auth().currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> editField(String field)async{
    String newvalue='';
    await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text("Change $field",
        style: const TextStyle(color: Colors.white),),
        content: TextField(
          autofocus: true,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(
              color: Colors.grey
            ),
          ),
          onChanged: (value){
            newvalue = value;

          },
        ),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),

          //save button
          TextButton(
            onPressed: () => Navigator.of(context).pop(newvalue),
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),

    );

    if (newvalue.trim().length>0){
      await usersCollection.doc(currentUser.email).update({field:newvalue});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 25
          ),
        ),
        centerTitle: true,  
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(currentUser.email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                SizedBox(height: 50,),

                //profile pic
                Icon(Icons.person,
                size: 72,),

                SizedBox(height: 10,),

                //user email
                Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ), 


                SizedBox(height: 50,),


                //user details
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "My details",
                    style: TextStyle(
                      color: Colors.grey[700]
                    ),
                  ),
                ),


                //username
                MyTextBox(
                  text: userData['username'],
                  sectionName: 'username',
                  onPressed: ()=>editField('username'),
                ),

                //bio
                MyTextBox(
                  text: userData['bio'],  
                  sectionName: 'bio',
                  onPressed: () => editField('bio'),
                )
              ],
            );
          } else if(snapshot.hasError){
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
      },)
    );
  }
}
