// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:doll_store/widget/gridview.dart';
import 'package:doll_store/widget/carousel.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});
  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doll Store",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 233, 224, 224))),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 239, 71, 127),
        titleTextStyle: const TextStyle(fontStyle: FontStyle.italic),
      ),
      body: SingleChildScrollView(
        //memberikan kemampuan pada user untuk scroll layar
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 216,
                child: Carousel(),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 500,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Grid(),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
