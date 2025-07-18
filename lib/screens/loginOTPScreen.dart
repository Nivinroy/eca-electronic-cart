import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginOTPScreen extends StatefulWidget {
  final String email;
  const LoginOTPScreen({super.key, required this.email});

  @override
  State<LoginOTPScreen> createState() => _LoginOTPScreenState();
}

class _LoginOTPScreenState extends State<LoginOTPScreen> {
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
                        "Hey, ${widget.email}",
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
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 45),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
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
          onPressed: () async {},
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
    );
  }
}
