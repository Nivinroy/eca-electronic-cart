import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttote/screens/homeScreen.dart';

class RegistrationConfirmation extends StatefulWidget {
  final String name;
  final String email;
  const RegistrationConfirmation(
      {super.key, required this.name, required this.email});

  @override
  State<RegistrationConfirmation> createState() =>
      _RegistrationConfirmationState();
}

class _RegistrationConfirmationState extends State<RegistrationConfirmation> {
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
                        "${widget.email}",
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
                          'Welcome to Smart Tote,\nAccount Created Successfully!',
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
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.raleway(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.name,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    'lib/assets/success-bw.png',
                    scale: 1,
                    fit: BoxFit.cover,
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
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        name: widget.name,
                        email: widget.email,
                      )),
              (Route<dynamic> route) => false,
            );
          },
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
    );
  }
}
