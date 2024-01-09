import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height:size.height*1,
      width: size.width*1,
      color: Colors.black87,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: size.height*0.3,
              width: size.width,
              color: Colors.deepPurpleAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: ()
                        {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_rounded,color: Colors.white,size: size.width*0.08,)
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.021,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.055),
                    child: SizedBox(
                      child: AutoSizeText(
                        "General Knowledge",
                        style: GoogleFonts.openSans(
                            fontSize: size.height*0.035,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.055),
                    child: SizedBox(
                      child: AutoSizeText(
                        "Qs Attempted  0 / 10",
                        style: GoogleFonts.openSans(
                            fontSize: size.height*0.016,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.015,
                  ),
                  Padding(
                    padding:  EdgeInsets.all(size.height*0.03),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: size.width*0.1),
                              child: CircleAvatar(
                                  radius: size.height*0.02,
                                backgroundColor: Colors.purple.shade400,
                                  child: const AutoSizeText((
                                      "C"
                                  )),

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: size.width*0.05),
                              child: CircleAvatar(
                                radius: size.height*0.02,
                                backgroundColor: Colors.cyan,
                                child: const AutoSizeText((
                                "A"
                                )),
                              ),
                            ),

                            CircleAvatar(
                              radius: size.height*0.02,
                              backgroundColor: Colors.pinkAccent,
                                child: const AutoSizeText((
                                    "B"
                                ))
                            ),


                          ],
                        ),
                        SizedBox(width: size.width*0.05,),
                        AutoSizeText("10.2 Lac Student",
                          style: GoogleFonts.openSans(
                              fontSize: size.height*0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),)

                          ],
                    ),
                  ),


                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: size.height*0.01,
              right: size.height*0.01,top: size.height*0.02),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: size.height*0.04,
                        width: size.width*0.01,
                        color: Colors.blue.shade900,
                      ),
                      SizedBox(width: size.width*0.04,),
                      AutoSizeText("Suggested Practice",
                        style: GoogleFonts.openSans(
                            fontSize: size.height*0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),

                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height*0.22,
                    width: size.width*1,
                    child: Card(
                      color: Colors.black,
                      elevation: 10,
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(size.height*0.015),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: size.height*0.035,
                                  width: size.width*0.13,

                                  child: const Card(

                                    elevation: 2,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                    color: CupertinoColors.activeGreen,
                                    child: AutoSizeText("FREE"),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width*0.03,
                                ),
                                AutoSizeText("PYP Question", style: GoogleFonts.openSans(
                                    fontSize: size.height*0.02,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),)
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText("50 Qs.",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height*0.01,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700
                                ),

                              ),
                              LinearPercentIndicator(
                                width:size.width*0.5,
                                lineHeight: size.height*0.005,
                                percent: 0,
                                backgroundColor: Colors.white12,
                               ),
                              AutoSizeText("English,Hindi",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height*0.01,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700
                                ),

                              ),
                            ],
                          ),
                    Padding(
                      padding:  EdgeInsets.only(left: size.height*0.02,right: size.height*0.02),
                      child: Divider(

                      color: Colors.grey.shade800,
                      height: MediaQuery.of(context).size.height*0.03,
                      thickness: MediaQuery.of(context).size.height*0.001,
                       ),
                    ),
                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left:size.height*0.03,
                                top: size.height*0.01,bottom: size.height*0.01),
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: size.width*0.1),
                                          child: CircleAvatar(
                                            radius: size.height*0.02,
                                            child: const AutoSizeText((
                                                "C"
                                            )),
                                            backgroundColor: Colors.purple.shade400,

                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: size.width*0.05),
                                          child: CircleAvatar(
                                            radius: size.height*0.02,
                                            backgroundColor: Colors.cyan,
                                            child: const AutoSizeText((
                                                "A"
                                            )),
                                          ),
                                        ),

                                        CircleAvatar(
                                            radius: size.height*0.02,
                                            backgroundColor: Colors.pinkAccent,
                                            child: const AutoSizeText((
                                                "B"
                                            ))
                                        ),


                                      ],
                                    ),
                                    SizedBox(width: size.width*0.03,),
                                    AutoSizeText("694+ Completed this",
                                      style: GoogleFonts.openSans(
                                          fontSize: size.height*0.01,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),)

                                  ],
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: size.height*0.01,
                  right: size.height*0.01,top: size.height*0.02),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: size.height*0.04,
                        width: size.width*0.01,
                        color: Colors.blue.shade900,
                      ),
                      SizedBox(width: size.width*0.04,),
                      AutoSizeText("All Chapters",
                        style: GoogleFonts.openSans(
                            fontSize: size.height*0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),

                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height*0.4,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,

                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return  SizedBox(
                          height: size.height*0.15,
                          width: size.width*1,
                          child: Card(
                              color: Colors.black,
                              elevation: 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText("Mixed Qs (Most Challenging)",

                                        style: GoogleFonts.openSans(
                                            fontSize: size.height*0.02,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      AutoSizeText("50 practice Qs",

                                        style: GoogleFonts.openSans(
                                            fontSize: size.height*0.01,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width:size.width*0.07,),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: size.height*0.0),
                                    child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.forward,
                                      color: Colors.white,
                                    )),
                                  )
                                ],
                              )
                          ),
                        );
                      },),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}