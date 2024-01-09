import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_view2.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height*1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      size.height * 0.07,
                    ),
                  ),
                  color: CupertinoColors.activeGreen),
              child: Column(

                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.height * 0.03),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(CupertinoIcons.search)],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.3),
                    child: AutoSizeText(
                      "Chat",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: size.height * 0.035),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: size.height*0.84,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height * 0.1,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            size.height * 0.1,
                          ),
                        ),
                        color: Colors.purple),
                    child: Column(

                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: size.height * 0.03,
                                child: const Text("P"),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Priyanka gupta",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white),
                                  ),
                                  AutoSizeText(
                                    "Hi Everyone",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
