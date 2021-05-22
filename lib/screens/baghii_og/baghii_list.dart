import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baghii_clan/models/Baghiu.dart';
import 'baghiu_tile.dart';


class BaghiiList extends StatefulWidget {
  @override
  _BaghiiListState createState() => _BaghiiListState();
}

class _BaghiiListState extends State<BaghiiList> {
  @override
  Widget build(BuildContext context) {
    final baghii = Provider.of<List<Baghiu>>(context) ?? [];


      return ListView.builder(

        itemCount: baghii.length,
        itemBuilder: (context, index) {
          return BaghiuTile(baghiu: baghii[index]);
        },
      );

  }
}
