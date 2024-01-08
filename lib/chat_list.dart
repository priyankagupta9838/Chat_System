import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';
import 'chat_view.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const AutoSizeText("Talk",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w600)),
      ),
      body: SizedBox(
        height: size.height*1,
        child: ListView.builder(
          itemCount:1 ,
          itemBuilder: (context, index) {
            return SizedBox(
              height: size.height*0.11,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Chat_View (),));
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.purple.shade600,
                            child: const AutoSizeText(
                                "P",
                                style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600)
                            ),
                          ),
                          SizedBox(
                            width: size.width*0.1,
                          ),
                          Container(
                            width: size.width*0.65,
                            child: const AutoSizeText("Priyanka Gupta",

                                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1,thickness: 1,color: Colors.black,)
                ],
              ),
            );
          },),
      ),


    ) ;
  }
}
