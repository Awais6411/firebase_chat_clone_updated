import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/values/colors.dart';

class Message {
  static void taskError(String taskName, String TaskError) {
    Get.snackbar(
      taskName,
      TaskError,
      backgroundColor: Colors.grey.withOpacity(0.4),
      titleText: Text(
        taskName,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 225, 15, 15).withOpacity(0.4)),
      ),
      messageText: Text(
        TaskError,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 57, 56, 56).withOpacity(0.5)),
      ),
    );
  }
}
