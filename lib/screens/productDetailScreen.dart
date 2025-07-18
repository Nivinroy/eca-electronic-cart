import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttote/model/productData.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductData data;
  const ProductDetailScreen({super.key, required this.data});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Item Code'),
                      Text(
                        widget.data.productCode,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                            fontSize: 25),
                      )
                    ],
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Item Name'),
                      Text(
                        widget.data.productName,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                            fontSize: 25),
                      )
                    ],
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.data.productDescription,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Item Price'),
                      Text(
                        widget.data.productPrice.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                            fontSize: 25),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Item Rating'),
                      Text(
                        widget.data.productRating.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                            fontSize: 25),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
