import 'package:smarttote/model/productData.dart';

List<ProductData> products = [
  ProductData(
      'ST0001',
      'Apsara Pencil',
      'Apsara is a leading pencil maker that focus on creating quality products for art lovers',
      'Pack of 10',
      10.0,
      4.5),
  ProductData(
      'ST0002',
      'Apsara Eraser',
      'Apsara is a leading eraser maker that focus on creating quality products for art lovers',
      'Pack of 1',
      15.0,
      4.6),
   ProductData(
      'ST0003',
      'Lays',
      'Lays is the leading chips franchise in India',
      'Pack of 1',
      25.0,
      4.3),
];

void addProduct(ProductData product) {
  products.add(product);
}
