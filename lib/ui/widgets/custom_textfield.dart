import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String error;
  final Function onChange;
  final String title;
  final Color color;
  final String value;
  final Function validator;
  final bool isPassword;
  final TextInputType keyboardType;
  const CustomTextField({
    Key key,
    this.controller,
    this.onChange,
    this.title,
    this.color,
    this.value,
    this.error,
    this.validator,
    this.isPassword = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: color,
          ),
        ),
      ),
      child: TextFormField(
        onChanged: onChange,
        obscureText: isPassword ? true : false,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          color: color == Colors.white ? Colors.white : Colors.black,
          fontSize: 22,
        ),
        decoration: InputDecoration(
            // border: InputBorder.none,
            errorText: this.error,
            hintText: this.title,
            labelText: this.title,
            labelStyle: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
