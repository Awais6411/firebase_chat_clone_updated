import 'package:firebase_chat_clone/common/entities/user.dart';
import 'package:firebase_chat_clone/common/routes/names.dart';
import 'package:firebase_chat_clone/common/store/store.dart';
import 'package:firebase_chat_clone/common/values/colors.dart';
import 'package:firebase_chat_clone/common/widgets/toast.dart';
import 'package:firebase_chat_clone/pages/application/index.dart';
import 'package:firebase_chat_clone/pages/sign_in/index.dart';
import 'package:firebase_chat_clone/pages/welcome/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  ApplicationController();
  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;
  void handlePageChanged(int index) {
    state.page = index;
  }

  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabTitles = ["Chat", "Contact", "Profile"];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.message,
            color: AppColors.thirdElementText,
          ),
          activeIcon: Icon(
            Icons.message,
            color: AppColors.secondaryElementText,
          ),
          label: "Chat",
          backgroundColor: AppColors.primaryBackground),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.contact_page,
            color: AppColors.thirdElementText,
          ),
          activeIcon: Icon(
            Icons.contact_page,
            color: AppColors.secondaryElementText,
          ),
          label: "Contacts",
          backgroundColor: AppColors.primaryBackground),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: AppColors.thirdElementText,
          ),
          activeIcon: Icon(
            Icons.person,
            color: AppColors.secondaryElementText,
          ),
          label: "Person",
          backgroundColor: AppColors.primaryBackground),
    ];
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
