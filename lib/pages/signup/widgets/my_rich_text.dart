import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MyRichText extends StatelessWidget {
  final String title, subTitle;
  const MyRichText({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(
              text: title,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
              children: [
            TextSpan(
              text: subTitle,
              style: TextStyle(
                  color: Color.fromARGB(255, 195, 195, 25).withOpacity(0.9),
                  fontSize: 20),
            )
          ])),
    );
  }
}
