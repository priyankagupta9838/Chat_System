
import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  bool chatRefresh=true;
  bool isDarkTheme = false;
  final currentUser = ChatUser(
    id: 'gupta200priyanka@gmail.com',
    name: 'Priyanka Gupta',
    //profilePhoto: "assets/images/profile.jpg",
  );
  final _chatController = ChatController(
    initialMessageList: [],
    scrollController: ScrollController(),
    chatUsers: [],
  );


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("ChatSystem")
              .doc("AruPriya")
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            print(" dataa is.............${snapshot.data?.data()}");
            if(  snapshot.data?.data() !=null && snapshot.hasData ){

                _chatController.initialMessageList.clear();

              _chatController.chatUsers.add(
                ChatUser(
                  id: 'arunjijhmaniya2003@gmail.com',
                  name: 'Arun kumar',
                  //profilePhoto: "assets/images/profile.jpg",
                ),
              );

              for( int index=0; index < snapshot.data!.data()?["Chat"].length;index++){
                _chatController.initialMessageList.add(
                    snapshot.data!.data()?["Chat"][index]["ReplyMassage"]==""
                    ?
                  Message(
                    id: snapshot.data!.data()!["Chat"][index]["Time"].toString(),
                    createdAt:snapshot.data!.data()?["Chat"][index]["Time"].toDate(),
                    message: snapshot.data!.data()!["Chat"][index]["Massage"].toString(),
                    sendBy: snapshot.data!.data()!["Chat"][index]["Email"],
                    // replyMessage:ReplyMessage. ,
                    messageType: MessageType.text,

                  )
                        :
                    Message(
                      id: snapshot.data!.data()!["Chat"][index]["Time"].toString(),
                      createdAt:snapshot.data!.data()?["Chat"][index]["Time"].toDate(),
                      message: snapshot.data!.data()!["Chat"][index]["Massage"].toString(),
                      sendBy: snapshot.data!.data()!["Chat"][index]["Email"],
                      // replyMessage:ReplyMessage. ,
                      messageType: MessageType.text,
                        replyMessage: ReplyMessage(

                          message:snapshot.data!.data()?["Chat"][index]["ReplyMassage"],
                          messageId: snapshot.data!.data()?["Chat"][index]["ReplyMassageId"],
                          messageType: MessageType.text,
                          replyBy: snapshot.data!.data()?["Chat"][index]["ReplyMassageBy"],
                          replyTo: snapshot.data!.data()?["Chat"][index]["ReplyMassageTo"],

                        )

                    )


                );
              }

            }
            return snapshot.data?.data() !=null && snapshot.hasData
            ?
            SizedBox(
              height: size.height * 1,
              width: size.width * 1,
              child: ChatView(
                currentUser: currentUser,
                chatController: _chatController,
                onSendTap: _onSendTap,
                // featureActiveConfig: const FeatureActiveConfig(
                //   lastSeenAgoBuilderVisibility: true,
                //   receiptsBuilderVisibility: true,
                // ),
                chatViewState: ChatViewState.hasMessages,

                appBar: const ChatViewAppBar(
                  elevation: 0,
                  backGroundColor: Colors.brown,
                  profilePicture: "",
                  backArrowColor: Colors.white70,
                  chatTitle: "Chat view",
                  chatTitleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0.25,
                  ),
                  userStatus: "online",
                  userStatusTextStyle: TextStyle(color: Colors.grey),
                ),
                chatBackgroundConfig: const ChatBackgroundConfiguration(
                  messageTimeIconColor: Colors.green,
                  messageTimeTextStyle: TextStyle(color: Colors.pinkAccent),
                  defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
                    textStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 17,
                    ),
                  ),
                  backgroundColor: Colors.white70,
                ),
                sendMessageConfig: SendMessageConfiguration(
                  replyMessageColor: Colors.black26,
                  defaultSendButtonColor: Colors.black26,
                  replyDialogColor: Colors.black26,
                  replyTitleColor: Colors.black26,
                  textFieldBackgroundColor: Colors.cyan,
                  closeIconColor: Colors.black,
                  textFieldConfig: TextFieldConfiguration(

                    onMessageTyping: (status) {
                      /// Do with status
                      debugPrint(status.toString());
                    },
                    compositionThresholdTime: const Duration(seconds: 1),
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                chatBubbleConfig: ChatBubbleConfiguration(
                  outgoingChatBubbleConfig: const ChatBubble(
                    receiptsWidgetConfig:
                        ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all),
                    color: CupertinoColors.activeOrange,
                  ),
                  inComingChatBubbleConfig: ChatBubble(
                    linkPreviewConfig: const LinkPreviewConfiguration(
                      linkStyle: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      backgroundColor: Colors.white,
                      bodyStyle: TextStyle(fontSize: 10),
                      titleStyle: TextStyle(fontSize: 5),
                    ),
                    textStyle: const TextStyle(color: Colors.pinkAccent),
                    onMessageRead: (message) {
                      /// send your message reciepts to the other client
                      debugPrint('Message Read');
                    },
                    senderNameTextStyle: const TextStyle(color: Colors.black),
                    color: Colors.pinkAccent,
                  ),
                ),
                messageConfig: const MessageConfiguration(

                  messageReactionConfig: MessageReactionConfiguration(

                    backgroundColor: Colors.white,
                    borderColor: Colors.black,
                    reactedUserCountTextStyle: TextStyle(color: Colors.black),
                    reactionCountTextStyle: TextStyle(color: Colors.black),
                  ),
                ),

                replyPopupConfig: const ReplyPopupConfiguration(
                  backgroundColor: Colors.white,
                  buttonTextStyle: TextStyle(color: Colors.black),
                  topBorderColor: Colors.black,
                ),
                repliedMessageConfig: RepliedMessageConfiguration(
                  backgroundColor: Colors.white,
                  verticalBarColor: Colors.pinkAccent,
                  repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
                    enableHighlightRepliedMsg: true,
                    highlightColor: Colors.pinkAccent.shade100,
                    highlightScale: 1.1,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.25,
                  ),
                  replyTitleTextStyle: const TextStyle(color: Colors.black),
                ),
                swipeToReplyConfig: const SwipeToReplyConfiguration(
                  replyIconColor: Colors.green,
                ),
              ),
            )
            :
            SizedBox(
              height: size.height * 1,
              width: size.width * 1,
              child: ChatView(
                currentUser: currentUser,
                chatController: _chatController,
                onSendTap: _onSendTap,
                // featureActiveConfig: const FeatureActiveConfig(
                //   lastSeenAgoBuilderVisibility: true,
                //   receiptsBuilderVisibility: true,
                // ),
                chatViewState: ChatViewState.hasMessages,

                appBar: const ChatViewAppBar(
                  elevation: 0,
                  backGroundColor: Colors.brown,
                  profilePicture: "",
                  backArrowColor: Colors.white70,
                  chatTitle: "Chat view",
                  chatTitleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0.25,
                  ),
                  userStatus: "online",
                  userStatusTextStyle: TextStyle(color: Colors.grey),
                ),
                chatBackgroundConfig: const ChatBackgroundConfiguration(
                  messageTimeIconColor: Colors.green,
                  messageTimeTextStyle: TextStyle(color: Colors.pinkAccent),
                  defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
                    textStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 17,
                    ),
                  ),
                  backgroundColor: Colors.white70,
                ),
                sendMessageConfig: SendMessageConfiguration(
                  replyMessageColor: Colors.black26,
                  defaultSendButtonColor: Colors.black26,
                  replyDialogColor: Colors.black26,
                  replyTitleColor: Colors.black26,
                  textFieldBackgroundColor: Colors.cyan,
                  closeIconColor: Colors.black,
                  textFieldConfig: TextFieldConfiguration(

                    onMessageTyping: (status) {
                      /// Do with status
                      debugPrint(status.toString());
                    },
                    compositionThresholdTime: const Duration(seconds: 1),
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                // chatBubbleConfig: ChatBubbleConfiguration(
                //   outgoingChatBubbleConfig: const ChatBubble(
                //     receiptsWidgetConfig:
                //         ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all),
                //     color: CupertinoColors.activeOrange,
                //   ),
                //   inComingChatBubbleConfig: ChatBubble(
                //     linkPreviewConfig: const LinkPreviewConfiguration(
                //       linkStyle: TextStyle(
                //         color: Colors.blue,
                //         decoration: TextDecoration.underline,
                //       ),
                //       backgroundColor: Colors.white,
                //       bodyStyle: TextStyle(fontSize: 10),
                //       titleStyle: TextStyle(fontSize: 5),
                //     ),
                //     textStyle: const TextStyle(color: Colors.pinkAccent),
                //     onMessageRead: (message) {
                //       /// send your message reciepts to the other client
                //       debugPrint('Message Read');
                //     },
                //     senderNameTextStyle: const TextStyle(color: Colors.black),
                //     color: Colors.pinkAccent,
                //   ),
                // ),
                messageConfig: const MessageConfiguration(

                  messageReactionConfig: MessageReactionConfiguration(

                    backgroundColor: Colors.white,
                    borderColor: Colors.black,
                    reactedUserCountTextStyle: TextStyle(color: Colors.black),
                    reactionCountTextStyle: TextStyle(color: Colors.black),
                  ),
                ),

                // replyPopupConfig: const ReplyPopupConfiguration(
                //   backgroundColor: Colors.white,
                //   buttonTextStyle: TextStyle(color: Colors.black),
                //   topBorderColor: Colors.black,
                // ),
                // repliedMessageConfig: RepliedMessageConfiguration(
                //   backgroundColor: Colors.white,
                //   verticalBarColor: Colors.pinkAccent,
                //   repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
                //     enableHighlightRepliedMsg: true,
                //     highlightColor: Colors.pinkAccent.shade100,
                //     highlightScale: 1.1,
                //   ),
                //   textStyle: const TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 0.25,
                //   ),
                //   replyTitleTextStyle: const TextStyle(color: Colors.black),
                // ),
                // swipeToReplyConfig: const SwipeToReplyConfiguration(
                //   replyIconColor: Colors.green,
                // ),
              ),
            )
            ;
          },
        ),
      ),
    );
  }

  Future<void> _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) async {
    await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").get().then((value) async {
      if(value.data()==null){
        await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").set({
          "Chat":[{
            "Name":"Priyanka Gupta",
            "Email":"gupta200priyanka@gmail.com",
            "Massage":message,
            "Time":DateTime.now(),
            "massageType":messageType.name,
            "ReplyMassage":replyMessage.message,
            "ReplyMassageId":replyMessage.messageId,
            "ReplyMassageBy":replyMessage.replyBy,
            "ReplyMassageType":replyMessage.messageType.name,
            "ReplyMassageTo":replyMessage.replyTo
          }]
        });
      }
      else{
        await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").update({
          "Chat":FieldValue.arrayUnion([{
            "Name":"Priyanka Gupta",
            "Email":"gupta200priyanka@gmail.com",
            "Massage":message,
            "Time":DateTime.now(),
            "massageType":messageType.name,
            "ReplyMassage":replyMessage.message,
            "ReplyMassageId":replyMessage.messageId,
            "ReplyMassageBy":replyMessage.replyBy,
            "ReplyMassageType":replyMessage.messageType.name,
            "ReplyMassageTo":replyMessage.replyTo

          }])
        });
      }
    });
  }
}
