import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint ;
  final int maxLine ;
  final TextInputType keyboardType ;
  final TextEditingController controller ;

   TextInput({super.key, required this.hint,  this.maxLine = 1,  this.keyboardType = TextInputType.text,  required this.controller });

  final border = OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xffefefef))) ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLine,
      keyboardType: keyboardType,
      style: TextStyle(color: Color(0xffefefef)),
      decoration: InputDecoration(

          border: border,
          enabledBorder: border,
          focusedBorder: border,

          hintStyle: TextStyle(color: Color(0xffdfdfdf)),
          hintText:hint),
    );
  }
}
