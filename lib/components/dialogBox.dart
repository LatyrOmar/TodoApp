import 'package:flutter/material.dart';
import 'package:todoapp/components/my_button.dart';

class dialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   dialogBox({
     super.key,
     required this.controller,
     required this.onSave,
     required this.onCancel
   });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(text: "save", onPressed: onSave),
                SizedBox(width: 20.0,),
                MyButton(text: "cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      )
    );
  }
}