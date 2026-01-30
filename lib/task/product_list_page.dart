import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/cart_provider.dart';
import 'package:provider_app/provider/product_provider.dart';
import 'package:provider_app/task/cart_page.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('Product build method');
    var products = context.read<ProductProvider>().getProductList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Product List Page'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                icon: Icon(CupertinoIcons.cart),
              ),
              Consumer<CartProvider>(
                builder: (_, cart, _) {
                  return Positioned(
                    right: 5,
                    child: Text('${cart.getTotalCartItem()}'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];

          return Card(
            elevation: 3,
            color: Colors.white,
            child: Row(
              children: [
                Image.asset(
                  product.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('₹ ${product.price}', style: TextStyle(fontSize: 18)),
                    Consumer(
                      builder: (ctx, _, _) {
                        bool isExists = ctx.watch<CartProvider>().isItemExists(
                          product.id,
                        );
                        return ElevatedButton(
                          onPressed: () {
                            if (!isExists) {
                              ctx.read<CartProvider>().addToCart(product);

                              log('${product.name} added');

                              // context.read<CartProvider>().increaseLength();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(isExists ? 'Added' : 'Add to Cart'),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
