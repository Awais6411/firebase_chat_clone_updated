import 'package:firebase_chat_clone/pages/message/chat/controller.dart';
import 'package:firebase_chat_clone/pages/message/controller.dart';
import 'package:firebase_chat_clone/pages/sign_in/index.dart';
import 'package:firebase_chat_clone/pages/welcome/controller.dart';
import 'package:get/get.dart';

class MessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
}
