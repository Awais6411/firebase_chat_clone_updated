import 'package:firebase_chat_clone/pages/message/index.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class AuthApp extends StatefulWidget {
  @override
  _AuthAppState createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  LocalAuthentication auth = LocalAuthentication();
  bool? _canCheckBiometric;
  List<BiometricType>? _availableBiometric;
  String authorized = "Not authorized";

  //checking bimetrics
  //this function will check the sensors and will tell us
  // if we can use them or not
  Future<void> _checkBiometric() async {
    bool? canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  //this function will get all the available biometrics inside our device
  //it will return a list of objects, but for our example it will only
  //return the fingerprint biometric
  Future<void> _getAvailableBiometrics() async {
    List<BiometricType>? availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  //this function will open an authentication dialog
  // and it will check if we are authenticated or not
  // so we will add the major action here like moving to another activity
  // or just display a text that will tell us that we are authenticated
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: "Scan your finger print to authenticate",
        options: AuthenticationOptions(
            biometricOnly: true, useErrorDialogs: true, stickyAuth: false),
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      authorized =
          authenticated ? "Autherized success" : "Failed to authenticate";
      if (authenticated) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessagePage(),
            ));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkBiometric();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: _authenticate,
                child: Text("Get Biometric"),
              ),
            ),
            Text("Can check biometric: $_canCheckBiometric"),
            Text("Available biometric: $_availableBiometric"),
            Text("Current State: $authorized"),
          ],
        ),
      ),
    );
  }
}
