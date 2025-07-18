import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smarttote/screens/passwordScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Color.fromARGB(245, 0, 0, 0),
                  //image: DecorationImage(
                  //    image: AssetImage('assets/bg1.jpg'),
                  //    fit: BoxFit.cover,
                  //    opacity: 0.65)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Welcome! Create an account to continue",
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                          'enter your details to proceed with account creation',
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0)),
                    ],
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      controller: fullnameController,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0),
                      //controller: emailController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        label: Text(
                          'full name',
                          style: GoogleFonts.raleway(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0),
                      //controller: emailController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        label: Text(
                          'email',
                          style: GoogleFonts.raleway(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () async {
            Navigator.push(
                context,
                PageTransition(
                    child: PasswordScreen(
                      name: fullnameController.text.trim(),
                      email: emailController.text.trim(),
                    ),
                    type: PageTransitionType.rightToLeft));
          },
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
    );
  }
}
