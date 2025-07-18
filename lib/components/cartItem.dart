import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttote/model/productData.dart';

class CartItem extends StatefulWidget {
  final ProductData data;
  const CartItem({super.key, required this.data});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 132,
          decoration: BoxDecoration(
              color: Color.fromARGB(20, 255, 255, 255),
              border: Border.all(
                  color: const Color.fromARGB(207, 158, 158, 158), width: 1),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/grid.png',
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                      width: 88,
                      height: 114,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/gradient.png'),
                            fit: BoxFit.cover),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.productName,
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.data.productCode,
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            '₹${widget.data.productPrice}',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
