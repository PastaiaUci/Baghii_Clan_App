import 'package:baghii_clan/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:baghii_clan/models/user.dart';
import 'package:provider/provider.dart';
import 'package:baghii_clan/models/user_data_model.dart';
import 'package:baghii_clan/services/database.dart';
import 'package:baghii_clan/shared/loading.dart';

class ProfilePic extends StatefulWidget {
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User_model>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData || 1==1) {
            UserData userData = snapshot.data;

            return SizedBox(
              height: SizeConfig.blockSizeVertical * 20,
              width: SizeConfig.blockSizeHorizontal * 30,
              child: Stack(

                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: [
                   CircleAvatar(

                     backgroundImage:userData.profile_pic == null ?  AssetImage("lib/baghii_logo.jpeg") : FileImage(File(userData.profile_pic))
                   ),

                  Positioned(

                    right: -SizeConfig.blockSizeVertical * 2.5,
                    bottom: 0,
                    child: SizedBox(
                      height: SizeConfig.blockSizeVertical * 7,
                      width: SizeConfig.blockSizeVertical * 7,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: Color(0xFFF5F6F9),
                        onPressed: () async {
                          takePhoto(ImageSource.gallery,userData,user);
                        },
                        child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                      ),
                    ),
                  )
                ],
              ),

              );
          }
          else return Loading();
        }
        );
    }



  void takePhoto(ImageSource source , UserData userData, User_model user) async {
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {

       final pickedFile = await _picker.getImage(source: source);

      setState(() {
        _imageFile = pickedFile;
      });


      String fileName = _imageFile.path
          .substring(_imageFile.path.lastIndexOf("/"), _imageFile.path.lastIndexOf("."))
          .replaceAll("/", "");

      var file = File(_imageFile.path);

      if (_imageFile != null) {
        //Upload to Firebase
        var snapshot = await _storage.ref().child("profile_pics/$fileName").putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        await DatabaseService(uid: user.uid).updateUserData(
            userData.name,
            _imageFile.path,
            downloadUrl);
      }
    }
  }
}

