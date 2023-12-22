// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:doll_store/pages/Cartpage.dart';
import 'package:doll_store/pages/ProfilePage.dart';
import 'package:doll_store/pages/StorePage.dart';
import 'package:flutter/material.dart';

//menampilkan bottom bar di bawah layar agar user dapat berpindah layar dari home,cart,dan profile
class Store_botnav extends StatelessWidget {
  const Store_botnav({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Store_botnavbar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _Store_botnavbar extends StatefulWidget {
  @override
  _Store_botnavbarState createState() => _Store_botnavbarState();
}

class _Store_botnavbarState extends State<_Store_botnavbar> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> cart = [];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const StorePage(),
      const CartPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
