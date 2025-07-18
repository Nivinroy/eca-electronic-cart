import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailList extends StatefulWidget {
  final String title;
  final String detail;
  final CrossAxisAlignment alignment;
  const DetailList(
      {super.key,
      required this.title,
      required this.detail,
      required this.alignment});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: widget.alignment,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.raleway(color: Colors.grey),
        ),
        Row(
          children: [
            Text(
              widget.detail,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
