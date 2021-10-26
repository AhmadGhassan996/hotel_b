import 'package:flutter/material.dart';
class TextFieldd extends StatelessWidget {
  final String hintText;

  final TextEditingController text;

   TextFieldd({required this.hintText,required this.text }) ;
String text1='';
void onChanged(){

}
  @override
  Widget build(BuildContext context) {
    return TextField(
controller: text,
      decoration: InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(32),),

        ),
        hintText: this.hintText,
      ),
    );
  }
}
