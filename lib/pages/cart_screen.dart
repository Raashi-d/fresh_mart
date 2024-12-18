import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'checkout_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Set the height you want
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
            child: Container(
              width: 40, // Set the width you want
              height: 40, // Set the height you want
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.8),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.green,
                  size: 20,
                ),
              ),
            ),
          ),
          title: Text(
            'Your Cart',
            style: GoogleFonts.anton(color: Colors.white, fontSize: 28),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.items[index];
                      final quantity = cartProvider.getQuantity(item);

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset('assets/${item.image}',
                                width: 50, height: 50, fit: BoxFit.cover),
                          ),
                          title: Text(item.name),
                          subtitle:
                              Text('Rs. ${item.price.toStringAsFixed(2)} / Kg'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Decrease item quantity
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  cartProvider.removeFromCart(item);
                                },
                              ),
                              Text(
                                '$quantity',
                                style: const TextStyle(fontSize: 18),
                              ),
                              // Increase item quantity
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  cartProvider.addToCart(item);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
                // Display total cart value
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Total: Rs.${cartProvider.getTotalPrice().toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // Proceed to checkout button
                      ElevatedButton(
                        onPressed: cartProvider.items.isNotEmpty
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CheckoutScreen(),
                                  ),
                                );
                              }
                            : null,
                        child: const Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
