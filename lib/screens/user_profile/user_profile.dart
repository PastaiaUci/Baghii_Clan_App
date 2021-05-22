import 'package:flutter/material.dart';
import 'components/body.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Body(),
    );
  }
}

