import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// All card items
    var cartItems = context.watch<CartProvider>().getCartItems();

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: cartItems.isNotEmpty
          ? ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                var cartItem = cartItems[index];
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.asset(
                        cartItem.image,
                        height: 200,
                        width: 200,
                        fit: BoxFit.contain,
                      ),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            cartItem.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '₹ ${cartItem.price.toStringAsFixed(0)}',
                            style: TextStyle(fontSize: 18),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<CartProvider>().removeFromCart(
                                cartItem,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text('Remove'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(child: Text('Card is empty.', style: TextStyle(fontSize: 22),), ),
    );
  }
}
