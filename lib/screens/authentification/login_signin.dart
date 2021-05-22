import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:baghii_clan/config/palette.dart';
import 'package:baghii_clan/services/auth.dart';
import 'package:baghii_clan/config/size_config.dart';

class Register_Login extends StatefulWidget {
  @override
  _Register_LoginState createState() => _Register_LoginState();
}

class _Register_LoginState extends State<Register_Login> {
  final AuthService _auth = AuthService();
  var _formKey0 = GlobalKey<FormState>();
  var _formKey1 = GlobalKey<FormState>();
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  String email = '';
  String password = '';
  String error = '';
  bool showShadow = false;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
                height: SizeConfig.blockSizeVertical * 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/baghii_logo.jpeg"),
                        fit: BoxFit.fill)),
                child: Container(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 10,
                        left: SizeConfig.blockSizeVertical * 5),
                    color: Color(0xFF3b5999).withOpacity(.79),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Welcome  ",
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeVertical * 4.5,
                                letterSpacing: 1,
                                color: Colors.yellow[700],
                              ),
                              children: [
                                TextSpan(
                                  text: isSignupScreen
                                      ? "to  Baghii Clan,"
                                      : "back  asasine,",
                                  style: TextStyle(
                                    fontSize: SizeConfig.blockSizeVertical * 4,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow[700],
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 1,
                        ),
                        Text(
                          isSignupScreen
                              ? "Signup to Continue"
                              : "Signin to Continue",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ))),
          ),
          AnimatedPositioned(

            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen
                ? SizeConfig.blockSizeVertical * 30
                : SizeConfig.blockSizeVertical * 30,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen
                  ? SizeConfig.blockSizeVertical * 60
                  : SizeConfig.blockSizeVertical * 51,
              padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 3.5),
              width: SizeConfig.blockSizeHorizontal * 89,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal * 10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: SizeConfig.blockSizeHorizontal * 20,
                        spreadRadius: SizeConfig.blockSizeHorizontal * 0.5),
                  ]),
              child: SingleChildScrollView(

                reverse: true,
                child: Padding(
                  padding: EdgeInsets.only(bottom: bottom),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 4,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignupScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                   margin: EdgeInsets.only(top: 3),
                                    height: SizeConfig.blockSizeHorizontal * 0.6,
                                    width: SizeConfig.blockSizeHorizontal * 15,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 4,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: SizeConfig.blockSizeHorizontal * 0.6,
                                    width: SizeConfig.blockSizeHorizontal * 15,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                      if (isSignupScreen)
                        Container(
                          margin: EdgeInsets.fromLTRB(SizeConfig.blockSizeVertical *2, SizeConfig.blockSizeVertical *2, SizeConfig.blockSizeVertical *2, SizeConfig.blockSizeVertical *5),
                          child: Column(
                            children: [
                              SizedBox(height: SizeConfig.blockSizeVertical *2),
                              Form(

                                key: _formKey1,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Invalid email!";
                                        }
                                        bool check_for_at = false;
                                        for (int i = 0; i < value.length; i++) {
                                          if (value[i] == "@") {
                                            check_for_at = true;
                                          }
                                        }
                                        if (check_for_at == false)
                                          return " Invalid email format!";
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          email = val;
                                        });
                                      },
                                      obscureText: false,
                                      keyboardType: true
                                          ? TextInputType.emailAddress
                                          : TextInputType.text,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.mail_outline,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      6)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      6)),
                                        ),
                                        contentPadding: EdgeInsets.all(
                                            SizeConfig.blockSizeHorizontal * 0.6),
                                        hintText: "email",
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                      ),
                                    ),
                                    SizedBox(
                                        height: SizeConfig.blockSizeVertical * 1),
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.length < 6) {
                                          return "Password must be at least 6 characters";
                                        }
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          password = val;
                                        });
                                      },
                                      obscureText: true,
                                      keyboardType: false
                                          ? TextInputType.emailAddress
                                          : TextInputType.text,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          MaterialCommunityIcons.lock_outline,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      6)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      6)),
                                        ),
                                        contentPadding: EdgeInsets.all(
                                            SizeConfig.blockSizeHorizontal * 0.6),
                                        hintText: "*********",
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isMale = true;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      7,
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      4,
                                                  margin:
                                                      EdgeInsets.only(right: 8),
                                                  decoration: BoxDecoration(
                                                      color: isMale
                                                          ? Palette.textColor2
                                                          : Colors.transparent,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: isMale
                                                              ? Colors.transparent
                                                              : Palette
                                                                  .textColor1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Icon(
                                                    MaterialCommunityIcons
                                                        .account_outline,
                                                    color: isMale
                                                        ? Colors.white
                                                        : Palette.iconColor,
                                                  ),
                                                ),
                                                Text(
                                                  "Male",
                                                  style: TextStyle(
                                                      color: Palette.textColor1),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isMale = false;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      7,
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      4,
                                                  margin:
                                                      EdgeInsets.only(right: 8),
                                                  decoration: BoxDecoration(
                                                      color: isMale
                                                          ? Colors.transparent
                                                          : Palette.textColor2,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: isMale
                                                              ? Palette.textColor1
                                                              : Colors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Icon(
                                                    MaterialCommunityIcons
                                                        .account_outline,
                                                    color: isMale
                                                        ? Palette.iconColor
                                                        : Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Female",
                                                  style: TextStyle(
                                                      color: Palette.textColor1),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: SizeConfig.blockSizeHorizontal * 38,
                                      margin: EdgeInsets.only(
                                          top:
                                              SizeConfig.blockSizeHorizontal * 4),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text:
                                                "By pressing 'Submit' you agree to our ",
                                            style: TextStyle(
                                                color: Palette.textColor2),
                                            children: [
                                              TextSpan(
                                                //recognizer: ,
                                                text: "term & conditions.",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ],
                                  //padding: const EdgeInsets.only(bottom: 8.0),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical * 10,
                                          width: SizeConfig.blockSizeHorizontal *
                                              31),
                                      Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.orange[200],
                                                    Colors.red[400]
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight),
                                              borderRadius: BorderRadius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(.3),
                                                    spreadRadius: SizeConfig
                                                            .blockSizeHorizontal *
                                                        0.5,
                                                    blurRadius: SizeConfig
                                                            .blockSizeHorizontal *
                                                        1,
                                                    offset: Offset(0, 1))
                                              ]),
                                          child: IconButton(
                                            icon: Icon(Icons.arrow_forward),
                                            color: Colors.white,
                                            onPressed: () {
                                              if (_formKey1.currentState
                                                  .validate()) {
                                                if (!isSignupScreen) {
                                                  dynamic result = _auth
                                                      .signInWithEmailAndPassword(
                                                          email, password);
                                                } else {
                                                  dynamic result = _auth
                                                      .registerWithEmailAndPassword(
                                                          email, password);
                                                }
                                              }
                                            },
                                          ))
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      if (!isSignupScreen)
                        Container(
                          margin: EdgeInsets.fromLTRB(SizeConfig.blockSizeVertical *2, SizeConfig.blockSizeVertical *1.5, SizeConfig.blockSizeVertical *1, SizeConfig.blockSizeVertical *10),

                          child: Column(
                            children: [
                              SizedBox(height:SizeConfig.blockSizeVertical * 2.5),
                              Form(
                                key: _formKey0,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Invalid email!";
                                        }
                                        bool check_for_at = false;



                                        for (int i = 0; i < value.length; i++) {
                                          if (value[i] == "@") {
                                            check_for_at = true;
                                          }

                                        }
                                        if (check_for_at == false)
                                          return " Invalid email format!";
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          email = val;
                                        });
                                      },
                                      obscureText: false,
                                      keyboardType: true
                                          ? TextInputType.emailAddress
                                          : TextInputType.text,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.mail_outline,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      6)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      6)),
                                        ),
                                        contentPadding: EdgeInsets.all(
                                            SizeConfig.blockSizeHorizontal * 0.6),
                                        hintText: "email",
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                      ),
                                    ),
                                    SizedBox(
                                        height: SizeConfig.blockSizeVertical * 1),
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.length < 6) {
                                          return "Password must be at least 6 characters";
                                        }
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          password = val;
                                        });
                                      },
                                      obscureText: true,
                                      keyboardType: false
                                          ? TextInputType.emailAddress
                                          : TextInputType.text,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          MaterialCommunityIcons.lock_outline,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      6)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      6)),
                                        ),
                                        contentPadding: EdgeInsets.all(
                                            SizeConfig.blockSizeHorizontal * 0.6),
                                        hintText: "*********",
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                      ),
                                    ),
                                  ],
                                  //padding: const EdgeInsets.only(bottom: 8.0),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: isRememberMe,
                                        activeColor: Palette.textColor2,
                                        onChanged: (value) {
                                          setState(() {
                                            isRememberMe = !isRememberMe;
                                          });
                                        },
                                      ),
                                      Text("Remember me",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeHorizontal *
                                                      3,
                                              color: Palette.textColor1)),
                                      SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical * 10,
                                          width: SizeConfig.blockSizeHorizontal *
                                              25),
                                      Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.orange[200],
                                                    Colors.red[400]
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight),
                                              borderRadius: BorderRadius.circular(
                                                  SizeConfig.blockSizeHorizontal *
                                                      10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(.3),
                                                    spreadRadius: SizeConfig
                                                            .blockSizeHorizontal *
                                                        0.5,
                                                    blurRadius: SizeConfig
                                                            .blockSizeHorizontal *
                                                        1,
                                                    offset: Offset(0, 1))
                                              ]),
                                          child: IconButton(
                                            icon: Icon(Icons.arrow_forward),
                                            color: Colors.white,
                                            onPressed: () {
                                              if (_formKey0.currentState
                                                  .validate()) {
                                                if (!isSignupScreen) {
                                                  dynamic result = _auth
                                                      .signInWithEmailAndPassword(
                                                          email, password);
                                                } else {
                                                  dynamic result = _auth
                                                      .registerWithEmailAndPassword(
                                                          email, password);
                                                }
                                              }
                                            },
                                          ))
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



/*

        HERE IS THE ARROW BUTTON
              ↓↓↓↓↓↓↓↓↓
 */
  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen
          ? SizeConfig.blockSizeVertical * 73
          : SizeConfig.blockSizeVertical * 74,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: SizeConfig.blockSizeHorizontal * 22,
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3.6),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeHorizontal * 18),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: SizeConfig.blockSizeHorizontal * 2,
                    blurRadius: SizeConfig.blockSizeHorizontal * 3.6,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange[200], Colors.red[400]],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: SizeConfig.blockSizeHorizontal * 0.5,
                            blurRadius: SizeConfig.blockSizeHorizontal * 1,
                            offset: Offset(0, 1))
                      ]),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                    onPressed: () {
                      if (_formKey1.currentState.validate() ||
                          _formKey0.currentState.validate()) {
                        if (!isSignupScreen) {
                          dynamic result =
                              _auth.signInWithEmailAndPassword(email, password);
                        } else {
                          dynamic result = _auth.registerWithEmailAndPassword(
                              email, password);
                        }
                      }
                    },
                  ))
              : Center(),
        ),
      ),
    );
  }
}
