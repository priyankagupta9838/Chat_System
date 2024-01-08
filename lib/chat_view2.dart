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
  bool isDarkTheme = false;
  final currentUser = ChatUser(
    id: '1',
    name: 'Flutter',
    profilePhoto: "assets/images/profile.jpg",
  );
  final _chatController = ChatController(
    initialMessageList: [],
    scrollController: ScrollController(),
    chatUsers: [
      ChatUser(
        id: '2',
        name: 'Simform',
        profilePhoto: "assets/images/profile.jpg",
      ),
      ChatUser(
        id: '3',
        name: 'Jhon',
        profilePhoto: "assets/images/profile.jpg",
      ),
      ChatUser(
        id: '4',
        name: 'Mike',
        profilePhoto: "assets/images/profile.jpg",
      ),
      ChatUser(
        id: '5',
        name: 'Rich',
        profilePhoto: "assets/images/profile.jpg",
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("ChatSystem").doc("AruPriya").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return SizedBox(
            height: size.height * 1,
            width: size.width * 1,
            child: ChatView(
              currentUser: currentUser,
              chatController: _chatController,
              onSendTap: _onSendTap,
              featureActiveConfig: const FeatureActiveConfig(
                lastSeenAgoBuilderVisibility: true,
                receiptsBuilderVisibility: true,
              ),
              chatViewState: ChatViewState.hasMessages,
              chatViewStateConfig: ChatViewStateConfiguration(
                loadingWidgetConfig: const ChatViewStateWidgetConfiguration(
                  loadingIndicatorColor: Colors.blue,
                ),
                onReloadButtonTap: () {},
              ),
              typeIndicatorConfig: const TypeIndicatorConfiguration(
                  flashingCircleBrightColor: Colors.blue,
                  flashingCircleDarkColor: Colors.purpleAccent),
              appBar: const ChatViewAppBar(
                elevation: 0,
                backGroundColor: Colors.brown,
                profilePicture:"",
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
                imagePickerIconsConfig: const ImagePickerIconsConfiguration(
                  cameraIconColor: Colors.black,
                  galleryIconColor: Colors.black,
                ),
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
                micIconColor: Colors.blue,
                voiceRecordingConfiguration: const VoiceRecordingConfiguration(
                  backgroundColor: Colors.yellow,
                  recorderIconColor: Colors.cyanAccent,
                  waveStyle: WaveStyle(
                    showMiddleLine: false,
                    waveColor: Colors.white,
                    extendWaveform: true,
                  ),
                ),
              ),
              chatBubbleConfig: ChatBubbleConfiguration(
                outgoingChatBubbleConfig: const ChatBubble(
                  linkPreviewConfig: LinkPreviewConfiguration(
                    backgroundColor: Colors.white,
                    bodyStyle: TextStyle(fontSize: 10),
                    titleStyle: TextStyle(fontSize: 5),
                  ),
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
              replyPopupConfig: const ReplyPopupConfiguration(
                backgroundColor: Colors.white,
                buttonTextStyle: TextStyle(color: Colors.black),
                topBorderColor: Colors.black,
              ),
              reactionPopupConfig: ReactionPopupConfiguration(
                shadow: BoxShadow(
                  color: isDarkTheme ? Colors.black54 : Colors.grey.shade400,
                  blurRadius: 20,
                ),
                backgroundColor: Colors.white,
              ),
              messageConfig: MessageConfiguration(
                messageReactionConfig: MessageReactionConfiguration(
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  reactedUserCountTextStyle: const TextStyle(color: Colors.black),
                  reactionCountTextStyle: const TextStyle(color: Colors.black),
                  reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
                    backgroundColor: Colors.white,
                    reactedUserTextStyle: const TextStyle(
                      color: Colors.cyan,
                    ),
                    reactionWidgetDecoration: BoxDecoration(
                      color: Colors.cyan,
                      boxShadow: [
                        BoxShadow(
                          color: isDarkTheme ? Colors.black12 : Colors.grey.shade200,
                          offset: const Offset(0, 20),
                          blurRadius: 40,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                imageMessageConfig: ImageMessageConfiguration(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  shareIconConfig: ShareIconConfiguration(
                    defaultIconBackgroundColor: Colors.white,
                    defaultIconColor: Colors.black,
                  ),
                ),
              ),
              profileCircleConfig: const ProfileCircleConfiguration(
                profileImageUrl: "",
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
          );
        },

      ),
    );
  }

  Future<void> _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) async {
    // final id = int.parse(messageList.last.id) + 1;
    const id = 1;
    _chatController.addMessage(
      Message(
        id: id.toString(),
        createdAt: DateTime.now(),
        message: message,
        sendBy: currentUser.id,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _chatController.initialMessageList.last.setStatus =
          MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      _chatController.initialMessageList.last.setStatus = MessageStatus.read;
    });


  }
}
