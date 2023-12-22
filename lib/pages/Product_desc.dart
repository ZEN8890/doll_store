// Import the necessary packages
// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doll_store/provider/cartprovider.dart';
import 'package:provider/provider.dart';

class PrdctDesc extends StatefulWidget {
  final Map<String, dynamic> item;
  final String imageUrl;

  const PrdctDesc({super.key, required this.item, required this.imageUrl});

  @override
  _PrdctDescState createState() => _PrdctDescState();
}

class _PrdctDescState extends State<PrdctDesc> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            //menampilkan item name sesuai dengan index
            "${widget.item['Item Name']}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 233, 224, 224),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 239, 71, 127),
          titleTextStyle: const TextStyle(fontStyle: FontStyle.italic),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 20),
                //menampilkan deskripsi item
                Text(
                  'Item desc: ${widget.item['Item desc']}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'price: ${widget.item['price']}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    final cartProvider =
                        Provider.of<CartProvider>(context, listen: false);
                    cartProvider.addToCart(widget.item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item added to cart'),
                        duration: Duration(milliseconds: 800),
                      ),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
