import 'package:firebase_chat_clone/pages/message/photoview/state.dart';
import 'package:get/get.dart';

class PhotoImageViewController extends GetxController {
  final PhotoImageViewState state = PhotoImageViewState();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var data = Get.parameters;
    if (data["url"] != null) {
      state.url.value = data["url"]!;
    }
  }
}
