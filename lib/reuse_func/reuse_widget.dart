import 'package:flutter/material.dart';

Widget entryField({
  required String title,
  required TextEditingController controller,
  bool isPassword=false,
  }){

    //var
    FocusNode myfocus = FocusNode(); 

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: TextFormField(
          obscureText: isPassword,
          focusNode: myfocus,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          controller: controller,
          decoration: InputDecoration(            
            hintText: title,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 3, color: Colors.grey)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            )
          ),
          onTapOutside: (PointerDownEvent){
            myfocus.unfocus();
          },
        ),
      ),
    );
}

