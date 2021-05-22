import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:baghii_clan/config/size_config.dart';



class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*5, vertical: SizeConfig.blockSizeVertical*1),
      child: FlatButton(
        padding: EdgeInsets.all(SizeConfig.blockSizeVertical*2.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color:  Color(0xFFFF7643),
              width: SizeConfig.blockSizeHorizontal*6,
            ),
            SizedBox(width: SizeConfig.blockSizeVertical*4),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}