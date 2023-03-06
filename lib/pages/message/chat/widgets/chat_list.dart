import 'package:firebase_chat_clone/common/style/color.dart';
import 'package:firebase_chat_clone/pages/message/chat/index.dart';
import 'package:firebase_chat_clone/pages/message/chat/widgets/chat_left_item.dart';
import 'package:firebase_chat_clone/pages/message/chat/widgets/chat_right_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: AppColors.chatbg,
          padding: EdgeInsets.only(bottom: 50.h),
          child: CustomScrollView(
            reverse: true,
            controller: controller.msgScrolling,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  var item = controller.state.msgcontentList[index];
                  if (controller.user_id == item.uid) {
                    return chatRightItem(item);
                  }
                  return chatLeftItem(item);
                }, childCount: controller.state.msgcontentList.length)),
              )
            ],
          ),
        ));
  }
}
