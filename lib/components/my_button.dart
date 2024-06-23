import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final String text;
  VoidCallback onPressed;

   MyButton({
     super.key,
     required this.text,
     required this.onPressed
   });

  @override
  Widget build(BuildContext contex){

    return MaterialButton(
      onPressed: onPressed ,
      color: Colors.purple[300],
      child: Text(text),

    );
  }

}