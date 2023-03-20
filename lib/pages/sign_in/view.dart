import 'package:firebase_chat_clone/common/values/colors.dart';
import 'package:firebase_chat_clone/common/values/shadows.dart';
import 'package:firebase_chat_clone/common/widgets/button.dart';
import 'package:firebase_chat_clone/pages/sign_in/index.dart';
import 'package:firebase_chat_clone/pages/signup/sign_in.dart';
import 'package:firebase_chat_clone/pages/welcome/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../signup/sign_up_screen.dart';
import '../signup/widgets/my_rich_text.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  Widget _buildLogo() {
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(top: 84.h),
      child: Column(
        children: [
          Container(
            width: 76.w,
            height: 76.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 76.w,
                  decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [Shadows.primaryShadow],
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                )),
                Positioned(
                    child: Image.asset(
                  "assets/images/ic_launcher.png",
                  width: 76.w,
                  height: 76.w,
                  fit: BoxFit.cover,
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
            child: Text(
              "Chat Clone.io",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.thirdElement,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: 1),
            ),
          )
        ],
      ),
    );
  }
/*
  Widget _buildThirdPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsetsDirectional.only(bottom: 280.h),
      child: Column(
        children: [
          Text(
            "Signin with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w),
            child: btnFlatButtonWidget(
                onPressed: () {
                  controller.handlSignIn();
                },
                width: 200.w,
                height: 55.h,
                title: "Google Login"),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const SignIn(),
                  transition: Transition.rightToLeftWithFade,
                  duration: Duration(milliseconds: 500));
            },
            child: const MyRichText(
                title: "Already have an account ? ", subTitle: "Sign in"),
          ),
        ],
      ),
    );
  }
*/

/*
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        "Chat Clone .",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 34.sp),
      ),
    );
  }
*/
  Widget _buildThirdPartyLogin(String loginType, String logo) {
    return GestureDetector(
      onTap: () {
        print("sign in with $loginType");
        controller.handlSignIn();
      },
      child: Container(
        width: 295.w,
        height: 47.h,
        padding: EdgeInsets.all(5.h),
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1)),
          ],
        ),
        child: Row(
          mainAxisAlignment:
          logo == "" ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            logo == ""
                ? Container()
                : Container(
              padding: EdgeInsets.only(left: 40.w, right: 30.w),
              child: Image.asset("assets/icons/$logo"),
            ),
            Container(
              child: Text(
                "Sign in with $loginType",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrWidget() {
    return Container(
      margin: EdgeInsets.only(top: 29.h, bottom: 35.h),
      child: Row(
        children: [
          Expanded(
              child: Divider(
                indent: 50,
                height: 2.h,
                color: AppColors.primarySecondaryElementText,
              )),
          const Text(" or "),
          Expanded(
              child: Divider(
                endIndent: 50,
                height: 2.h,
                color: AppColors.primarySecondaryElementText,
              ))
        ],
      ),
    );
  }

  Widget _buildSignUpWidget() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const SignIn(),
            transition: Transition.rightToLeftWithFade,
            duration: Duration(milliseconds: 500));
      },
      child: const MyRichText(
          title: "Already have an account ? ", subTitle: "Sign in"),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
         // Spacer(),
          _buildLogo(),
          _buildThirdPartyLogin("Google", "google.png"),
          _buildThirdPartyLogin("FaceBook", "facebook.png"),
          _buildThirdPartyLogin("Apple", "apple.png"),
          _buildOrWidget(),
          _buildThirdPartyLogin("phone number", ""),
          SizedBox(
            height: 35.h,
          ),
          _buildSignUpWidget()
        ],
      ),
    ));
  }
}
