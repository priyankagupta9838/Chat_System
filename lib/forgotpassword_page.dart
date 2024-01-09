import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: size.height * 1,
          width: size.width * 1,
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
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: size.height*0.02,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: size.width*0.04,
                          ),
                          CircleAvatar(
                            radius: size.height*0.02,
                            backgroundColor: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AutoSizeText("talkto.me",

                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: size.height*0.03,
                            fontWeight: FontWeight.w700),
                      )

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Container(
                height: size.height * 0.62,
                width: size.width * 1,
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [


                      TextFormField(
                        validator: (value) {
                          if (value!.contains('@')) {
                            return null;
                          } else {
                            return 'Please enter a valid email address';
                          }
                        },
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
                            Icons.mail_outline_outlined,
                            color: Colors.black,
                          ),
                          hintText: "E-mail",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_key.currentState!.validate())
                          {
                            String test=await forgot(emailController.text.trim());
                            if(!mounted) return;
                            if(test=="1"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
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
                                  description: test,
                                  leading: const Icon(
                                    Icons.error_outline_outlined,
                                    color: Colors.red,
                                    size: 55,
                                  )
                              );
                            }
                          }

                        },
                        child: Container(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  "Send Email",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {},
                            child: const AutoSizeText("or Sign in with")),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
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
                                height: size.height * 0.065,
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
                        height: size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText("Already have account? ",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),

                          ),
                          TextButton(
                              onPressed: () {

                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
                              },
                              child: AutoSizeText(
                                "Sign up ",
                                style: GoogleFonts.aBeeZee(
                                    color: CupertinoColors.activeGreen,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> forgot(String email) async {
    try {
      await  FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "1";
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.toString().split(']')[1].trim();
    }
  }
}
