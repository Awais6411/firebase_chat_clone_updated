import 'package:firebase_chat_clone/common/values/colors.dart';
import 'package:firebase_chat_clone/common/values/shadows.dart';
import 'package:firebase_chat_clone/common/widgets/app.dart';
import 'package:firebase_chat_clone/common/widgets/button.dart';
import 'package:firebase_chat_clone/pages/contact/controller.dart';
import 'package:firebase_chat_clone/pages/contact/widgets/contact_list.dart';
import 'package:firebase_chat_clone/pages/message/voicemessage/tasks/tips2/userList.dart';
import 'package:firebase_chat_clone/pages/sign_in/index.dart';
import 'package:firebase_chat_clone/pages/welcome/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Text(
      "Contact",
      style: TextStyle(
          color: AppColors.primaryBackground,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(), body: UserList(tips: "4") //ContactList(),
        );
  }
}
