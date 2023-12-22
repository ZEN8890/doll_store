// ignore_for_file: unused_local_variable, must_be_immutable, use_key_in_widget_constructors

import 'package:doll_store/pages/Product_desc.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';

class Grid extends StatelessWidget {
  final ItemList itemList = ItemList();
  late String randomId;

  Grid({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //gridview adalah sebuah susunan kotak yang dapat discroll
        padding:
            const EdgeInsets.only(bottom: kBottomNavigationBarHeight + 16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: itemList.items.length,
          itemBuilder: (context, index) {
            return GridItem(
              item: itemList.items[index],
              index: index,
              onTap: () {
                String imageUrl = rndomizerImage(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrdctDesc(
                        item: itemList.items[index], imageUrl: imageUrl),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

//item list untuk mengisi index item yang ditampilkan di store
class ItemList {
  final List<Map<String, dynamic>> items = [
    {
      'id': 1,
      'Item Name': 'Item1',
      'Item desc': 'a',
      'price': 7000,
    },
    {
      'id': 2,
      'Item Name': 'Item2',
      'Item desc': 'b',
      'price': 8000,
    },
    {
      'id': 3,
      'Item Name': 'Item3',
      'Item desc': 'c',
      'price': 9000,
    },
    {
      'id': 4,
      'Item Name': 'Item4',
      'Item desc': 'd',
      'price': 10000,
    },
    {
      'id': 5,
      'Item Name': 'Item5',
      'Item desc': 'e',
      'price': 11000,
    },
    {
      'id': 6,
      'Item Name': 'Item6',
      'Item desc': 'f',
      'price': 12000,
    },
    {
      'id': 7,
      'Item Name': 'Item7',
      'Item desc': 'g',
      'price': 13000,
    },
    {
      'id': 8,
      'Item Name': 'Item8',
      'Item desc': 'h',
      'price': 14000,
    },
    {
      'id': 9,
      'Item Name': 'Item9',
      'Item desc': 'i',
      'price': 15000,
    },
    {
      'id': 10,
      'Item Name': 'Item10',
      'Item desc': 'j',
      'price': 16000,
    },
    {
      'id': 11,
      'Item Name': 'Item11',
      'Item desc': 'k',
      'price': 17000,
    },
    {
      'id': 12,
      'Item Name': 'Item12',
      'Item desc': 'l',
      'price': 18000,
    },
  ];
}

String rndomizerImage(int index) {
  return Faker().image.image(
    keywords: ['item'],
    random: index.isEven,
  );
}

class GridItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final VoidCallback onTap;

  const GridItem(
      {super.key,
      required this.item,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    String imageUrl = rndomizerImage(index);
    String itemName = item['Item Name'] ?? 'Default Item Name';
    String itemdesc = item['Item desc'] ?? 'Default Item desc';
    String price = (item['price'] ?? 0).toString();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color.fromARGB(255, 62, 155, 232),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Text(
                itemName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "IDR $price",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
