import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  bool? obscureText;
  CustomTextFormField({
    this.hintText,
    this.onChanged,
    this.obscureText = false,
  });
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      obscureText :obscureText!, 
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
