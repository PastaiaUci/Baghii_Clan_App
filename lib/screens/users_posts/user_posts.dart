import 'package:flutter/material.dart';


class UsersPosts extends StatefulWidget {
  @override
  _UsersPosts createState() => _UsersPosts();
}

class _UsersPosts extends State<UsersPosts> {






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
            padding: EdgeInsets.all(100),
            child: Text("users posts here")),
      ),

    );
  }
}
