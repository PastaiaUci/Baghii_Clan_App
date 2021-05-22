import 'package:flutter/material.dart';
import 'package:baghii_clan/models/Baghiu.dart';
import 'dart:io';
import 'package:baghii_clan/models/user.dart';
import 'package:provider/provider.dart';
import 'package:baghii_clan/models/user_data_model.dart';
import 'package:baghii_clan/services/database.dart';
import 'package:baghii_clan/shared/loading.dart';



class BaghiuTile extends StatelessWidget {

  final Baghiu baghiu;

  BaghiuTile({this.baghiu});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User_model>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData || 1 == 1) {
            UserData userData = snapshot.data;
            return Padding(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.brown[200],
                    backgroundImage:userData.profile_pic == null ?  AssetImage("lib/baghii_logo.jpeg") :NetworkImage(userData.profile_pic_url),

                  ),
                  title: Text(
                      baghiu.status
                  ),
                  subtitle: Text(
                      "Baghiu"

                  ),
                ),
              ),
            );

          }

          else
            return Loading();
        }
    );
  }
}