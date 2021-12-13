import 'package:flutter/material.dart';

import 'components/body.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeName = "/edit_profile";
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S\'inscrire'),
      ),
      body: Body(),
    );
  }
}
