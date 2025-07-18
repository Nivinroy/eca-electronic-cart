import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttote/data/userDetails.dart';
import 'package:smarttote/screens/homeScreen.dart';
import 'package:smarttote/screens/registerScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

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
                      Text(
                        'EcA',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        "Welcome back!, you've been missed",
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('enter your email address to proceed',
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
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0),
                      controller: emailController,
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
                  TextField(
                      obscureText: !showPassword,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0),
                      controller: passwordController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: !showPassword
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        label: Text(
                          'password',
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
                  Row(
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.raleway(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: RegisterScreen(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          child: Text(
                            'Create Account',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () async {
            if (emailController.text != '' && passwordController.text != '') {
              if (emailController.text.contains('@gmail.com')) {
                bool userExist = checkUserExist(emailController.text);
                if (userExist) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('loggedIn', true);
                  String name = getName(emailController.text);
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: HomeScreen(
                            name: name,
                            email: emailController.text,
                          ),
                          type: PageTransitionType.rightToLeft));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        'User does not exist',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      'Enter Valid Email ID',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.black,
                  content: Text(
                    'Enter Email ID and Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
    );
  }
}
