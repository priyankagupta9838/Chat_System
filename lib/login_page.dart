import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(left: size.width*0.04,right:size.width*0.04 ),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size.height*0.5)),
          border: Border.all(
            color: Colors.black,

          ),
          color: Colors.blue,
          boxShadow: const [
            BoxShadow(
                blurRadius: 20,
                blurStyle: BlurStyle.outer,
                color: Colors.white,
                offset: Offset(1, 1))
          ],
        ),
        height: size.height * 1,
        width: size.width * 1,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText("LOGIN",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.black, fontSize: size.width * 0.08))
                ],
              ),
            ),
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [AutoSizeText("Please login your account")],
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                ),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 20,
                      blurStyle: BlurStyle.outer,
                      color: Colors.white,
                      offset: Offset(1, 1))
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.person,
                    color: Colors.black,
                  ),
                  hintText: "Enter name",
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                ),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 20,
                      blurStyle: BlurStyle.outer,
                      color: Colors.white,
                      offset: Offset(1, 1))
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.padlock,
                    color: Colors.black,
                  ),
                  hintText: "Enter name",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: AutoSizeText("Forgotten Password",
                        style: GoogleFonts.aBeeZee(color: Colors.black)))
              ],
            ),
            SizedBox(
              height: size.height*0.4,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){}, child: AutoSizeText(
                      "SIGN UP",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.green.shade900
                        ),

                    ),

                    ),
                  Icon(Icons.send_outlined,
                      color: Colors.green.shade900
                  )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
