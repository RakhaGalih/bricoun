// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bricoun/constant/constant.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  const MyTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        focusColor: kBlue,
        labelText: widget.label,
        focusedBorder: inputBorder(kBlue),
        border: inputBorder(kGrey),
        errorBorder: inputBorder(Colors.red),
        focusedErrorBorder: inputBorder(Colors.red),
        suffixIcon: widget.isPassword
            ? IconButton(
                splashRadius: 30,
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: _isObscure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,
      ),
    );
  }
}

OutlineInputBorder inputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color, width: 2),
  );
}
