import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smarttote/model/userData.dart';
import 'package:smarttote/screens/registrationConfirmation.dart';
import 'package:smarttote/data/userDetails.dart';

class PasswordScreen extends StatefulWidget {
  final String name;
  final String email;
  const PasswordScreen({super.key, required this.name, required this.email});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passwordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
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
                        "Welcome! ${widget.name}",
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
                          'set your password to continue with account creation',
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
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0),
                      //controller: emailController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        label: Text(
                          'enter password',
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
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0),
                      //controller: emailController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        label: Text(
                          'confirm password',
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
                    height: 10,
                  ),
                  FlutterPwValidator(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 180,
                      minLength: 8,
                      uppercaseCharCount: 1,
                      lowercaseCharCount: 1,
                      numericCharCount: 1,
                      specialCharCount: 1,
                      successColor: Colors.black,
                      failureColor: Colors.grey,
                      onSuccess: () {
                        setState(() {
                          passwordValid = true;
                        });
                      },
                      onFail: () {
                        setState(() {
                          passwordValid = false;
                        });
                      },
                      controller: passwordController),
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
            if (passwordValid) {
              if (passwordController.text == confirmPasswordController.text) {
                UserData newUser = UserData(
                    widget.name, widget.email, passwordController.text.trim());
                bool userExists = checkUserExist(widget.email);
                if (userExists) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        "User already exists",
                      )));
                } else {
                  users.add(newUser);
                  Navigator.push(
                      context,
                      PageTransition(
                          child: RegistrationConfirmation(
                              name: widget.name, email: widget.email),
                          type: PageTransitionType.rightToLeft));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      "Passwords do not match",
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
                    'Enter valid password',
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
