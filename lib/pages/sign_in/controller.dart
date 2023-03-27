import 'package:firebase_chat_clone/common/entities/user.dart';
import 'package:firebase_chat_clone/common/routes/names.dart';
import 'package:firebase_chat_clone/common/store/store.dart';
import 'package:firebase_chat_clone/common/widgets/toast.dart';
import 'package:firebase_chat_clone/pages/sign_in/index.dart';
import 'package:firebase_chat_clone/pages/welcome/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class SignInController extends GetxController {
  final state = SignInState();
  SignInController();
  final db = FirebaseFirestore.instance;
  Future<void> handlSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
        final _gAuthentication = await user.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken);
        await FirebaseAuth.instance.signInWithCredential(_credential);
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";
        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.email = email;
        userProfile.accessToken = id;
        userProfile.displayName = displayName;
        userProfile.photoUrl = photoUrl;
        UserStore.to.saveProfile(userProfile);

        var userbase = await db
            .collection("users")
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userdata, options) =>
                  userdata.toFirestore(),
            )
            .where("id", isEqualTo: id)
            .get();
        if (userbase.docs.isEmpty) {
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photourl: photoUrl,
              location: "",
              fcmtoken: "",
              addtime: Timestamp.now());
          await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore(),
              )
              .add(data);
          toastInfo(msg: "Login success");
          // Get.offAndToNamed(AppRoutes.Chat);
        }
        Get.offAndToNamed(AppRoutes.Application);
      }
    } catch (e) {
      toastInfo(msg: "Login Error");
      print(e);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("User is currently logged out");
      } else {
        print("User is logged in");
      }
    });
  }
}
