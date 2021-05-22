import 'package:flutter/material.dart';
import 'package:baghii_clan/services/auth.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:baghii_clan/config/size_config.dart';
import 'settings_form.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
      //the bottom sheet
      void showSettingsPannel() {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                  child: SettingsForm()
              );
            }
        );
      }


      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeHorizontal * 20),
        child: Column(

          children: [
            ProfilePic(),
            SizedBox(height: SizeConfig.blockSizeVertical * 5),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {
                showSettingsPannel();
              },
            ),

            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      );

  }
}

