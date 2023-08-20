import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {
      required this.hintText,
      required this.textFieldIcon,
      this.suffIcon,
      required this.secureText,
      this.controller,
      required this.keyboardType,
      this.validator});
  String hintText;
  Icon textFieldIcon;
  IconButton? suffIcon;
  bool secureText;
  TextEditingController? controller;
  TextInputType keyboardType;
  final bool _validate = false;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: secureText,
      scrollPadding: const EdgeInsets.only(bottom: 40),
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Color(0xff868889),
        fontSize: 15,
      ),
      decoration: InputDecoration(
        prefixIcon: textFieldIcon,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffIcon,
        errorText: _validate ? 'Value Can\'t Be Empty' : null,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
