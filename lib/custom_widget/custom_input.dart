import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData? suffixIcon;
  final Widget? suffix;
  final String? hintText;
  final String? labelText;
  final void Function(String)? onChanged;
  final bool? showValue;
  // final String? hintText;
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.onChanged,
      this.showValue,
      this.suffix,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Colors.white,
      obscureText: showValue ?? false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          suffix: suffix,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          hintText: hintText,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusColor: Colors.white),
    );
  }
}
