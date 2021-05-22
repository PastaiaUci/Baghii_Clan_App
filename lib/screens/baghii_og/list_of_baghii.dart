import 'file:///D:/Programe/baghii_clan/lib/screens/baghii_og/baghii_list.dart';
import 'package:baghii_clan/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baghii_clan/models/Baghiu.dart';
import '../user_profile/components/settings_form.dart';


class BaghiiOg extends StatefulWidget {
  @override
  _BaghiiOg createState() => _BaghiiOg();
}



class _BaghiiOg extends State<BaghiiOg> {


  @override

  Widget build(BuildContext context) {



    return StreamProvider< List<Baghiu>>.value(
      value: DatabaseService().baghii,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: BaghiiList(),

      ),
    );
  }
}