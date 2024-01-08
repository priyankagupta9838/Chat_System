import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_system/right_chat_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'left_chat_tile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AutoSizeText("Talk With ..........."),
      ),
      body: SizedBox(
        height: size.height * 1,
        child: StreamBuilder(
          stream:   FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            return snapshot.hasData
                ?
                ListView.builder(
                  itemCount: snapshot.data!.data()?["Chat"].length,
                  itemBuilder: (context, index) {
                    return snapshot.data!.data()?["Chat"][index]["Email"] ==
                        "arunjijhmaniya2003@gmail.com"
                        ?
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        child: LeftChatTile(name: '${snapshot.data!.data()?["Chat"][index]["Name"]}',
                          massage: '${snapshot.data!.data()?["Chat"][index]["Massage"]}',
                          time: snapshot.data!.data()?["Chat"][index]["Time"],),
                      ),
                    )
                        :
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        child: RigthChatTile(name: '${snapshot.data!.data()?["Chat"][index]["Name"]}',
                          massage: '${snapshot.data!.data()?["Chat"][index]["Massage"]}',
                          time: snapshot.data!.data()?["Chat"][index]["Time"],),
                      ),
                    );
                  })

                         :

                   const SizedBox();

        },
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        width: size.width * 1,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.height * 0.08,
              width: size.width * 0.7,
              child: TextField(


                controller: massageController,
                decoration:
                    const InputDecoration(hintText: "Write your msg here....."),
              ),
            ),
            InkWell(
              onTap: () async {
               await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").get().then((value) async {
                 if(value.data()==null){
                   await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").set({
                    "Chat":[{
                      "Name":"Priyanka gupta",
                      "Email":"gupta200priyanka@gmail.com",
                      "Massage":massageController.text.trim(),
                      "Time":DateTime.now(),
                    }]
                   });
                 }
                 else{
                   await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").update({
                     "Chat":FieldValue.arrayUnion([{
                       "Name":"Priyanka Gupta",
                       "Email":"gupta200priyanka@gmail.com",
                       "Massage":massageController.text.trim(),
                       "Time":DateTime.now(),
                     }])
                   });
                 }
               }).whenComplete(() {
                 setState(() {

                   massageController.clear();
                 });
               });

              },
              child: Container(
                height: size.height * .045,
                width: size.height * .045,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(size.height * .045)),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
