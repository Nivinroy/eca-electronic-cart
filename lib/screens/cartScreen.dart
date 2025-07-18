import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttote/components/cartItem.dart';
import 'package:smarttote/model/productData.dart';

class CartScreen extends StatefulWidget {
  final List<ProductData> cartList;
  const CartScreen({super.key, required this.cartList});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20, top: 45, right: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Builder(
                    builder: (BuildContext context) {
                      if (widget.cartList.length == 0) {
                        return Center(
                          child: Text('Add products'),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: widget.cartList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CartItem(data: widget.cartList[index]),
                                const SizedBox(
                                  height: 0,
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Proceed to Payment',
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        letterSpacing: 0,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                    size: 25,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
