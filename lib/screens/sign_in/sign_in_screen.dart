import 'dart:io';

import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  Future<bool> onWillPop() async {
    exit(0);
    // return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Se Connecter"),
        ),
        body: Body(),
      ),
    );
  }
}
