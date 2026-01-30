import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/task/product.dart';
import '../provider/cart_provider.dart';
import '../provider/product_provider.dart';
import 'cart_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = context.read<ProductProvider>().getProductList();

    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 10),
        title: Text('Products'),
        actions: [_cartActionButton()],
      ),
      body: _buildUI(products),
    );
  }

  Widget _cartActionButton() {
    return IconButton(
      tooltip: "Go to Cart",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
      },
      icon: Badge(
        isLabelVisible: true,
        label: Consumer<CartProvider>(
          builder: (context, cart, _) {
            return Text('${cart.getTotalCartItem()}');
          },
        ),
        offset: const Offset(10, 0),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(CupertinoIcons.shopping_cart, size: 20),
      ),
    );
  }

  Widget _buildUI(List<Product> products) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        Product product = products[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  spreadRadius: 3,
                  offset: Offset.zero,
                  color: Colors.black12,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  '₹ ${product.price.toStringAsFixed(0)}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),

                Consumer<CartProvider>(
                  builder: (context, cart, _) {
                    bool isExists = cart.isItemExists(product.id);
                    return InkWell(
                      onTap: () {
                        if (!isExists) {
                          context.read<CartProvider>().addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product.name} added to cart'),
                              backgroundColor: Colors.green,
                              duration: Duration(milliseconds: 1000),
                            ),
                          );
                          log('${product.name} added');

                          // context.read<CartProvider>().increaseLength();
                        }
                        else{
                          context.read<CartProvider>().removeFromCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product.name} added to cart'),
                              backgroundColor: Colors.red,
                              duration: Duration(milliseconds: 1000),
                            ),
                          );
                        }
                      },
                      child: isExists
                          /// Add to cart button
                          ? Container(
                              height: 30,
                              width: 100,
                              alignment: AlignmentGeometry.center,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(),
                              ),
                              child: Text('Remove'),
                            )
                          : Container(
                              height: 30,
                              width: 150,
                              alignment: AlignmentGeometry.center,

                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('Add to cart'),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
