import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smarttote/components/cartItem.dart';
import 'package:smarttote/model/productData.dart';
import 'package:smarttote/screens/cartScreen.dart';
import 'package:smarttote/screens/paymentScreen.dart';
import 'package:smarttote/screens/productDetailScreen.dart';
import 'package:smarttote/screens/settingsScreen.dart';
import 'package:smarttote/data/productDetails.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String email;
  const HomeScreen({super.key, required this.name, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int itemCount = 0;
  double totalPrice = 0;
  bool scanButtonTapped = false;

  String productName = '';
  String productDescription = '';
  double productRating = 0;
  String productQuantity = '';

  String _productCodeFromNFC = '';

ProductData getProduct(String productCode) {
  print('Searching for product code: $productCode');

  // Check specifically for "ST0001"
  if (productCode.trim().toString() == "ST0001") {
    print('Match found for code: ST0001');
    return products[0]; // Return the first product
  }else if (productCode.trim().toString() == "ST0002") {
    print('Match found for code: ST0002');
    return products[1]; // Return the first product
  } else {
    print('Returning second product for code: $productCode');
    return products[2]; // Return the second product
  }
}


  List<ProductData> cart = [];

  void _readNfcTag() {
  print('Starting NFC Tag Reading Session...');
  NfcManager.instance.startSession(onDiscovered: (NfcTag badge) async {
    try {
      var ndef = Ndef.from(badge);
      print('Raw NFC Data: ${badge.data}');

      if (ndef != null && ndef.cachedMessage != null) {
        String productCodeRecord = "";
        for (var record in ndef.cachedMessage!.records) {
          // Ensure payload is valid
          if (record.payload.isEmpty) {
            print('Empty payload in record.');
            continue;
          }

          // Debugging: Print entire payload
          print('Payload data: ${record.payload}');

          // Extract text payload (skip language code bytes)
          int langCodeLength = record.payload[0]; // First byte is language length
          String extractedText = String.fromCharCodes(record.payload.sublist(langCodeLength + 1));

          print('Extracted NFC Text: $extractedText'); // Debugging log
          productCodeRecord = extractedText;
        }

        String productCode = productCodeRecord.trim();
        print('Extracted Product Code: $productCode'); // Debugging log

        // Fetch product data
        ProductData product = getProduct(productCode);
        if (product.productName.isNotEmpty && product.productName != 'Error') {
          print('Fetched Product Data: ${product.productName}'); // Debugging log

          setState(() {
            _productCodeFromNFC = product.productCode;
            productName = product.productName;
            productDescription = product.productDescription;
            productQuantity = product.productQuantity.toString();
            productRating = product.productRating;
            itemCount++;
            cart.add(product);

            // Update total price
            totalPrice = cart.fold(0, (sum, item) => sum + item.productPrice);
            print('Updated Cart: ${cart.length} items, Total Price: ₹$totalPrice');
          });
        } else {
          print('No product found for the given code.');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.white,
              content: Text(
                'No product found',
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        }
      } else {
        print('NFC Tag does not contain valid NDEF message.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.black,
            content: Text(
              'Tap the button again',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } catch (e) {
      print('Error reading NFC tag: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error: ${e.toString()}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    } finally {
      NfcManager.instance.stopSession();
      print('NFC Session stopped.');
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NfcManager.instance.isAvailable(),
        builder: ((context, snapshot) {
          if (snapshot.data == false) {
            return Scaffold(
              body: Center(
                child: Text('NFC not available'),
              ),
            );
          } else {
            return Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('lib/assets/grid.png'),
                                  fit: BoxFit.cover,
                                  opacity: 0.65)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.name}',
                                          style: GoogleFonts.raleway(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Vazhakulam',
                                                  style: GoogleFonts.raleway(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.arrow_right_alt,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: SettingsScreen(
                                                  name: widget.name,
                                                  email: widget.email,
                                                ),
                                                type: PageTransitionType
                                                    .bottomToTop));
                                      },
                                      child: Icon(
                                        Icons.settings,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child:
                                                    CartScreen(cartList: cart),
                                                type: PageTransitionType
                                                    .rightToLeft));
                                      },
                                      child: Icon(
                                        Icons.shopping_cart_checkout,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Column(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Price',
                                          style: GoogleFonts.raleway(
                                              color: Color.fromARGB(
                                                  255, 90, 90, 90)),
                                        ),
                                        Text(
                                          '₹${totalPrice}',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              letterSpacing: 0),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Item Count',
                                          style: GoogleFonts.raleway(
                                              color: Color.fromARGB(
                                                  255, 90, 90, 90)),
                                        ),
                                        Text(
                                          cart.length.toString(),
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 25),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    _readNfcTag();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Add Product',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                          )),
                      Builder(builder: (BuildContext context) {
                        if (cart.isEmpty) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.60,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 45),
                            decoration: BoxDecoration(color: Colors.black),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Tap on the button to add product',
                                    style:
                                        GoogleFonts.raleway(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.60,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            decoration: BoxDecoration(color: Colors.black),
                            child: ListView.builder(
                              itemCount: cart.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onDoubleTap: () {
                                      setState(() {
                                        cart.removeAt(index);
                                        double rate = 0;
                                        for (var item in cart) {
                                          rate += item.productPrice;
                                        }
                                        totalPrice = rate;
                                      });
                                    },
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: ProductDetailScreen(
                                                data: cart[index],
                                              ),
                                              type: PageTransitionType
                                                  .bottomToTop));
                                    },
                                    child: CartItem(data: cart[index]));
                              },
                            ),
                          );
                        }
                      })
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: PaymentScreen(
                              amount: totalPrice,
                            ),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.payment,
                      color: Colors.black,
                    ),
                  ),
                ));
          }
        }));
  }
}

