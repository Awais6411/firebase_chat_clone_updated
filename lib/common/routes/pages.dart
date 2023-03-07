import 'package:firebase_chat_clone/pages/profile/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../pages/message/chat/index.dart';
import '../../pages/contact/index.dart';
import '../../pages/message/photoview/index.dart';
import '../../pages/sign_in/index.dart';
import '../../pages/welcome/index.dart';
import '../../pages/application/index.dart';
import '../middlewares/router_auth.dart';
import '../middlewares/router_welcome.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),

    // check if needed to login or not
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      // middlewares: [
      //   RouteAuthMiddleware(priority: 1),
      // ],
    ),

    // 最新路由
    // 首页
    GetPage(
        name: AppRoutes.Contact,
        page: () => ContactPage(),
        binding: ContactBinding()),
/*    //消息
    GetPage(name: AppRoutes.Message, page: () => MessagePage(), binding: MessageBinding()),
    */
    GetPage(
        name: AppRoutes.Me,
        page: () => ProfilePage(),
        binding: ProfileBinding()),

    GetPage(
        name: AppRoutes.Chat, page: () => ChatPage(), binding: ChatBinding()),

    GetPage(
        name: AppRoutes.Photoimgview,
        page: () => PhotoImageView(),
        binding: PhotoImageViewBinding()),
  ];
}
