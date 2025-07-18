import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smarttote/screens/loginScreen.dart';

class SettingsScreen extends StatefulWidget {
  final String name;
  final String email;
  const SettingsScreen({super.key, required this.name, required this.email});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(
                          'lib/assets/grid.png',
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.65)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'lib/assets/user.png',
                        scale: 6,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        widget.name,
                        style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0,
                            fontSize: 16),
                      ),
                      Text(
                        widget.email,
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                      Spacer(),
                      Text(
                        'ABCD1234',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ],
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 45),
              color: Colors.black,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: LoginScreen(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(39, 255, 255, 255),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.red)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text(
                                'Log Out',
                                style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Icon(
                                Icons.logout,
                                color: Colors.red,
                              )
                            ],
                          ),
                        )),
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
