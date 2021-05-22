import 'package:baghii_clan/screens/user_create_post/create_post.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:baghii_clan/screens/user_profile/user_profile.dart';
import 'package:baghii_clan/screens/baghii_og/list_of_baghii.dart';
import 'package:baghii_clan/screens/users_posts/user_posts.dart';




class MainScreensWrapper extends StatefulWidget {
  @override
  _MainScreensWrapper createState() => _MainScreensWrapper();
}

class _MainScreensWrapper extends State<MainScreensWrapper> {


  int currentIndex = 0;
  List<Widget> children = [
    UsersPosts(),
    CreatePost(),
    BaghiiOg(),
    UserProfile(),
  ];



  @override
  Widget build(BuildContext context) {


    return  new Scaffold(
      extendBody: true,
      body: children[currentIndex],

      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Color(0x00ffffff),
        color: Colors.black,
        items: <Widget>[

          Tab(icon:new Image.asset("assets/images/john_cena.jpg")),
          Tab(icon:new Image.asset("assets/images/Lemon.png")),
          Tab(icon:new Image.asset("assets/images/profile.jpg")),
          Tab(icon:new Image.asset("assets/images/garena.png"))

        ],
        animationDuration: Duration(milliseconds: 350),
        onTap: (index) {

          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}








