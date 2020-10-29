import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Color color;
  final String value;
  final Function validator;
  final bool isPassword;
  final TextInputType keyboardType;
  const CustomTextArea({
    Key key,
    this.controller,
    this.title,
    this.color,
    this.value,
    this.validator,
    this.isPassword = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          color: color == Colors.white ? Colors.white : Colors.black,
          fontSize: 22,
        ),
        maxLines: 5,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
