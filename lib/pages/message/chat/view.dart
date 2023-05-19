import 'package:firebase_chat_clone/common/values/colors.dart';
import 'package:firebase_chat_clone/common/values/shadows.dart';
import 'package:firebase_chat_clone/common/widgets/button.dart';
import 'package:firebase_chat_clone/pages/message/chat/controller.dart';
import 'package:firebase_chat_clone/pages/message/chat/widgets/chat_list.dart';
import 'package:firebase_chat_clone/pages/sign_in/index.dart';
import 'package:firebase_chat_clone/pages/welcome/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../videocall/call.dart';

class ChatPage extends GetView<ChatController> {
  ChatPage({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 176, 106, 231),
          Color.fromARGB(255, 166, 112, 231),
          Color.fromARGB(255, 131, 123, 231),
          Color.fromARGB(255, 104, 132, 231),
        ], transform: GradientRotation(90))),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 0.w, bottom: 0.w, left: 0.w, right: 0.w),
        child: Row(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 0.w, bottom: 0.w, left: 0.w, right: 0.w),
              child: InkWell(
                child: SizedBox(
                  width: 44.w,
                  height: 44.w,
                  child: CachedNetworkImage(
                    imageUrl: controller.state.to_avatar.value,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 44.w,
                      width: 44.w,
                      margin: null,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(44.w)),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    errorWidget: (context, url, error) =>
                        Image(image: AssetImage("assets/images/feature-1.png")),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 0.w, bottom: 0.w, left: 0.w, right: 0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 144.w,
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.state.to_name.value,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: "Aviner",
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16.sp),
                          ),
                          Text(
                            "Unknown",
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: "Aviner",
                                fontWeight: FontWeight.normal,
                                color: AppColors.primaryBackground,
                                fontSize: 16.sp),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Gallery"),
              onTap: () {
                controller.imgFromGallery();
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text("Camera"),
              onTap: () {},
            ),
          ],
        ));
      },
    );
  }

  var imagePicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Obx(() => SafeArea(
                child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Stack(children: [
                ChatList(),
                Positioned(
                  bottom: 0.w,
                  height: 50.w,
                  child: Container(
                    width: 360.w,
                    height: 50.h,
                    color: AppColors.primaryBackground,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 217.w,
                            height: 50.h,
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              controller: controller.textController,
                              autofocus: false,
                              focusNode: controller.contentNode,
                              decoration: const InputDecoration(
                                  hintText: "send message..."),
                            ),
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            margin: EdgeInsets.only(left: 5.w),
                            child: GestureDetector(
                              onTap: () {
                                imagePicked = true;
                                _showPicker(context);
                              },
                              child: Icon(
                                Icons.photo_outlined,
                                size: 35.w,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // if (controller.textController.text.isNotEmpty)
                              controller.sendMessage();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10.w, top: 5.h),
                              width: 40.w,
                              height: 40.w,
                              child: Image.asset("assets/icons1/send.png"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("add taped");
                              controller.goMore();
                            },
                            child: Container(
                              height: 40.w,
                              width: 40.w,
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryElement,
                                  borderRadius: BorderRadius.circular(40.w),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(1, 1))
                                  ]),
                              child: Image.asset("assets/icons1/add.png"),
                            ),
                          ),
                        ]),
                  ),
                ),
                controller.state.more_status.value
                    ? Positioned(
                        right: 20.w,
                        bottom: 70.w,
                        height: 200.h,
                        width: 40.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.w),
                                    color: AppColors.primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(1, 1))
                                    ]),
                                child: Image.asset("assets/icons1/file.png"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.w),
                                    color: AppColors.primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(1, 1))
                                    ]),
                                child: Image.asset("assets/icons1/photo.png"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.audioCall();
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.w),
                                    color: AppColors.primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(1, 1))
                                    ]),
                                child: Image.asset("assets/icons1/call.png"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) => CallPage(callID: "12"),
                                // ));

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyCall(callID: "1")));
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.w),
                                    color: AppColors.primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(1, 1))
                                    ]),
                                child: Image.asset("assets/icons1/video.png"),
                              ),
                            ),
                          ],
                        ))
                    : Container()
              ]),
            ))));
  }
}
