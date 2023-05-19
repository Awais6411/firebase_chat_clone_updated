import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/values/colors.dart';
import 'controller.dart';

class VoiceCallPage extends GetView<VoiceCallController> {
  const VoiceCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary_bg,
      body: SafeArea(
        child: Obx(() => Container(
              child: Stack(
                children: [
                  Positioned(
                      top: 10.h,
                      left: 30.h,
                      right: 30.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${controller.state.callTime.value}",
                            style: TextStyle(
                                color: AppColors.primaryElementText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal),
                          ),
                          Container(
                            width: 70.h,
                            height: 70.h,
                            child: Image.network(
                                "${controller.state.to_avatar.value}"),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 5.h),
                              child: Text(
                                controller.state.to_name.value,
                                style: TextStyle(
                                    color: AppColors.primaryElementText,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.normal),
                              ))
                        ],
                      )),
                  Positioned(
                      bottom: 80.h,
                      left: 30.h,
                      right: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //microphone section
                          Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                    padding: EdgeInsets.all(15.w),
                                    width: 60.w,
                                    height: 60.w,
                                    decoration: BoxDecoration(
                                        color: controller
                                                .state.openMicrophone.value
                                            ? AppColors.primaryElementText
                                            : AppColors.primaryText,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.w))),
                                    child: controller.state.openMicrophone.value
                                        ? Image.asset(
                                            "assets/icons1/b_microphone.png")
                                        : Image.asset(
                                            "assets/icons1/a_microphone.png")),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  "Microphone",
                                  style: TextStyle(
                                      color: AppColors.primaryElementText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: controller.state.isJoined.value
                                    ? controller.leaveChannel
                                    : controller.joinChannel,
                                child: Container(
                                    padding: EdgeInsets.all(15.w),
                                    width: 60.w,
                                    height: 60.w,
                                    decoration: BoxDecoration(
                                        color: controller.state.isJoined.value
                                            ? AppColors.primaryElementBg
                                            : AppColors.primaryElementStatus,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.w))),
                                    child: controller.state.isJoined.value
                                        ? Image.asset(
                                            "assets/icons1/a_phone.png")
                                        : Image.asset(
                                            "assets/icons1/a_telephone.png")),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  controller.state.isJoined.value
                                      ? "Disconnect"
                                      : "Connect",
                                  style: TextStyle(
                                      color: AppColors.primaryElementText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                    padding: EdgeInsets.all(15.w),
                                    width: 60.w,
                                    height: 60.w,
                                    decoration: BoxDecoration(
                                        color:
                                            controller.state.enableSpeaker.value
                                                ? AppColors.primaryElementText
                                                : AppColors.primaryText,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.w))),
                                    child: controller.state.enableSpeaker.value
                                        ? Image.asset(
                                            "assets/icons1/b_trumpet.png")
                                        : Image.asset(
                                            "assets/icons1/a_trumpet.png")),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  "Speaker",
                                  style: TextStyle(
                                      color: AppColors.primaryElementText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
