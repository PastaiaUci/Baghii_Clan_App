import 'package:flutter/material.dart';
import 'package:baghii_clan/models/user.dart';
import 'package:provider/provider.dart';
import 'package:baghii_clan/screens/authentification/login_signin.dart';
import 'package:baghii_clan/screens/main_screens_wrapper.dart';

/*
Wrapps both the login and the home screens returning a coresponding screen if the user is loged in or not.


*/

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //takes the user value from the stream in main file(null if it is not signed in)
    final user = Provider.of<User_model>(context);

    // return either the Home or Authenticate widget
    if (user == null){
      //return Authenticate();
      return Register_Login();
    }else{
      return MainScreensWrapper();
    }

  }
}