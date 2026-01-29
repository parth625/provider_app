import 'package:flutter/widgets.dart';
import 'package:provider_app/task/product.dart';

class ProductProvider extends ChangeNotifier{

  /// List of products
  final List<Product> _products = [
    Product(
      id: '1',
      name: "Iphone 15",
      price: 69000,
      image: 'assets/images/iphone.webp',
    ),
    Product(
      id: '2',
      name: "Samsung A55",
      price: 700000,
      image: 'assets/images/samsung.jpg',
    ),
    Product(
      id: '3',
      name: "Vivo T4x",
      price: 14999,
      image: 'assets/images/vivo.webp',
    ),
    Product(
      id: '4',
      name: "Nothing phone 3a",
      price: 32999,
      image: 'assets/images/nothing.jpeg',
    ),
  ];

  /// Fetch all the products
  List<Product> getProductList(){
    return _products;
  }
}