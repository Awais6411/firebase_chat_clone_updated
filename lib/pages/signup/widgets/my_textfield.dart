import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obs;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.obs = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.only(top: 3, left: 10, right: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.05)),
      child: TextField(
        obscureText: obs,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.black.withOpacity(0.2),
            focusColor: Colors.black.withOpacity(0.2),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.8))),
      ),
    );
  }
}
