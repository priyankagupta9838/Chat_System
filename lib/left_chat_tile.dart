import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeftChatTile extends StatefulWidget {
  LeftChatTile({super.key,required this.name,required this.massage,required this.time});
  String name;
  String massage;
  Timestamp time;

  @override
  State<LeftChatTile> createState() => _LeftChatTileState();
}

class _LeftChatTileState extends State<LeftChatTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 0),
    decoration: BoxDecoration(
      color: Colors.green
    ),
    child:AutoSizeText(
      widget.massage,
      style: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.w400
      ),
    ) ,
    );
  }


}
