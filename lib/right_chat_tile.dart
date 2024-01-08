import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RigthChatTile extends StatefulWidget {
  RigthChatTile({super.key,required this.name,required this.massage,required this.time});
  String name;
  String massage;
  Timestamp time;

  @override
  State<RigthChatTile> createState() => _RigthChatTileState();
}

class _RigthChatTileState extends State<RigthChatTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      decoration: const BoxDecoration(
          color: Colors.green
      ),
      child:AutoSizeText(
        widget.massage,
        style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w400
        ),
      ) ,
    );
  }


}
