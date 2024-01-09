import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_system/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_view2.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height * 1,
        width: size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.09),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(size.width * 0.3),
                        bottomRight: Radius.circular(size.width * 0.3),
                        topRight: Radius.circular(size.width * 0.3)),
                    border: Border.all(
                      color: Colors.greenAccent,
                    ),
                    color: CupertinoColors.activeGreen,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 20,
                          blurStyle: BlurStyle.outer,
                          color: Colors.greenAccent,
                          offset: Offset(1, 1))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: size.height * 0.02,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          CircleAvatar(
                            radius: size.height * 0.02,
                            backgroundColor: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AutoSizeText(
                        "talkto.me",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: size.height * 0.03,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                width: size.width * 1,
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        prefixIcon: Icon(
                          CupertinoIcons.person,
                          color: Colors.black,
                        ),
                        hintText: "Name",
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                     TextField(
                       controller: emailController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        prefixIcon: Icon(
                          CupertinoIcons.mail,
                          color: Colors.black,
                        ),
                        hintText: "E-mail",
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextField(
                      controller: passController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.activeGreen)),
                        prefixIcon: Icon(
                          Icons.key_outlined,
                          color: Colors.black,
                        ),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                        height: size.height * 0.065,
                        width: size.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                size.height * 0.05,
                              ),
                              bottomRight: Radius.circular(
                                size.height * 0.05,
                              ),
                              bottomLeft: Radius.circular(
                                size.height * 0.05,
                              )),
                          color: CupertinoColors.activeGreen,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: CupertinoColors.activeGreen,),
                          onPressed: () async {
                            if (emailController.text.trim().isNotEmpty) {
                              String temp = await signIn(
                                  emailController.text.trim(),
                                  passController.text.trim());
                              await FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification();
                              final record = await FirebaseFirestore.instance
                                  .collection("User")
                                  .doc("Email")
                                  .get();
                              record.exists
                                  ? await FirebaseFirestore.instance
                                      .collection("User")
                                      .doc("Email")
                                      .update({
                                      "Email": FieldValue.arrayUnion([
                                        FirebaseAuth.instance.currentUser?.email
                                      ])
                                    })
                                  : await FirebaseFirestore.instance
                                      .collection("User")
                                      .doc("Email")
                                      .set({
                                      "Email": FieldValue.arrayUnion([
                                        FirebaseAuth.instance.currentUser?.email
                                      ])
                                    });
                              if(temp=='1'){
                              InAppNotifications.instance
                              ..titleFontSize = 14.0
                              ..descriptionFontSize = 14.0
                              ..textColor = Colors.black
                              ..backgroundColor = const Color.fromRGBO(150, 150, 150, 1)
                              ..shadow = true
                              ..animationStyle = InAppNotificationsAnimationStyle.scale;
                              InAppNotifications.show(
                              title: 'Successfully',
                              duration: const Duration(seconds: 2),
                              description: 'Your account is created successfully. Please verify your email',
                              leading: const Icon(
                              Icons.error_outline_outlined,
                              color: Colors.red,
                              size: 55,
                              )
                              );
                              }


                              else{
                              InAppNotifications.instance
                              ..titleFontSize = 14.0
                              ..descriptionFontSize = 14.0
                              ..textColor = Colors.black
                              ..backgroundColor = const Color.fromRGBO(150, 150, 150, 1)
                              ..shadow = true
                              ..animationStyle = InAppNotificationsAnimationStyle.scale;
                              InAppNotifications.show(
                              title: 'Failed',
                              duration: const Duration(seconds: 2),
                              description: temp,
                              leading: const Icon(
                              Icons.error_outline_outlined,
                              color: Colors.red,
                              size: 55,
                              )
                              );
                              }
                            }
                            else{
                            InAppNotifications.instance
                            ..titleFontSize = 14.0
                            ..descriptionFontSize = 14.0
                            ..textColor = Colors.black
                            ..backgroundColor =
                            const Color.fromRGBO(150, 150, 150, 1)
                            ..shadow = true
                            ..animationStyle =
                            InAppNotificationsAnimationStyle.scale;
                            InAppNotifications.show(
                            title: 'Failed',
                            duration: const Duration(seconds: 2),
                            description: "Email id can not be empty",
                            leading: const Icon(
                            Icons.error_outline_outlined,
                            color: Colors.red,
                            size: 55,
                            ));
                            }
                          },
                          child: AutoSizeText(
                            "Sign Up",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: const AutoSizeText("or Sign in with")),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                              height: size.height * 0.065,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(
                                      size.height * 0.05,
                                    ),
                                    bottomLeft: Radius.circular(
                                      size.height * 0.05,
                                    ),
                                    topLeft: Radius.circular(
                                      size.height * 0.05,
                                    )),
                                color: Colors.greenAccent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.facebook,
                                    color: Colors.green.shade900,
                                  ),
                                  AutoSizeText(
                                    "Facebook",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              height: size.height * 0.064,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      size.height * 0.05,
                                    ),
                                    bottomRight: Radius.circular(
                                      size.height * 0.05,
                                    ),
                                    bottomLeft: Radius.circular(
                                      size.height * 0.05,
                                    )),
                                color: Colors.greenAccent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.g_mobiledata,
                                    color: Colors.green.shade900,
                                  ),
                                  AutoSizeText(
                                    "Google",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Already have account? ",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ));
                            },
                            child: AutoSizeText(
                              "Sign In ",
                              style: GoogleFonts.aBeeZee(
                                  color: CupertinoColors.activeGreen,
                                  fontWeight: FontWeight.w700),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("User Created");
      return "1";
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.toString().split(']')[1].trim();
    }
  }
}
