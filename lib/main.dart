import 'package:doll_store/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doll_store/provider/cartprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MaterialApp(
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
