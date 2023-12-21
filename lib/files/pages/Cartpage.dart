// ignore_for_file: file_names

import 'package:doll_store/files/provider/cartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double totalPrice = 0;
    for (final item in cartProvider.cart) {
      totalPrice += (item['price'] ?? 0) * (item['quantity'] ?? 0);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doll Store",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 233, 224, 224),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 239, 71, 127),
        titleTextStyle: const TextStyle(fontStyle: FontStyle.italic),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cart.length,
        itemBuilder: (context, index) {
          final item = cartProvider.cart[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              key: ValueKey(item['id']),
              title: Text(item['Item Name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Item price: ${item['price']}'),
                  Text('Quantity: ${item['quantity']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      cartProvider.decreaseQuantity(index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cartProvider.increaseQuantity(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price: IDR${totalPrice.toStringAsFixed(3)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  cartProvider.clearCart();
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
