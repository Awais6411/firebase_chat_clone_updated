import 'package:firebase_chat_clone/pages/signup/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../common/routes/names.dart';
import 'widgets/error_warning_message.dart';
import 'widgets/my_rich_text.dart';
import 'widgets/wrap_container.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  bool _dataValidation() {
    if (_userController.text.trim().isEmpty) {
      Message.taskError("Name empty", "User name can't be empty");
      return false;
    } else if (_emaiController.text.trim().isEmpty) {
      Message.taskError("Email empty", "Email can't be empty");
      return false;
    } else if (_passwordController.text.trim().isEmpty) {
      Message.taskError("Password empty", "password can't be empty");
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white.withOpacity(0.7),
                    size: 25,
                  ),
                ),
              ),
              const Center(
                child: Image(
                  image: AssetImage("assets/rose.png"),
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  padding: const EdgeInsets.all(40),
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "UserName",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        MyTextField(controller: _userController, hint: "Enter username"),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15),
                          ),
                        ),
                        MyTextField(controller: _emaiController, hint: "Enter email"),
                        const SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        MyTextField(
                          controller: _passwordController,
                          hint: "Enter password",
                          obs: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              if (_dataValidation()) {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _emaiController.text.trim(),
                                        password:
                                            _passwordController.text.trim())
                                    .then((value) {
                                  print("Created new account");
                                  Get.offAndToNamed(AppRoutes.Application);
                                }).onError((error, stackTrace) {
                                  Message.taskError(
                                      "Error", "Invalid credentials");
                                });
                              }
                            },
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow),
                              child: Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Or",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Wrap(
                            spacing: 15.0,
                            children: const [
                              MyWrapContainer(img: "assets/icons/facebook.png"),
                              MyWrapContainer(img: "assets/google.png"),
                              MyWrapContainer(img: "assets/apple.png"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("tapped");
                            Get.back();
                          },
                          child: const MyRichText(
                              title: "Already have an account ? ",
                              subTitle: "Sign in"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]));
  }
}
