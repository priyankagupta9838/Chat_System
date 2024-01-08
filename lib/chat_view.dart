import 'package:auto_size_text/auto_size_text.dart';
import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat_View extends StatefulWidget {
  const Chat_View({
    super.key,
  });

  @override
  State<Chat_View> createState() => _Chat_ViewState();
}

class _Chat_ViewState extends State<Chat_View> {
  TextEditingController msgController = TextEditingController();
  bool load = false;
  final chatController = ChatController(
    initialMessageList: [],
    scrollController: ScrollController(),
    chatUsers: [],
  );
  final currentUser = ChatUser(
    id: '1',
    name: 'Priyanka',
    profilePhoto: "r",
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Container(
        height: size.height * 1,
        width: size.width * 1,
        color:  Colors.black45,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").snapshots(),
          builder: (
              BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            final message1 = Message(

                id: "1",
                message: "hi",
                createdAt: DateTime.now(),
                sendBy:"Arunkumar",
                messageType: MessageType.text,
                replyMessage: const ReplyMessage(
                  message: 'ReplyMessage',
                  messageId: "ReplyMessageId",
                  messageType: MessageType.text,
                  replyTo: 'ReplyTo',
                  replyBy: 'ReplyBy',
                  voiceMessageDuration: Duration(seconds:  0),
                )
            );
            chatController.initialMessageList.add(message1);
            return snapshot.hasData
              ?
              Container(
                height: size.height*1,
                width: size.width*1,
                child: ChatView(

                appBar: AppBar(
                  backgroundColor: Colors.black87,
                  titleSpacing: 0,
                  title: AutoSizeText(
                    "Arun Kumar",
                    style: GoogleFonts.tiltNeon(
                        color: Colors.white, fontSize: size.width * 0.055),
                  ),
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  ),
                ),

                profileCircleConfig: ProfileCircleConfiguration(
                  circleRadius: size.width * 0.035,

                  //profileImageUrl: usermodel["Profile_URL"],
                ),
                chatBackgroundConfig: ChatBackgroundConfiguration(

                  ///time color
                    messageTimeIconColor: const Color.fromRGBO(3, 178, 183, 1),
                    messageTimeTextStyle: GoogleFonts.tiltNeon(
                      color: const Color.fromRGBO(3, 178, 183, 1),
                    ),
                    backgroundColor: Colors.black45,
                    defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
                      textStyle: GoogleFonts.tiltNeon(
                        color: const Color.fromRGBO(211, 211, 211, 1),
                        //const Color.fromRGBO(150, 150, 150, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.035,
                      ),
                    )),
                currentUser: currentUser,
                chatController: chatController,
                onSendTap: (message, replyMessage, messageType) async {

                  await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").get().then((value) async {
                    if(value.data()==null){
                      await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").set({
                        "Chat":[{
                          "Name":"Priyanka gupta",
                          "Email":"gupta200priyanka@gmail.com",
                          "Massage":message.toString().trim(),
                          "Time":DateTime.now(),
                        }]
                      });
                    }
                    else{
                      await FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").update({
                        "Chat":FieldValue.arrayUnion([{
                          "Name":"Priyanka Gupta",
                          "Email":"gupta200priyanka@gmail.com",
                          "Massage":replyMessage.message.toString().trim(),
                          "Time":DateTime.now(),
                        }])
                      });
                    }
                  }).whenComplete(() {
                    setState(() {


                    });
                  });




                },
                featureActiveConfig: const FeatureActiveConfig(
                    lastSeenAgoBuilderVisibility: true,
                    enableOtherUserProfileAvatar: true,
                    enablePagination: true,
                    enableSwipeToSeeTime: true,
                    enableCurrentUserProfileAvatar: true,
                    enableDoubleTapToLike: true,
                    receiptsBuilderVisibility: true,
                    enableChatSeparator: true,
                    enableReactionPopup: true,
                    enableReplySnackBar: true,
                    enableTextField: true),
                // loadingWidget:  const loading(text: "Syncronizing with the server please wait..."),
                reactionPopupConfig: ReactionPopupConfiguration(
                  backgroundColor: Colors.black54,
                  showGlassMorphismEffect: true,
                  glassMorphismConfig: const GlassMorphismConfiguration(
                    borderColor: Color.fromRGBO(3, 178, 183, 1),
                    backgroundColor: Colors.black54,
                    strokeWidth: 4,
                  ),
                  userReactionCallback: (message, emoji) {
                    //reaction(message,emoji);
                  },
                ),
                sendMessageConfig: SendMessageConfiguration(

                  closeIconColor: const Color.fromRGBO(3, 178, 183, 1),
                  imagePickerConfiguration: const ImagePickerConfiguration(),
                  imagePickerIconsConfig: const ImagePickerIconsConfiguration(
                    cameraIconColor: Color.fromRGBO(3, 178, 183, 1),
                    galleryIconColor: Color.fromRGBO(3, 178, 183, 1),
                  ),
                  enableGalleryImagePicker: false,
                  enableCameraImagePicker: false,
                  allowRecordingVoice: false,
                  defaultSendButtonColor: const Color.fromRGBO(3, 178, 183, 1),
                  textFieldConfig: TextFieldConfiguration(

                    textStyle: GoogleFonts.aBeeZee(
                      fontSize: size.width * 0.04,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    contentPadding: EdgeInsets.all(size.width * 0.04),
                  ),

                ),
                chatViewState: ChatViewState.hasMessages,
                chatBubbleConfig: ChatBubbleConfiguration(
                  maxWidth: size.width * 0.6,
                  receiptsWidgetConfig: const ReceiptsWidgetConfig(
                    showReceiptsIn: ShowReceiptsIn.all,
                  ),
                  outgoingChatBubbleConfig: ChatBubble(

                      senderNameTextStyle: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.04,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ), // demonstrates as current user chat bubble
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                          vertical: size.height * 0.005),
                      linkPreviewConfig: LinkPreviewConfiguration(
                        loadingColor: Colors.grey,
                        linkStyle: GoogleFonts.exo(
                          color: Colors.deepPurple,
                          decoration: TextDecoration.underline,
                        ),
                        //proxyUrl: "Proxy URL", // Need for web
                        backgroundColor: const Color(0xff272336),
                        bodyStyle: const TextStyle(color: Colors.white),
                        titleStyle: const TextStyle(color: Colors.white),
                      ),
                      color: const Color.fromRGBO(3, 178, 183, 1),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(3),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      textStyle: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.035,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                  inComingChatBubbleConfig: ChatBubble(
                    // demonstrates as current user chat bubble
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                          vertical: size.height * 0.005),
                      linkPreviewConfig: LinkPreviewConfiguration(
                        loadingColor: Colors.grey,
                        linkStyle: GoogleFonts.exo(
                          color: Colors.deepPurple,
                          decoration: TextDecoration.underline,
                        ),
                        proxyUrl: "Proxy URL", // Need for web
                        backgroundColor: const Color(0xff272336),
                        bodyStyle: const TextStyle(color: Colors.white),
                        titleStyle: const TextStyle(color: Colors.white),
                      ),
                      color: const Color.fromRGBO(221, 227, 239, 1),
                      senderNameTextStyle: GoogleFonts.aBeeZee(
                          color: const Color.fromRGBO(3, 178, 183, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.03),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(3),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      textStyle: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.035,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      )),

                ),

                // Add this state once data is available.

                messageConfig: MessageConfiguration(
                  messageReactionConfig: MessageReactionConfiguration(
                      backgroundColor: Colors.black54,
                      borderColor: const Color.fromRGBO(3, 178, 183, 1),
                      borderWidth: 1.5,
                      reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
                          backgroundColor: Colors.black87,
                          reactedUserTextStyle: GoogleFonts.tiltNeon(
                            color: Colors.black,
                            //const Color.fromRGBO(150, 150, 150, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.04,
                          ),
                          reactionWidgetDecoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                          reactionSize: size.width * 0.06),
                      margin: EdgeInsets.only(
                          top: size.height * 0.01, left: size.width * 0.04)),
                ),
                repliedMessageConfig: RepliedMessageConfiguration(
                  repliedMsgAutoScrollConfig: const RepliedMsgAutoScrollConfig(
                    enableHighlightRepliedMsg: true,
                    enableScrollToRepliedMsg: true,
                    highlightScrollCurve: accelerateEasing,
                    highlightColor: Colors.green,
                    highlightScrollDuration: Duration(milliseconds: 100),
                  ),
                  textStyle: GoogleFonts.aBeeZee(
                    fontSize: size.width * 0.03,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  verticalBarColor:
                  const Color.fromRGBO(3, 178, 183, 1).withOpacity(0.5),
                  backgroundColor:
                  const Color.fromRGBO(3, 178, 183, 1).withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  replyTitleTextStyle: GoogleFonts.aBeeZee(
                    fontSize: size.width * 0.032,
                    color: const Color.fromRGBO(3, 178, 183, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ),
              )
            :
                const SizedBox();
          },

        ),
      ),
    );
  }
}
