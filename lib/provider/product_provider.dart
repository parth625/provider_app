import 'package:flutter/widgets.dart';
import 'package:provider_app/task/product.dart';

class ProductProvider extends ChangeNotifier{

  /// List of products
  // final List<Product> _products = [
  //   Product(
  //     id: '1',
  //     name: "Iphone 15",
  //     price: 69000,
  //     image: 'assets/images/iphone.webp',
  //   ),
  //   Product(
  //     id: '2',
  //     name: "Samsung A55",
  //     price: 45999,
  //     image: 'assets/images/samsung.jpg',
  //   ),
  //   Product(
  //     id: '3',
  //     name: "Vivo T4x",
  //     price: 14999,
  //     image: 'assets/images/vivo.webp',
  //   ),
  //   Product(
  //     id: '4',
  //     name: "Nothing phone 3a",
  //     price: 32999,
  //     image: 'assets/images/nothing.jpeg',
  //   ),
  // ];

  final List<Product> _products = [
    Product(
      id: '1',
      name: "iPhone 15",
      price: 69000,
      image: 'assets/images/iphone.webp',
    ),
    Product(
      id: '2',
      name: "Samsung Galaxy A55",
      price: 45999,
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
      name: "Nothing Phone 3a",
      price: 32999,
      image: 'assets/images/nothing.jpeg',
    ),
    Product(
      id: '5',
      name: "OnePlus Nord CE 3",
      price: 26999,
      image: 'assets/images/oneplus.jpeg',
    ),
    Product(
      id: '6',
      name: "Redmi Note 13 Pro",
      price: 23999,
      image: 'assets/images/redmi.jpeg',
    ),
    Product(
      id: '7',
      name: "Realme GT Neo 3",
      price: 29999,
      image: 'assets/images/realme.png',
    ),
    Product(
      id: '8',
      name: "Motorola Edge 40",
      price: 24999,
      image: 'assets/images/motorola.png',
    ),
    Product(
      id: '9',
      name: "Google Pixel 7a",
      price: 43999,
      image: 'assets/images/pixel.jpeg',
    ),
    Product(
      id: '10',
      name: "iQOO Neo 7",
      price: 31999,
      image: 'assets/images/iqoo.jpg',
    ),
  ];


  /// Fetch all the products
  List<Product> getProductList(){
    return _products;
  }
}